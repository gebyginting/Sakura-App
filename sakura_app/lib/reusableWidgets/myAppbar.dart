import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({required this.title, required this.iconback});
  final String title;
  final bool iconback;

  @override
  Widget build(BuildContext context) {
    final myHeight = MediaQuery.of(context).size.height;
    return AppBar(
      // iconTheme: IconThemeData(
      //     // color: Colors.black,
      //     ),
      leading: iconback
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset('assets/backIcon.png'),
              iconSize: 10,
            )
          : Image.asset('assets/hider.png'),
      title: Text(
        title,
        style: GoogleFonts.notoSansThai(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      toolbarHeight: myHeight * 0.8,
      backgroundColor: Color.fromRGBO(239, 239, 239, 1),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
