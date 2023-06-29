import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sakura_app/Components/getStart.dart';
 


bool _obscurePassword = true;

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    final myHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                  top: 0,
                  child: Image.asset(
                    'assets/cover.png',
                  )),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(36),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(children: [
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
                      ]),
                      Text(
                        'Sign Up',
                        style: TextStyle(
                          height: 1,
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: myHeight * 0.1),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Masukkan Nama Toko',
                          labelText: 'Nama Toko',
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 88, 87, 87),
                          ),
                          filled: true,
                          fillColor: Color.fromARGB(255, 255, 255, 255),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      SizedBox(height: 17),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Masukkan Email',
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 88, 87, 87),
                          ),
                          filled: true,
                          fillColor: Color.fromARGB(255, 255, 255, 255),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      SizedBox(height: 17),
                      TextField(
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          hintText: 'Masukkan Password',
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 88, 87, 87),
                          ),
                          filled: true,
                          fillColor: Color.fromARGB(255, 255, 255, 255),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
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
                      SizedBox(height: 17),
                      TextField(
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          hintText: 'Konfirmasi Password',
                          labelText: 'Konfirmasi Password',
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 88, 87, 87),
                          ),
                          filled: true,
                          fillColor: Color.fromARGB(255, 255, 255, 255),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
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
                      SizedBox(height: 13),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Getstart()),
                          );
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 18),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.pink[500],
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 90,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.black,
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              'Atau masuk dengan',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 37, 36, 36),
                                fontSize: 11,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.black,
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
                              border: Border.all(color: Colors.red, width: 2),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: FaIcon(
                                FontAwesomeIcons.twitter,
                                color: Color.fromARGB(255, 108, 186, 250),
                                size: 30,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.red, width: 2),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: FaIcon(
                                FontAwesomeIcons.google,
                                color: Colors.red,
                                size: 30,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.red, width: 2),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: FaIcon(
                                FontAwesomeIcons.facebookF,
                                color: Colors.blue,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
