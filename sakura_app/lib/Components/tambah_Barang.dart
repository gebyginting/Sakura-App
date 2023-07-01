import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sakura_app/Components/camera.dart';


class TambahBarang extends StatefulWidget {
  const TambahBarang({Key? key}) : super(key: key);

  @override
  State<TambahBarang> createState() => _TambahItemState();
}

class _TambahItemState extends State<TambahBarang> {
 
  @override
  Widget build(BuildContext context) {

    final myHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(239, 239, 239, 1),
        toolbarHeight: myHeight * 0.12,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),color: Colors.black,
          padding: EdgeInsets.only(left: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Tambah Item',
          style: GoogleFonts.notoSansThai(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 15),
              Container(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Color.fromRGBO(249, 241, 241, 1),
                  elevation: 8,
                  child: SizedBox(
                    height: 540,
                    width: 350,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30, right: 5),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => camera(),  
                                ),
                              );
                            },
                            child: Container(
                              width: 180,
                              height: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage('assets/cam.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 22),
                            child: Container(
                              width: 300,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Nama         :",
                                        style: GoogleFonts.notoSansThai(
                                          fontSize: 16,
                                        ),
                                      ),
                                      Expanded(
                                        child: TextFormField(
                                          style: GoogleFonts.notoSansThai(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                            height: 1.5,
                                          ),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              vertical: 8,
                                              horizontal: 12,
                                            ),
                                            isDense: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Harga / pc :",
                                        style: GoogleFonts.notoSansThai(
                                          fontSize: 16,
                                        ),
                                      ),
                                      Expanded(
                                        child: TextFormField(
                                          style: GoogleFonts.notoSansThai(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                            height: 1.8,
                                          ),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              vertical: 4,
                                              horizontal: 12,
                                            ),
                                            isDense: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Stok            :",
                                        style: GoogleFonts.notoSansThai(
                                          fontSize: 16,
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: TextFormField(
                                                style: GoogleFonts.notoSansThai(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.bold,
                                                  height: 1.5,
                                                ),
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                    vertical: 6,
                                                    horizontal: 12,
                                                  ),
                                                  isDense: true,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              "pcs                ",
                                              maxLines: 2,
                                              style: GoogleFonts.notoSansThai(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 6),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Kode           :",
                                        style: GoogleFonts.notoSansThai(
                                          fontSize: 16,
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: TextFormField(
                                            style: GoogleFonts.notoSansThai(
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                              height: 1.5,
                                            ),
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                vertical: 6,
                                                horizontal: 12,
                                              ),
                                              isDense: true,
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => camera(),
                                            ),
                                          );
                                        },
                                        child: Image.asset(
                                          'assets/barcodee.png',
                                          width: 30,
                                          height: 35,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 40),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                              children: [
                                SizedBox(width: 10),
                                OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    side: BorderSide(
                                      color: Color.fromRGBO(241, 33, 90, 1),
                                      width: 2,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4,
                                      horizontal: 16,
                                    ),
                                    child: Text(
                                      'Batal',
                                      style: GoogleFonts.outfit(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 101),
                                ElevatedButton(
                                  onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => TambahBarang()));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    primary: Color.fromRGBO(241, 33, 90, 1),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4,
                                      horizontal: 16,
                                    ),
                                    child: Text(
                                      'Simpan',
                                      style: GoogleFonts.outfit(fontSize: 14),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
