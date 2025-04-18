import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/order_view_model.dart';

class CameraPage extends StatefulWidget {
  final List<CameraDescription> cameras;
  const CameraPage({super.key, required this.cameras});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _controller;
  bool _isReady = false;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    _controller = CameraController(widget.cameras[0], ResolutionPreset.medium);
    await _controller.initialize();
    if (!mounted) return;
    setState(() => _isReady = true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("التقاط صورة")),
      body: _isReady
          ? Consumer<OrderViewModel>(
              builder: (context, orderVM, child) {
                return Stack(
                  children: [
                    CameraPreview(_controller),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // عرض صورة مصغرة بعد الالتقاط
                            if (orderVM.capturedImage != null)
                              Column(
                                children: [
                                  Image.file(
                                    orderVM.capturedImage!,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          orderVM.clearCapturedImage();
                                        },
                                        child: Text("إعادة الالتقاط"),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("استخدام الصورة"),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                            // زر التقاط الصورة
                            if (orderVM.capturedImage == null)
                              FloatingActionButton(
                                onPressed: () async {
                                  await orderVM.captureImage(_controller);
                                },
                                backgroundColor: Colors.deepPurple,
                                child: Icon(Icons.camera_alt, color: Colors.white),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
