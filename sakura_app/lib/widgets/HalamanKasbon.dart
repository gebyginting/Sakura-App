// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class HalamanKasbon extends StatefulWidget {
//   const HalamanKasbon({Key? key});

//   @override
//   State<HalamanKasbon> createState() => _HalamanKasbonState();
// }

// class _HalamanKasbonState extends State<HalamanKasbon> {
//   var labelFormat = GoogleFonts.notoSansThai(
//     fontSize: 14.0,
//     fontWeight: FontWeight.bold,
//     color: Colors.black,
//   );

//   List<bool> isCheckedList = [false, false, false, false];

//   @override
//   Widget build(BuildContext context) {
//     final myHeight = MediaQuery.of(context).size.height;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Daftar Kasbon',
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//         ),
//         centerTitle: true,
//         toolbarHeight: myHeight * 0.10,
//         backgroundColor: Color.fromRGBO(239, 239, 239, 1),
//       ),
//       body: Column(
//         children: [
//           SizedBox(
//             height: 10,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Align(
//               alignment: Alignment.topLeft,
//               child: Text(
//                 "Belum Bayar (4)",
//                 style: labelFormat,
//               ),
//             ),
//           ),
//           Card(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//             color: Color.fromRGBO(249, 241, 241, 1),
//             elevation: 4,
//             child: SizedBox(
//               height: 500,
//               width: 440,
//               child: Stack(
//                 children: [
//                   Expanded(
//                     child: GridView.count(
//                       crossAxisCount: 2,
//                       children: [
//                         // Card 1
//                         buildItemCard('Nama Pembeli 1', 'Rp. 12.000,00', 0),
//                         // Card 2
//                         buildItemCard('Nama Pembeli 2', 'Rp. 15.000,00', 1),
//                         // Card 3
//                         buildItemCard('Nama Pembeli 3', 'Rp. 10.000,00', 2),
//                         // Card 4
//                         buildItemCard('Nama Pembeli 4', 'Rp. 20.000,00', 3),
//                       ],
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 20,
//                     right: 20,
//                     child: FloatingActionButton(
//                       onPressed: () {
//                         // Tambahkan logika untuk aksi FAB di sini
//                       },
//                       backgroundColor: Colors.white,
//                       child: Icon(
//                         Icons.add,
//                         color: Color.fromRGBO(241, 33, 90, 1),
//                         weight: 12,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildItemCard(String nama, String harga, int index) {
//     return FractionallySizedBox(
//       widthFactor: 0.9,
//       heightFactor: 0.9,
//       child: Card(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//         elevation: 4,
//         child: Padding(
//           padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     nama,
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 13,
//                     ),
//                   ),
//                   Checkbox(
//                     value: isCheckedList[index],
//                     onChanged: (value) {
//                       setState(
//                         () {
//                           isCheckedList[index] = value!;
//                           // Hapus komentar di bawah ini jika Anda ingin hanya satu checkbox yang dapat diperiksa pada satu waktu
//                           // for (int i = 0; i < isCheckedList.length; i++) {
//                           //   if (i != index) {
//                           //     isCheckedList[i] = false;
//                           //   }
//                           // }
//                         },
//                       );
//                     },
//                     activeColor: Color.fromRGBO(241, 33, 90, 1),
//                   ),
//                 ],
//               ),
//               Text(
//                 harga,
//                 style: TextStyle(fontSize: 13, color: Colors.grey),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     'assets/img/Rectangle 58.png',
//                     width: 70,
//                     height: 70,
//                   ),
//                   SizedBox(width: 4),
//                   Image.asset(
//                     'assets/img/Rectangle 59.png',
//                     width: 70,
//                     height: 70,
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
