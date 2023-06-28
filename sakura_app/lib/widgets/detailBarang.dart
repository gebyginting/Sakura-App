import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sakura_app/provider/myModel.dart';

import '../reusableWidgets/myAppbar.dart';
import 'editBarang.dart';

class DetailBarangScreen extends StatefulWidget {
  final Barang barang;
  const DetailBarangScreen({required this.barang, super.key});

  @override
  State<DetailBarangScreen> createState() => _DetailBarangScreenState();
}

class _DetailBarangScreenState extends State<DetailBarangScreen> {
  @override
  Widget build(BuildContext context) {
    // final myHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: MyAppBar(title: 'Rincian Barang'),
      body: Align(
        alignment: Alignment.topCenter,
        child: Card(
          margin: EdgeInsets.only(top: 15),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Color.fromRGBO(249, 241, 241, 1),
          elevation: 8,
          child: SizedBox(
            height: 440,
            width: 330,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      EditBarangScreen(barang: widget.barang),
                                  fullscreenDialog: true));
                        },
                        icon: Icon(Icons.edit)),
                  ),
                  Image.asset(
                    widget.barang.image,
                    height: 120,
                    width: 120,
                    fit: BoxFit.contain,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 22),
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              offset: Offset(0, 0.8),
                            ),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 22, left: 12),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Nama         : ",
                                  style: GoogleFonts.notoSansThai(fontSize: 14),
                                ),
                                Flexible(
                                  child: Text(
                                    widget.barang.nama,
                                    style: GoogleFonts.notoSansThai(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 2,
                                    softWrap: true,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Harga / pc : ",
                                    style:
                                        GoogleFonts.notoSansThai(fontSize: 14)),
                                Text(
                                  NumberFormat.currency(
                                          locale: "id",
                                          symbol: "Rp ",
                                          decimalDigits: 0)
                                      .format(widget.barang.harga),
                                  style: GoogleFonts.notoSansThai(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text("Stok            : ",
                                    style:
                                        GoogleFonts.notoSansThai(fontSize: 14)),
                                Text(
                                  widget.barang.stok.toString(),
                                  style: GoogleFonts.notoSansThai(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text("Kode           : ",
                                    style:
                                        GoogleFonts.notoSansThai(fontSize: 14)),
                                Text(
                                  widget.barang.kode,
                                  style: GoogleFonts.notoSansThai(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          backgroundColor: Color.fromRGBO(
                              241, 33, 90, 1), // Background color
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsetsDirectional.symmetric(
                              horizontal: 2, vertical: 2),
                          child: Text(
                            'Hapus',
                            style: GoogleFonts.outfit(fontSize: 14),
                          ),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
