import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lab11/Screens/BillPaymentLast.dart';
import 'package:lab11/model/Bills.dart';
import 'package:lab11/notfiservice.dart';
import 'package:provider/provider.dart';

import '../Arguments.dart';
import '../Provider/Provider.dart';

class BillPaymentScreen extends StatefulWidget {
  const BillPaymentScreen({super.key, required this.title});

  final String title;

  @override
  State<BillPaymentScreen> createState() => _AddExpenceScreenState();
}

class _AddExpenceScreenState extends State<BillPaymentScreen> {
  TextStyle ts1 = TextStyle(
    color: Color(0xFF666666),
  );




  TextStyle simpleTitle=TextStyle(color:Color(0xFF888888), fontSize: 18,fontWeight: FontWeight.w500);






  int current=-1;



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
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
                Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Color(0xFFFAFAFA),
                      shape: BoxShape.circle,
                    ),
                    child: Image(
                      image: AssetImage("${context.read<ProviderP>().payingbill.img}"),
                      width: 40,
                    )),
            SizedBox(height: 30,),
            Container(
              alignment: Alignment.center,
              margin:EdgeInsets.symmetric(horizontal: 30),
              child: Text("You will pay ${ context.read<ProviderP>().payingbill.name} for one month with  BCA OneKlik",textAlign:TextAlign.center,style: TextStyle(fontSize: 20),),
            ),
            SizedBox(height: 30,),
            Padding(padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Price",style: TextStyle(color: Color(0xFF666666)),),
                      Text("\$  ${context.read<ProviderP>().payingbill.amount.toStringAsFixed(2)}",style: TextStyle(fontWeight: FontWeight.w500),),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Fee",style: TextStyle(color: Color(0xFF666666))),
                      Text("\$  ${context.read<ProviderP>().payingbill.fee.toStringAsFixed(2)}",style: TextStyle(fontWeight: FontWeight.w500),),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    width:600,
                    height: 1,
                    color: Color(0xFFDDDDDD),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total",style: TextStyle(color: Color(0xFF666666),fontWeight: FontWeight.w500)),
                      Text("\$  ${context.read<ProviderP>().payingbill.total.toStringAsFixed(2)}",style: TextStyle(fontWeight: FontWeight.w600),),
                    ],
                  ),
                ],
              ),),


            SizedBox(height: 180,),
            Container(
              width: 400,
              alignment: Alignment.center,
              child: GestureDetector(
                  onTap: (){

                    NotificationService().showNotification(title: "${context.read<ProviderP>().payingbill.name}",body:"${context.read<ProviderP>().payingbill.total} төгрөг амжилттай төлөгдлөө !!!" );
                    context.read<ProviderP>().paymentSuccesfully();
                    Navigator.pushNamed(context,'/home',arguments:Arguments(BillPaymentLast(title: "home"),2));
                  },
                  child:Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27),
                    ),
                    elevation: 7,
                    shadowColor:Color(0xFF2F7E79),
                    child: Container(

                        width: 300,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomCenter,
                            colors: <Color>[
                              Color(0xFF69AEA9),
                              Color(0xFF3F8782),
                            ],
                          ),
                        ),
                        child:Text(
                          'Confirm and Pay',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                          ),
                        )
                    ),
                  )
              ),
            )
          ],
        ),
      )
    ]);
  }
}
