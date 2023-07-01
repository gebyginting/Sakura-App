import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sakura_app/reusableWidgets/myAppbar.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<bool> _values = [false];
  var label_format = GoogleFonts.notoSansThai(
    fontSize: 12.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  @override
  Widget build(BuildContext context) {
    final myHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: MyAppBar(title: 'Profile'),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: myHeight * 0.285,
              width: 500,
              // Mengatur tinggi kontainer gambar
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'assets/dash.png'), // Mengatur gambar latar belakang
                    fit: BoxFit.fitWidth),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset('assets/profile.jpg'),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Jhon Anzep",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(width: 4.0),
                            Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 18,
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          "@jhonsaja",
                          style: TextStyle(fontSize: 14, color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "8",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                Text("barang",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ))
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 35),
                              child: Column(
                                children: [
                                  Text("4",
                                      style: TextStyle(
                                        fontSize: 15,
                                      )),
                                  Text("barang", style: TextStyle(fontSize: 15))
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 4,
                    color: Color.fromRGBO(249, 241, 241, 1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SwitchListTile(
                          dense: true,
                          title: Text(
                            'Rotasi Layar',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                ?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                          ),
                          value: _values[0],
                          activeColor: Color.fromRGBO(241, 33, 90, 1),
                          onChanged: (bool value) {
                            setState(() {
                              _values[0] = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 4,
                    color: Color.fromRGBO(249, 241, 241, 1),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Email",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Spacer(),
                              Text(
                                "jhonanzep@gmail.com",
                                style: TextStyle(color: Colors.black54),
                              )
                            ],
                          ),
                          SizedBox(height: 16.0),
                          Row(
                            children: [
                              Text(
                                "No.Handphone",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Spacer(),
                              Text(
                                "+62 1255487904",
                                style: TextStyle(color: Colors.black54),
                              )
                            ],
                          ),
                          SizedBox(height: 16.0),
                          Row(
                            children: [
                              Text(
                                "Dibuat",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Spacer(),
                              Text(
                                "28 April 2023",
                                style: TextStyle(color: Colors.black54),
                              )
                            ],
                          ),
                          SizedBox(height: 16.0),
                          Row(
                            children: [
                              Text(
                                "Password",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black54,
                              ),
                            ],
                          ),
                          SizedBox(height: 16.0),
                          Row(
                            children: [
                              Text(
                                "Informasi Alamat",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black54,
                              ),
                            ],
                          ),
                          SizedBox(height: 16.0),
                          Row(
                            children: [
                              Text(
                                "Keluar",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black54,
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
          ],
        ),
      ),
    );
  }
}
