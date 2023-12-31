import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sakura_app/Components/tambah_Kasbon.dart';
import 'package:sakura_app/widgets/detailKasbon.dart';
import 'package:sakura_app/widgets/tandatangan.dart';
import '../provider/myProvider.dart';
import 'edit_kasbon.dart'; // Import the EditKasbon screen

class HalamanKasbon extends StatelessWidget {
  const HalamanKasbon({Key? key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CardData>(
      builder: (context, cardData, _) {
        return Scaffold(
          appBar: cardData.isSelecting
              ? _buildSelectionAppBar(context, cardData)
              : _buildAppBar(context, cardData),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Belum Bayar (${cardData.cardDataList.length})",
                      style: GoogleFonts.notoSansThai(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Color.fromRGBO(249, 241, 241, 1),
                  elevation: 4,
                  child: SizedBox(
                    height: 500,
                    width: 440,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: cardData.cardDataList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final card = cardData.cardDataList[index];
                        return FractionallySizedBox(
                          widthFactor: 0.9,
                          heightFactor: 0.9,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => DetailKasbon()));
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              elevation: 4,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          card['nama'],
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                          ),
                                        ),
                                        Checkbox(
                                          value: card['isChecked'] ?? false,
                                          onChanged: (value) {
                                            cardData.toggleCardSelection(index);
                                          },
                                          activeColor:
                                              Color.fromRGBO(241, 33, 90, 1),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      card['harga'],
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                          'assets/Rectangle 58.png',
                                          width: 65,
                                          height: 65,
                                        ),
                                        Image.asset(
                                          'assets/Rectangle 59.png',
                                          width: 65,
                                          height: 65,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: SizedBox(
            height: 200,
            width: 200,
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TambahKasbon(),
                            fullscreenDialog: true),
                      );
                    },
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.add,
                      color: Color.fromRGBO(241, 33, 90, 1),
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  AppBar _buildSelectionAppBar(BuildContext context, CardData cardData) {
    return AppBar(
      backgroundColor: Color.fromRGBO(241, 33, 90, 1),
      leading: IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          cardData.removeSelectedIndices();
        },
      ),
      title: Text('${cardData.selectedIndices.length} dipilih'),
      actions: [
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            cardData.removeSelectedIndices();
          },
        ),
        IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            final index = cardData.selectedIndices[0];
            final selectedCard = cardData.cardDataList[index];

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditKasbon(
                  index: index,
                  initialData: selectedCard,
                ),
              ),
            );
          },
        )
      ],
    );
  }

  AppBar _buildAppBar(BuildContext context, CardData cardData) {
    final myHeight = MediaQuery.of(context).size.height;
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.black, // <-- SEE HERE
      ),
      title: Text(
        'Daftar Kasbon',
        style: GoogleFonts.notoSansThai(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      leading: Image.asset('assets/hider.png'),
      centerTitle: true,
      toolbarHeight: myHeight * 0.075,
      backgroundColor: Color.fromRGBO(239, 239, 239, 1),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// // import 'package:sakura_app/Components/Tambah_Barang.dart';
// // import 'package:sakura_app/Components/Tambah_Kasbon.dart';
// import 'package:sakura_app/provider/adduserkasbon.dart';
// // import 'package:sakura_app/provider/user.dart';
// import '../provider/myProvider.dart';

// class HalamanKasbon extends StatelessWidget {
//   const HalamanKasbon({Key? key, required this.name, required this.harga})
//       : super(key: key);
//   final String name;
//   final String harga;
//   @override
//   Widget build(BuildContext context) {
//     final userProvider = Provider.of<KasbonProvider>(context);
//     final name = userProvider.name;
//     final harga = userProvider.harga;
//     return ChangeNotifierProvider<CardData>(
//       create: (_) => CardData(),
//       child: Consumer<CardData>(builder: (context, cardData, _) {
//         return Scaffold(
//           appBar: cardData.isSelecting
//               ? _buildSelectionAppBar(context, cardData)
//               : _buildAppBar(context, cardData),
//           body: Column(
//             children: [
//               SizedBox(height: 10),
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Align(
//                   alignment: Alignment.topLeft,
//                   child: Text(
//                     "Belum Bayar (${cardData.cardDataList.length})",
//                     style: GoogleFonts.notoSansThai(
//                       fontSize: 14.0,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//               ),
//               Card(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 color: Color.fromRGBO(249, 241, 241, 1),
//                 elevation: 4,
//                 child: SizedBox(
//                   height: 500,
//                   width: 440,
//                   child: GridView.builder(
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                     ),
//                     itemCount: cardData.cardDataList.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       final card = cardData.cardDataList[index];
//                       return FractionallySizedBox(
//                         widthFactor: 0.9,
//                         heightFactor: 0.9,
//                         child: GestureDetector(
//                           onTap: () {
//                             cardData.toggleCardSelection(index);
//                           },
//                           child: Card(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                             elevation: 4,
//                             child: Padding(
//                               padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text(
//                                         '$name',
//                                         style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                         ),
//                                       ),
//                                       Checkbox(
//                                         value: card['isChecked'],
//                                         onChanged: (value) {
//                                           cardData.toggleCardSelection(index);
//                                         },
//                                         activeColor:
//                                             Color.fromRGBO(241, 33, 90, 1),
//                                       ),
//                                     ],
//                                   ),
//                                   Text(
//                                     ('$harga'),
//                                     style: TextStyle(
//                                       fontSize: 13,
//                                       color: Colors.grey,
//                                     ),
//                                   ),
//                                   SizedBox(height: 20),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Image.asset(
//                                         'assets/Rectangle 58.png',
//                                         width: 70,
//                                         height: 70,
//                                       ),
//                                       SizedBox(width: 4),
//                                       Image.asset(
//                                         'assets/Rectangle 59.png',
//                                         width: 70,
//                                         height: 70,
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       }),
//     );
//   }

//   AppBar _buildSelectionAppBar(BuildContext context, CardData cardData) {
//     return AppBar(
//       backgroundColor: Color.fromRGBO(241, 33, 90, 1),
//       leading: IconButton(
//         icon: Icon(Icons.close),
//         onPressed: () {
//           cardData.removeSelectedIndices();
//         },
//       ),
//       title: Text('${cardData.selectedIndices.length} dipilih'),
//       actions: [
//         IconButton(
//           icon: Icon(Icons.delete),
//           onPressed: () {
//             cardData.removeSelectedIndices();
//           },
//         ),
//       ],
//     );
//   }

//   AppBar _buildAppBar(BuildContext context, CardData cardData) {
//     final myHeight = MediaQuery.of(context).size.height;
//     return AppBar(
//       title: Text(
//         'Daftar Kasbon',
//         style: TextStyle(
//           fontSize: 18,
//           fontWeight: FontWeight.bold,
//           color: Colors.black,
//         ),
//       ),
//       centerTitle: true,
//       toolbarHeight: myHeight * 0.10,
//       backgroundColor: Color.fromRGBO(239, 239, 239, 1),
//     );
//   }
// }
