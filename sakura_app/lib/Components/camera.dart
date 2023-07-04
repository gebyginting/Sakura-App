// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// void main() {
//   runApp(const CameraApp());
// }

// /// CameraApp is the Main Application.
// class CameraApp extends StatefulWidget {
//   /// Default Constructor
//   const CameraApp({Key? key}) : super(key: key);

//   @override
//   State<CameraApp> createState() => _CameraAppState();
// }


// class _CameraAppState extends State<CameraApp> {
//   late File? _imageFile = null;

//   Future<void> _pickImage(ImageSource source) async {
//     final picker = ImagePicker();
//     final pickedImage = await picker.getImage(source: source);
//     setState(() {
//       if (pickedImage != null) {
//         _imageFile = File(pickedImage.path);
//       }
//     });
//   }
//   }

