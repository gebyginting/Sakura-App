import 'package:flutter/material.dart';
import 'package:sakura_app/Components/getStart.dart';
import 'package:sakura_app/widgets/verifikasi.dart';

class Lupa_password extends StatefulWidget {
  const Lupa_password({Key? key}) : super(key: key);

  @override
  State<Lupa_password> createState() => _Lupa_passwordState();
}

class _Lupa_passwordState extends State<Lupa_password> {
  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 3), () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Verification(),
              ));
        });

        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: Color.fromRGBO(240, 234, 234, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: Color.fromRGBO(241, 33, 90, 1), width: 2.0),
          ),
          content: SizedBox(
            width: 400,
            height: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 50, 50, 40),
                  child: Image.asset('assets/Subtract.png'),
                ),
                Text(
                  'Kode Verifikasi Telah\n     berhasil dikirim.',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
                child: Stack(children: [
              Positioned(
                top: 0,
                child: Image.asset('assets/cover1.png', width: width),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(36),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                                size: 30,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: width * 0.2),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Lupa Password?',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.pink[600],
                              ),
                            )),
                        SizedBox(height: 25),
                        Text(
                          'Masukkan email yang Anda gunakan saat mendaftar akun dan kode verifikasi akan dikirim.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Masukkan Email',
                            labelText: 'Email',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 88, 87, 87)),
                            filled: true,
                            fillColor: Color.fromARGB(255, 255, 255, 255),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                        SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () {
                            _showConfirmationDialog();
                          },
                          child:
                              Text('Lanjutkan', style: TextStyle(fontSize: 15)),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.pink[500],
                              padding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 113),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)))),
                        ),
                      ]),
                ),
              ),
            ]))));
  }
}
