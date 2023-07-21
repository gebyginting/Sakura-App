import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sakura_app/provider/myProvider.dart';
import 'package:sakura_app/widgets/tandatangan.dart';

class EditKasbon extends StatefulWidget {
  final int index;
  final Map<String, dynamic> initialData;

  const EditKasbon({
    Key? key,
    required this.index,
    required this.initialData,
  });

  @override
  State<EditKasbon> createState() => _EditKasbonState();
}

class _EditKasbonState extends State<EditKasbon> {
  late TextEditingController _namaPelangganController;
  late TextEditingController _totalHutangController;
  late TextEditingController _catatanController;

  final numberFormat =
      NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0);
  int _currentInputLength = 0;
  int _maxInputLength = 150;

  void initState() {
    super.initState();
    _namaPelangganController =
        TextEditingController(text: widget.initialData['nama']);
    _totalHutangController =
        TextEditingController(text: widget.initialData['harga']);
    _catatanController = TextEditingController(
        text: widget.initialData['catatan']); // Initialize _catatanController
  }

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<RangeDatePicker>(context);
    final myHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(239, 239, 239, 1),
        toolbarHeight: myHeight * 0.12,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          padding: EdgeInsets.only(left: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Edit Kasbon',
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: 15),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Color.fromRGBO(241, 33, 90, 1),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(children: [
                      TextFormField(
                        controller: _namaPelangganController,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Nama Pelanggan',
                          labelStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                          contentPadding: EdgeInsets.all(12),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color.fromRGBO(255, 255, 255, 1),
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color.fromRGBO(255, 255, 255, 1),
                              )),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Total Hutang: Rp  ',
                            style: GoogleFonts.notoSansThai(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                keyboardType: TextInputType.number,
                                maxLength: 7,
                                controller: _totalHutangController,
                                style: GoogleFonts.notoSansThai(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  counterText: '',
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(12),
                                  filled: true,
                                  fillColor: Color.fromRGBO(255, 255, 255, 0.5),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none),
                                ),
                                onChanged: (value) {
                                  final cleanedValue =
                                      value.replaceAll('.', '');
                                  final formattedValue = numberFormat
                                      .format(int.parse(cleanedValue));
                                  _totalHutangController.value =
                                      TextEditingValue(
                                    text: formattedValue,
                                    selection: TextSelection.collapsed(
                                        offset: formattedValue.length),
                                  );
                                }),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.phone,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          labelText: 'No Handphone',
                          labelStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                          contentPadding: EdgeInsets.all(12),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color.fromRGBO(255, 255, 255, 1),
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color.fromRGBO(255, 255, 255, 1),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 3,
                              child: InputDatePickerFormField(
                                fieldLabelText: 'tgl hutang',
                                initialDate: prov.rangeDate.start,
                                firstDate: prov.startDate,
                                lastDate: prov.endDate,
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              flex: 3,
                              child: InputDatePickerFormField(
                                  fieldLabelText: 'jatuh tempo',
                                  initialDate: prov.rangeDate.end,
                                  firstDate: prov.startDate,
                                  lastDate: prov.endDate)),
                          Expanded(
                            child: IconButton(
                                onPressed: () {
                                  prov.pickDateRange(context);
                                },
                                icon: Icon(
                                  Icons.calendar_today_outlined,
                                  color: Color.fromARGB(206, 255, 255, 255),
                                )),
                          )
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Catatan',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        controller: _catatanController,
                        maxLength: _maxInputLength,
                        onChanged: (value) {
                          setState(() {
                            _currentInputLength = value.length;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Tanggal jatuh tempo, dsb.',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 10,
                          ),
                          counterText: '$_currentInputLength/$_maxInputLength',
                          counterStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 10,
                          ),
                          contentPadding: EdgeInsets.all(12),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              width: 1,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        maxLines: null,
                        minLines: 3,
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'TTD Pelanggan',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'KTP Pelanggan',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 70,
                            width: 110,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  spreadRadius: 0,
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => TandaTangan(),
                                      ),
                                    );
                                  },
                                  child: Image.asset(
                                    'assets/Rectangle 58.png',
                                    fit: BoxFit.cover,
                                  ),
                                )),
                          ),
                          Container(
                            height: 70,
                            width: 110,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  spreadRadius: 0,
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/Rectangle 59.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: _saveKasbon,
                            icon: Icon(
                              Icons.save_alt,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _saveKasbon() {
    Map<String, dynamic> updatedKasbon = {
      'nama': _namaPelangganController.text,
      'harga': _totalHutangController.text,
      // Add other fields as needed
    };

    Provider.of<CardData>(context, listen: false)
        .updateKasbon(widget.index, updatedKasbon);

    Navigator.pop(context);
  }
}
