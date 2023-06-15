import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lab11/Screens/ConnectWalletScreen.dart';
import 'package:provider/provider.dart';
import '../../model/transaction.dart';
import '../Arguments.dart';
import '../Provider/Provider.dart';
import '../Screens/AddExpenceScreen.dart';
import '../model/Bills.dart';

class AddYourDebitCard extends StatefulWidget {
  const AddYourDebitCard({Key? key}) : super(key: key);

  @override
  State<AddYourDebitCard> createState() => _UpBills();
}

class _UpBills extends State<AddYourDebitCard> {
  FocusNode myfocus = new FocusNode();
  FocusNode myfocus1 = new FocusNode();
  FocusNode myfocus2 = new FocusNode();
  FocusNode myfocus3 = new FocusNode();
  FocusNode myfocus4 = new FocusNode();


  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: 1000,
            alignment: Alignment.center,
            child: Container(
              width: 300,
              child: Stack(
                children: [
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "img/Effects (1).png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    child: Text("Debit Card",
                        style: GoogleFonts.ibmPlexMono(
                            fontSize: 11,
                            color: Colors.white,
                            fontWeight: FontWeight.w600)),
                    width: 40,
                    left: 20,
                    top: 20,
                  ),
                  Positioned(
                    child: Text("Mono",
                        style: GoogleFonts.ibmPlexMono(
                            fontSize: 11,
                            color: Colors.white,
                            fontWeight: FontWeight.w600)),
                    right: 20,
                    top: 20,
                  ),
                  Positioned(
                    child: Text("${context.read<ProviderP>().cardNumber}",
                        style: GoogleFonts.ibmPlexMono(
                            fontSize: 11,
                            color: Colors.white,
                            fontWeight: FontWeight.w700)),
                    left: 55,
                    bottom: 60,
                  ),
                  Positioned(
                    child: Text("${context.read<ProviderP>().cardHolderName}",
                        style: GoogleFonts.ibmPlexMono(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.w400)),
                    left: 20,
                    bottom: 30,
                  ),
                  Positioned(
                    child: Text("${context.read<ProviderP>().expiryDate}",
                        style: GoogleFonts.ibmPlexMono(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.w400)),
                    right: 20,
                    bottom: 30,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 75, left: 20),
                    child: Image(
                      image: AssetImage("img/EMV Chip.png"),
                      width: 30,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Add your debit Card',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              )),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: 350,
              child: Text(
                'This card must be connected to a bank account under your name',
                style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
              )),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                TextField(
                  focusNode: myfocus,
                  textAlignVertical: TextAlignVertical.top,
                  onChanged: (value) {
                    setState(() {
                      Provider.of<ProviderP>(context,listen: false).cardHolderName = value.toUpperCase();
                    });
                  },
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'NAME ON CARD',
                    labelStyle:
                        TextStyle(fontSize: 13, color: Color(0xFF666666)),
                    contentPadding: EdgeInsets.only(left: 20, right: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF438883),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    hintStyle: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  style: TextStyle(
                      color: Color(0xFF438883), fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextField(
                      focusNode: myfocus1,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(16),
                        FilteringTextInputFormatter.deny(RegExp(r"\s")),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      textAlignVertical: TextAlignVertical.top,
                      onChanged: (value) {
                        String formattedValue = formatCardNumber(value);
                        setState(() {
                          Provider.of<ProviderP>(context,listen: false).cardNumber = formattedValue;
                        });
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'DEBIT CARD NUMBER',
                        labelStyle:
                            TextStyle(fontSize: 13, color: Color(0xFF666666)),
                        contentPadding: EdgeInsets.only(left: 20, right: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF438883),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        hintStyle: TextStyle(fontWeight: FontWeight.w400),
                      ),
                      style: TextStyle(
                          color: Color(0xFF438883),
                          fontWeight: FontWeight.w500),
                    )),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        child: TextField(
                      focusNode: myfocus2,
                      textAlignVertical: TextAlignVertical.top,
                      onChanged: (value) {
                        setState(() {
                          Provider.of<ProviderP>(context,listen: false).cvvNumber = value;
                        });
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(3),
                        FilteringTextInputFormatter.deny(RegExp(r"\s")),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        labelText: 'CVC',
                        labelStyle:
                            TextStyle(fontSize: 13, color: Color(0xFF666666)),
                        contentPadding: EdgeInsets.only(left: 20, right: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF438883),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        hintStyle: TextStyle(fontWeight: FontWeight.w400),
                      ),
                      style: TextStyle(
                          color: Color(0xFF438883),
                          fontWeight: FontWeight.w500),
                    )),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextField(
                      focusNode: myfocus3,
                      textAlignVertical: TextAlignVertical.top,
                      onChanged: (value) {
                        setState(() {
                          Provider.of<ProviderP>(context,listen: false).expiryDate = value;
                        });
                      },
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        labelText: 'EXPIRATION MM/YY',
                        labelStyle:
                            TextStyle(fontSize: 13, color: Color(0xFF666666)),
                        contentPadding: EdgeInsets.only(left: 20, right: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF438883),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        hintStyle: TextStyle(fontWeight: FontWeight.w400),
                      ),
                      style: TextStyle(
                          color: Color(0xFF438883),
                          fontWeight: FontWeight.w500),
                    )),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        child: TextField(
                      focusNode: myfocus4,
                      textAlignVertical: TextAlignVertical.top,
                      onChanged: (val) {
                        setState(() {
                          Provider.of<ProviderP>(context,listen: false).zip = val;
                        });
                      },
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: 'ZIP',
                        labelStyle:
                            TextStyle(fontSize: 13, color: Color(0xFF666666)),
                        contentPadding: EdgeInsets.only(left: 20, right: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF438883),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        hintStyle: TextStyle(fontWeight: FontWeight.w400),
                      ),
                      style: TextStyle(
                          color: Color(0xFF438883),
                          fontWeight: FontWeight.w500),
                    )),
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }

  String formatCardNumber(String input) {
    input = input.replaceAll(' ', '');
    String formatted = '';
    for (int i = 0; i < 16; i++) {
      if (i < input.length) {
        formatted += input[i];
      } else {
        formatted += '*';
      }
      if ((i + 1) % 4 == 0 && i != 15) {
        formatted += '    ';
      }
    }
    return formatted;
  }
}
