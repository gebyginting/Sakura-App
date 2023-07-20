import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ValidationDialog extends StatelessWidget {
  const ValidationDialog({required this.errMsg});
  final String errMsg;

  @override
  Widget build(BuildContext context) {
    final myHeight = MediaQuery.of(context).size.height;
    return AlertDialog(
      title: Text('Login Gagal'),
      content: Text(errMsg),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('OK'),
        ),
      ],
    );
  }
}
