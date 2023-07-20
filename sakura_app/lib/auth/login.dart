import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sakura_app/auth/lupa_Password.dart';
import 'package:sakura_app/auth/signup.dart';

import '../accountDummy/accountList.dart';
import '../accountDummy/accountModel.dart';
import '../reusableWidgets/validationDialog.dart';
import '../widgets/bottomNavbar.dart';

bool _obscurePassword = true;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // Hapus kontroler saat widget tidak lagi digunakan untuk menghindari memory leaks
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final myHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
                child: SingleChildScrollView(
                    child: Stack(children: [
              LayoutBuilder(builder: ((context, constraints) {
                final width = constraints.maxWidth;
                return Center(
                  child: Image.asset('assets/cover.png',
                      width: width, fit: BoxFit.cover),
                );
              })),
              Positioned(
                top: 0,
                child: Image.asset('assets/cover.png', fit: BoxFit.cover),
              ),
              Container(
                padding: EdgeInsets.all(36),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 35),
                    Text('Log in',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    SizedBox(height: myHeight * 0.2),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'Masukkan Email',
                        labelText: 'Email',
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 88, 87, 87)),
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        hintText: 'Masukkan Password',
                        labelText: 'Password',
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 88, 87, 87)),
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Lupa_password()));
                        },
                        child: Text(
                          'Lupa Password',
                          style: TextStyle(
                            color: Colors.pink[600],
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ]),
                    SizedBox(height: 13),
                    ElevatedButton(
                        onPressed: () {
                          // Mendapatkan nilai email dan password dari input TextField
                          String email = _emailController.text.trim();
                          String password = _passwordController.text;

                          if (email.isEmpty || password.isEmpty) {
                            // Jika salah satu atau kedua textfield kosong, tampilkan pesan error
                            showDialog(
                                context: context,
                                builder: (context) => ValidationDialog(
                                    errMsg:
                                        'Email dan password tidak boleh kosong.'));
                          } else {
                            // Cek apakah email dan password sesuai dengan akun dummy
                            bool isLoginSuccessful = false;
                            for (UserAccount account in dummyAccounts) {
                              if (account.email == email &&
                                  account.password == password) {
                                isLoginSuccessful = true;
                                break;
                              }
                            }

                            if (isLoginSuccessful) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyBottomNavbar(),
                                ),
                              );
                            } else {
                              // Jika login gagal, tampilkan pesan kesalahan atau notifikasi
                              showDialog(
                                  context: context,
                                  builder: (context) => ValidationDialog(
                                      errMsg: 'Email atau password salah!!'));
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(241, 33, 90, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(12.0) //border
                                ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 90, vertical: 18.0)),
                        child: Text(
                          "Log in",
                          style: GoogleFonts.outfit(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        )),
                    SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Belum punya akun? ',
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'Sign up',
                            style: TextStyle(color: Colors.red),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Signup()),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Color.fromRGBO(154, 154, 154, 1),
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            'Atau masuk dengan',
                            style: TextStyle(
                              color: const Color.fromRGBO(154, 154, 154, 1),
                              fontSize: 11,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Color.fromRGBO(154, 154, 154, 1),
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Color.fromRGBO(241, 33, 90, 1),
                                width: 1),
                          ),
                          child: IconButton(
                            onPressed: () {
                              // Aksi ketika tombol Twitter ditekan
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.twitter,
                              color: Color.fromARGB(255, 108, 186, 250),
                              size: 22,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Color.fromRGBO(241, 33, 90, 1),
                                width: 1),
                          ),
                          child: IconButton(
                            onPressed: () {
                              // Aksi ketika tombol Google ditekan
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.google,
                              color: Colors.red,
                              size: 22,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Color.fromRGBO(241, 33, 90, 1),
                                width: 1),
                          ),
                          child: IconButton(
                            onPressed: () {
                              // Aksi ketika tombol Facebook ditekan
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.facebookF,
                              color: Colors.blue,
                              size: 22,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ])))));
  }
}
