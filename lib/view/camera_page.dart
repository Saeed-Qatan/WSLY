import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

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
    _initializeCamera(); // تشغيل الكاميرا بشكل تلقائي
  }

  Future<void> _initializeCamera() async {
    final backCamera = widget.cameras.firstWhere(
      (camera) => camera.lensDirection == CameraLensDirection.back,
    );

    _cameraController = CameraController(
      backCamera,
      ResolutionPreset.high, // دقة عالية لعرض أفضل
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

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          _cameraController == null || !_cameraController!.value.isInitialized
              ? Center(child: CircularProgressIndicator())
              : Stack(
                children: [
                  // عرض الكاميرا بشكل كامل
                  CameraPreview(_cameraController!),

                  // زر لإغلاق الكاميرا في الزاوية العلوية
                  Positioned(
                    top: 30,
                    left: 20,
                    child: IconButton(
                      icon: Icon(Icons.close, color: Colors.white, size: 30),
                      onPressed: () {
                        Navigator.pop(context); // إغلاق الكاميرا والعودة
                      },
                    ),
                  ),

                  // إضافة زر الالتقاط في الأسفل
                  Positioned(
                    bottom: 100,
                    left: MediaQuery.of(context).size.width * 0.4,
                    child: ElevatedButton(
                      onPressed: _takePicture,
                      child: Icon(
                        Icons.camera_alt,
                        size: 40,
                        color: Colors.white,
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                        backgroundColor: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),

                  // عرض الصورة التي تم التقاطها
                  if (_capturedImage != null)
                    Positioned(
                      bottom: 20,
                      left: MediaQuery.of(context).size.width * 0.4,
                      child: Image.file(
                        File(_capturedImage!.path),
                        height: 150,
                      ),
                    ),
                ],
              ),
    );
  }
}
