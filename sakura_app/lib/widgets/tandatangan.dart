import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sakura_app/Components/edit_kasbon.dart';
import 'package:signature/signature.dart';

class TandaTangan extends StatefulWidget {
  const TandaTangan({Key? key}) : super(key: key);

  @override
  State<TandaTangan> createState() => _TandaTanganState();
}

class _TandaTanganState extends State<TandaTangan> {
  SignatureController controller = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.white,
    exportBackgroundColor: Color.fromRGBO(241, 33, 90, 1),
  );

  @override
  Widget build(BuildContext context) {
    final myHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, // <-- SEE HERE
        ),
        title: Text(
          'Tanda Tangan',
          style: GoogleFonts.notoSansThai(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        toolbarHeight: myHeight * 0.075,
        backgroundColor: Color.fromRGBO(239, 239, 239, 1),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Card(
            elevation: 4,
            color: Color.fromRGBO(239, 239, 239, 1),
            child: SizedBox(
              height: 350,
              width: 400,
              child: Align(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 380,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: Color.fromRGBO(241, 33, 90, 1),
                            ),
                            child: Signature(
                              controller: controller,
                              width: 360,
                              height: 250,
                              backgroundColor: Color.fromRGBO(241, 33, 90, 1),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 14),
                              child: ElevatedButton(
                                onPressed: () {
                                  controller.clear();
                                },
                                child: Text(
                                  'Ulang',
                                  style: TextStyle(
                                    color: Color.fromRGBO(241, 33, 90, 1),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromRGBO(239, 239, 239, 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                    side: BorderSide(
                                      color: Color.fromRGBO(241, 33, 90, 1),
                                    ),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 30,
                                    vertical: 5.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Navigasi kembali ke halaman EditKasbon
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Simpan',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(241, 33, 90, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 5.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
