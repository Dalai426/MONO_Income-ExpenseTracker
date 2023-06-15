import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lab11/WalletWidgets/Wallet.dart';
import 'package:lab11/model/Bills.dart';
import 'package:lab11/widgets/SendAgain.dart';
import 'package:lab11/widgets/TransactionsHistory.dart';
import 'package:lab11/widgets/homepage.dart';
import 'package:provider/provider.dart';

import '../Arguments.dart';
import '../Navigation.dart';
import '../Provider/Provider.dart';
import '../model/DropDownMenu.dart';
import 'MyWalletScreen.dart';

class AddExpenceScreen extends StatefulWidget {
  const AddExpenceScreen({super.key, required this.title});

  final String title;

  @override
  State<AddExpenceScreen> createState() => _AddExpenceScreenState();
}

class _AddExpenceScreenState extends State<AddExpenceScreen> {
  final amountController = TextEditingController();
  final dateController = TextEditingController();

  late List<Items> item;
  late Items _selectedItem;

  @override
  void initState() {
    super.initState();

    // Initialize list and dropdown value
    item = [
      Items(id: "1", name: "Netflix", img: "img/net.png"),
      Items(id: "2", name: "Ntx", img: "img/wallet.png"),
      Items(id: '3', name: 'Youtube', img: "img/image 6.png"),
      Items(id: '4', name: 'Electricity', img: "img/Vector.png"),
      Items(id: '5', name: 'House Rent', img: "img/Vector (1).png"),
      Items(id: '6', name: 'Spotify', img: "img/image 16.png"),
      Items(id: '7', name: 'Gen', img: "img/image 11.png"),
    ];
    _selectedItem = item.first;
  }

  TextStyle ts1 = TextStyle(
    color: Color(0xFF666666),
  );

  double height1 = 10;
  double height2 = 20;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SizedBox(
        height: 80,
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 17,
                color: Colors.white,
              ),
            ),
            Text(
              "Add Expense",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 17),
            ),
            CircleAvatar(
                backgroundColor: Color.fromRGBO(255, 255, 255, 0.06),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add_alert_rounded,
                    color: Colors.white,
                  ),
                  // color: Color.fromRGBO(255, 255, 255, 0.06),
                  padding: new EdgeInsets.all(5),
                ))
          ],
        ),
      ),
      SizedBox(
        height: 50,
      ),
      Container(
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset(0, 5),
                    blurRadius: 25)
              ]),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('NAME', style: ts1),
                SizedBox(height: height1),
                DropdownButtonFormField<Items>(
                  isDense: true,
                  value: _selectedItem,
                  onChanged: (Items? newValue) {
                    setState(() {
                      _selectedItem = newValue!;
                    });
                  },
                  items: item.map((Items item) {
                    return DropdownMenuItem<Items>(
                        value: item,
                        child: Row(
                          children: [
                            Container(
                              width: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage('${item.img}'),
                                  fit: BoxFit.contain,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("${item.name}"),
                          ],
                        ));
                  }).toList(),
                  icon: Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: Color(0xFF888888),
                  ),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF438883),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      contentPadding: EdgeInsets.only(right: 10, left: 15)),
                ),
                SizedBox(height: height2),
                Text(
                  'AMOUNT',
                  style: ts1,
                ),
                SizedBox(height: height1),
                TextField(
                  textAlignVertical: TextAlignVertical.top,
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 0, top: 13),
                        child: Text(
                          "\$",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF438883),
                              fontSize: 17),
                        ),
                      ),
                      contentPadding: EdgeInsets.only(left: 0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF438883),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Amount',
                      hintStyle: TextStyle(fontWeight: FontWeight.w400),
                      suffix: TextButton(
                          onPressed: () {
                            amountController.clear();
                          },
                          child: Text(
                            'Clear',
                            style: TextStyle(
                                color: Color(0xFF438883),
                                fontWeight: FontWeight.w500),
                          ))),
                  style: TextStyle(
                      color: Color(0xFF438883), fontWeight: FontWeight.w500),
                ),
                SizedBox(height: height2),
                Text(
                  'DATE',
                  style: ts1,
                ),
                SizedBox(height: height1),
                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    TextField(
                      readOnly: true,
                      textAlignVertical: TextAlignVertical.top,
                      controller: dateController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF438883),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Date',
                          hintStyle: TextStyle(fontWeight: FontWeight.w400)),
                      style: TextStyle(
                          color: Color(0xFF438883),
                          fontWeight: FontWeight.w500),
                    ),
                    IconButton(
                      onPressed: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101));

                        if (pickedDate != null) {
                          print(
                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16
                          //you can implement different kind of Date Format here according to your requirement

                          setState(() {
                            dateController.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                      icon: Icon(Icons.calendar_month_rounded),
                      color: Color(0xFF888888),
                    )
                  ],
                ),
                SizedBox(height: height2),
                Text('INVOICE', style: ts1),
                SizedBox(height: height1),
                DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(10),
                  padding: EdgeInsets.all(15),
                  color: Color(0xFF888888),
                  dashPattern: [8, 3],
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      child: GestureDetector(
                        onTap: () => {onTap()},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_circle_outlined,
                              color: Color(0xFF666666),
                              size: 16,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Add Invoice',
                              style: TextStyle(
                                  color: Color(0xFF666666), fontSize: 12),
                            )
                          ],
                        ),
                      )),
                )
              ],
            ),
          ))
    ]);
  }

  onTap() {
    try {
      Bills a = new Bills(
          id: _selectedItem.id,
          name: _selectedItem.name,
          amount: double.parse(amountController.text),
          date: new DateFormat("yyyy-MM-dd").parse(dateController.text),
          img: _selectedItem.img);
      Provider.of<ProviderP>(context, listen: false).addInvoice(a);
      Navigator.pushNamed(context, '/home',
          arguments: Arguments(MyWalletScreen(title: "home"), 2));
    } on Exception catch (_) {
      Navigator.pushNamed(context, '/home',
          arguments: Arguments(MyWalletScreen(title: "home"), 2));
    }
  }
}
