import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart' as path;
import 'package:wsly/viewmodels/camera_view_model.dart';


class CameraPage extends StatefulWidget {
  final List<CameraDescription> cameras;

  const CameraPage({Key? key, required this.cameras}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController? _cameraController;
  XFile? _capturedImage;

  @override
  void initState() {
    super.initState();
    _initializeCamera(); // تشغيل الكاميرا تلقائيًا
  }

  Future<void> _initializeCamera() async {
    final backCamera = widget.cameras.firstWhere(
      (camera) => camera.lensDirection == CameraLensDirection.back,
    );

    _cameraController = CameraController(
      backCamera,
      ResolutionPreset.high,
    );

    try {
      await _cameraController!.initialize();
      if (mounted) setState(() {});
    } catch (e) {
      print("خطأ في تشغيل الكاميرا: $e");
    }
  }

  Future<void> _takePicture() async {
    if (_cameraController != null && _cameraController!.value.isInitialized) {
      final image = await _cameraController!.takePicture();
      setState(() {
        _capturedImage = image;
      });
    }
  }

  Future<void> _sendImage(BuildContext context) async {
    if (_capturedImage == null) return;

    final viewModel = Provider.of<CameraViewModel>(context, listen: false);
    await viewModel.sendImageToServer(File(_capturedImage!.path));

    final message = viewModel.message;
    if (message != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
      viewModel.clearMessage();
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _cameraController == null || !_cameraController!.value.isInitialized
          ? Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                CameraPreview(_cameraController!),

                // زر التقاط الصورة
                if (_capturedImage == null)
                  Positioned(
                    bottom: 50,
                    left: MediaQuery.of(context).size.width * 0.4,
                    child: ElevatedButton(
                      onPressed: _takePicture,
                      child: Icon(Icons.camera_alt, size: 40, color: Colors.white),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                        backgroundColor: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),

                // عرض الصورة وزر الإرسال
                if (_capturedImage != null) ...[
                  Positioned(
                    bottom: 150,
                    left: 20,
                    right: 20,
                    child: Image.file(
                      File(_capturedImage!.path),
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    bottom: 50,
                    left: MediaQuery.of(context).size.width * 0.3,
                    child: Row(
                      children: [
                        ElevatedButton.icon(
                          onPressed: () => _sendImage(context),
                          icon: Icon(Icons.send),
                          label: Text("إرسال"),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                        ),
                        SizedBox(width: 20),
                        ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              _capturedImage = null;
                            });
                          },
                          icon: Icon(Icons.refresh),
                          label: Text("إعادة التصوير"),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                        ),
                      ],
                    ),
                  ),
                ],

                // زر إغلاق
                Positioned(
                  top: 40,
                  left: 20,
                  child: IconButton(
                    icon: Icon(Icons.close, size: 30, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
    );
  }
}
