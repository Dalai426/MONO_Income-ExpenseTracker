import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lab11/model/Bills.dart';
import 'package:provider/provider.dart';

import '../Arguments.dart';
import '../Provider/Provider.dart';
import '../widgets/homepage.dart';

class BillPaymentLast extends StatefulWidget {
  const BillPaymentLast(
      {super.key,
      required this.title});

  final String title;


  @override
  State<BillPaymentLast> createState() =>
      _AddExpenceScreenState();
}

class _AddExpenceScreenState extends State<BillPaymentLast> {


  var simplesub = TextStyle(color: Color(0xFF666666));
  var anothersub = TextStyle(fontWeight: FontWeight.w500);

  int current = -1;
  int expanded = 1;

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
                  Navigator.pushNamedAndRemoveUntil(context,'/home',(Route<dynamic> route) => false,arguments:Arguments(MyHome(title: "home"),0));
                  context.read<ProviderP>().payingBillNull();
                // Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 17,
                color: Colors.white,
              ),
            ),
            Text(
              "Bill Payment",
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
                    Icons.more_horiz,
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
            ),
            color: Colors.white,
          ),
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 30),
          child: Column(
            children: [
              Container(
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        padding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          color: Color(0xFFFAFAFA),
                          shape: BoxShape.circle,
                        ),
                        child: Image(
                          image: AssetImage("img/check-circle-fill 1.png"),
                          width: 40,
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Text(
                          "Payment Successfully",
                          style: TextStyle(
                              color: Color(0xFF438883),
                              fontWeight: FontWeight.w500,
                              fontSize: 22),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${context.read<ProviderP>().payingbill.name}",
                          style: TextStyle(
                              color: Color(0xFF666666),
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Column(
                            children: [],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text(
                                  "Transaction ",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (expanded == 1) {
                                      expanded = 2;
                                    } else {
                                      expanded = 1;
                                    }
                                  });
                                },
                                child: Container(
                                  child: Icon(
                                    expanded == 1
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_left,
                                    size: 18,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          expanded == 1
                              ? Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Payment method",
                                    style: simplesub,
                                  ),
                                  Text(
                                    "${context.read<ProviderP>().payingbill.paymentmethod}",
                                    style: anothersub,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Status",
                                    style: simplesub,
                                  ),
                                  Text(
                                    "Completed",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF438883)),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Time",
                                    style: simplesub,
                                  ),
                                  Text(
                                    "${DateFormat.jm().format(context.read<ProviderP>().payingbill.date!)}",
                                    style: anothersub,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Date",
                                    style: simplesub,
                                  ),
                                  Text(
                                    "${DateFormat.yMMMd().format(context.read<ProviderP>().payingbill.date!)}",
                                    style: anothersub,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Transaction ID", style: simplesub),
                                  Row(
                                    children: [
                                      Text("209291383247..",
                                          style: anothersub),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Icon(
                                        Icons.layers,
                                        size: 17,
                                        color: Color(0xff438883),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 20),
                                width: 600,
                                height: 1,
                                color: Color(0xFFDDDDDD),
                              ),
                            ],
                          )
                              : SizedBox(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Price",
                                style: TextStyle(color: Color(0xFF666666)),
                              ),
                              Text(
                                "\$  ${context.read<ProviderP>().payingbill.amount!.toStringAsFixed(2)}",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Fee",
                                  style: TextStyle(color: Color(0xFF666666))),
                              Text(
                                "\$  ${context.read<ProviderP>().payingbill.fee.toStringAsFixed(2)}",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            width: 600,
                            height: 1,
                            color: Color(0xFFDDDDDD),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total",
                                  style: TextStyle(
                                      color: Color(0xFF666666),
                                      fontWeight: FontWeight.w500)),
                              Text(
                                "\$  ${context.read<ProviderP>().payingbill.total.toStringAsFixed(2)}",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
                height: 478,
              ),
              Container(
                  width: 400,
                  alignment: Alignment.center,
                  child: InkWell(
                      onTap: () {
                        if (current != -1) {}
                      },
                      child: Container(
                        width: 300,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          "Share Receipt",
                          style: TextStyle(
                              fontSize: 17,
                              color: Color(0xFF438883),
                              fontWeight: FontWeight.w500),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            border:
                                Border.all(color: Color(0xFF438883), width: 1)),
                      )))
            ],
          ))
    ]);
  }
}
