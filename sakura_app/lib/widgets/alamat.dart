import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../reusableWidgets/myAppbar.dart';

class AlamatPage extends StatefulWidget {
  const AlamatPage({super.key});

  @override
  State<AlamatPage> createState() => _AlamatPageState();
}

class _AlamatPageState extends State<AlamatPage> {
  var label_format = GoogleFonts.notoSansThai(
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    final myHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: MyAppBar(title: 'Alamat'),
      body: Align(
        alignment: AlignmentDirectional.topCenter,
        child: Card(
          margin: EdgeInsetsDirectional.only(top: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Color.fromRGBO(249, 241, 241, 1),
          elevation: 12,
          child: IntrinsicHeight(
            child: SizedBox(
              width: 325,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(
                        'Pemilik',
                        style: label_format,
                      ),
                      subtitle: Text(
                        'Jhon Anzep',
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Alamat',
                        style: label_format,
                      ),
                      subtitle: Text(
                        'Jl. Jamin Ginting No.1',
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Kecamatan',
                        style: label_format,
                      ),
                      subtitle: Text(
                        'Medan Baru',
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Kota',
                        style: label_format,
                      ),
                      subtitle: Text(
                        'Kota Medan',
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Provinsi',
                        style: label_format,
                      ),
                      subtitle: Text(
                        'Sumatera Utara',
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 25, bottom: 20, right: 20),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Ubah',
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 14),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(241, 33, 90, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(16.0) //border
                                  ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 0)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
