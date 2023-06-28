import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sakura_app/provider/myModel.dart';
import 'package:sakura_app/provider/myProvider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../reusableWidgets/myAppbar.dart';

class EditBarangScreen extends StatefulWidget {
  final Barang barang;
  const EditBarangScreen({required this.barang, Key? key}) : super(key: key);

  @override
  _EditBarangScreenState createState() => _EditBarangScreenState();
}

class _EditBarangScreenState extends State<EditBarangScreen> {
  TextEditingController _namaController = TextEditingController();
  TextEditingController _hargaController = TextEditingController();
  TextEditingController _stokController = TextEditingController();
  TextEditingController _kodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _namaController.text = widget.barang.nama;
    _hargaController.text =
        NumberFormat.currency(locale: "id", symbol: "Rp ", decimalDigits: 0)
            .format(widget.barang.harga);
    _stokController.text = widget.barang.stok.toString();
    _kodeController.text = widget.barang.kode;
  }

  @override
  void dispose() {
    _namaController.dispose();
    _hargaController.dispose();
    _stokController.dispose();
    _kodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<AllBarang>(context);

    var label = GoogleFonts.notoSansThai(
        fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black);
    var isiText = GoogleFonts.notoSansThai(
        fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black);
    final myHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: MyAppBar(title: 'Edit Barang'),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Card(
            margin: EdgeInsets.only(top: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Color.fromRGBO(249, 241, 241, 1),
            elevation: 8,
            child: SizedBox(
              width: 325,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                child: Column(
                  children: [
                    Image.asset(
                      widget.barang.image,
                      height: 120,
                      width: 120,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text("Nama         : ", style: label),
                        Expanded(
                          child: TextField(
                            controller: _namaController,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 2.0,
                                ),
                              ),
                            ),
                            style: isiText,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Row(
                      children: [
                        Text("Harga / pc : ", style: label),
                        Expanded(
                          child: TextField(
                            controller: _hargaController,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 2.0,
                                ),
                              ),
                            ),
                            style: isiText,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Row(
                      children: [
                        Text("Stok            : ", style: label),
                        SizedBox(
                          width: 45,
                          child: TextField(
                            controller: _stokController,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 2.0,
                                ),
                              ),
                            ),
                            style: isiText,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Text(' pcs', style: label)
                      ],
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Row(
                      children: [
                        Text("Kode           : ", style: label),
                        SizedBox(
                          width: 130,
                          child: TextField(
                            controller: _kodeController,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 2.0,
                                ),
                              ),
                            ),
                            style: isiText,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: ImageIcon(AssetImage('assets/barcodee.png')),
                        )
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            backgroundColor: Color.fromRGBO(241, 33, 90, 1),
                          ),
                          onPressed: () {
                            // Simpan perubahan ke dalam objek Barang atau lakukan operasi penyimpanan data lainnya
                            String updatedNama = _namaController.text;
                            int updatedHarga =
                                int.tryParse(_hargaController.text) ?? 0;
                            int updatedStok =
                                int.tryParse(_stokController.text) ?? 0;
                            String updatedKode = _kodeController.text;

                            // Contoh pembaruan objek barang
                            widget.barang.nama = updatedNama;
                            widget.barang.harga = updatedHarga;
                            widget.barang.stok = updatedStok;
                            widget.barang.kode = updatedKode;

                            context.read<AllBarang>().listBarang[2].nama =
                                updatedNama;

                            widget.barang.harga = updatedHarga;
                            widget.barang.stok = updatedStok;
                            widget.barang.kode = updatedKode;

                            // Tampilkan snackbar atau lakukan operasi lainnya
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Perubahan disimpan'),
                              ),
                            );
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsetsDirectional.symmetric(
                                horizontal: 2, vertical: 2),
                            child: Text(
                              'Simpan',
                              style: GoogleFonts.outfit(fontSize: 14),
                            ),
                          ),
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