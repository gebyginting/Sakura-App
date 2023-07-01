import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:sakura_app/provider/myModel.dart';
import 'package:sakura_app/widgets/dashboard.dart';

class AllBarang extends ChangeNotifier {
  List<Barang> myList = [
    Barang(
        image: "products/rinsocair.png",
        nama: "Rinso Matic Cair 2.7L",
        harga: 239000,
        stok: 18,
        kode: '8991998111765'),
    Barang(
        image: "products/sempurna16.png",
        nama: "Sempurna Mild 16",
        harga: 24000,
        stok: 22,
        kode: '1234567891011'),
    Barang(
        image: "products/unibis.png",
        nama: "Unibis Crackers",
        harga: 7000,
        stok: 20,
        kode: '887229160218'),
    Barang(
        image: "products/moltorefill.png",
        nama: "Molto Refill All in One 720ML",
        harga: 20000,
        stok: 18,
        kode: '899199811267'),
    Barang(
        image: "products/indomie.png",
        nama: "Indomie (semua varian)",
        harga: 3500,
        stok: 18,
        kode: '8998866200578'),
    Barang(
        image: "products/ultramilk.png",
        nama: "Ultra Milk 250ML",
        harga: 6000,
        stok: 18,
        kode: '8991998111766'),
    Barang(
        image: "products/daia.png",
        nama: "Daia Sachet",
        harga: 1000,
        stok: 18,
        kode: '8998866610261'),
    Barang(
        image: "products/kopi.png",
        nama: "Kopi Tubruk Gadjah 150gr",
        harga: 11000,
        stok: 18,
        kode: '8991998111767'),
    Barang(
        image: "products/pop-mie.jpg",
        nama: "Pop Mie Cup",
        harga: 5000,
        stok: 18,
        kode: '08968606002'),
    Barang(
        image: "products/frisian-flag-kaleng.jpg",
        nama: "Susu Kental Manis Frisian Flag",
        harga: 11000,
        stok: 18,
        kode: '8992753101207'),
    Barang(
        image: "products/gery-salut.jpg",
        nama: "Gery Salut Unibis",
        harga: 6000,
        stok: 22,
        kode: '8992775315095'),
  ];

  //ambil isi dari list barang
  List<Barang> get listBarang => myList.toList();

  //fitur cari barang dengan search box
  searchTextFiled(String query) {
    final suggestions = AllBarang().myList.where((item) {
      final namaBarang = item.nama.toLowerCase();
      final input = query.toLowerCase();

      return namaBarang.contains(input);
    }).toList();

    myList = suggestions;
    notifyListeners();
  }

  //fitur cari barang dengan scan barcode
  Future scanBarcode() async {
    var getCode = await FlutterBarcodeScanner.scanBarcode(
        ('#009922'), "Batal", true, ScanMode.DEFAULT);

    if (getCode != "-1") {
      final scanned = AllBarang().myList.where((item) {
        final barcode = item.kode;
        return barcode == getCode;
      }).toList();
      myList = scanned;
    }
    notifyListeners();
  }

  //untuk hapus barang
  void hapusBarang(Barang barang) {
    myList.remove(barang);
    notifyListeners();
  }
}

class HistoryFilter extends ChangeNotifier {
  final List<String> _historyFilter = [
    "Semua",
    "Hari ini",
    "Kemarin",
    "7 hari terakhir",
    "30 hari terakhir",
  ];

  List<String> get historyFilter => _historyFilter.toList();

  String? _selectedValue = "Semua";

  String? get selectedValue => _selectedValue;
  set selectedValue(val) {
    _selectedValue = val;
    notifyListeners();
  }
}
