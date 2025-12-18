import 'dart:async';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

List<CameraDescription>? cameras;

class CameraApp extends StatefulWidget {
  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  CameraController? controller;

  Future<void> initCamera() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();

  if (cameras != null && cameras!.isNotEmpty) {
    print('Available cameras: $cameras');
    
    // Gunakan resolusi medium untuk emulator (lebih ringan)
    controller = CameraController(
      cameras![0], 
      ResolutionPreset.medium // ← ubah dari max ke medium
    );
    
    controller?.initialize().then((_) {
      if (!mounted) return;
      setState(() {});
    }).catchError((error) {
      print('Camera error: $error');
    });
  } else {
    print('No cameras found');
  }
}

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null || !controller!.value.isInitialized) {
      return Container();
    }
    return MaterialApp(home: Scaffold(body: CameraPreview(controller!)));
  }
}
