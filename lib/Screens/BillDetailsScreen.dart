import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lab11/Screens/BillPayment.dart';
import 'package:lab11/model/Bills.dart';
import 'package:provider/provider.dart';
import '../Arguments.dart';
import '../Provider/Provider.dart';
import '../model/DropDownMenu.dart';
import 'MyWalletScreen.dart';

class BillDteailsSCreen extends StatefulWidget {
  const BillDteailsSCreen({super.key, required this.title});

  final String title;

  @override
  State<BillDteailsSCreen> createState() => _AddExpenceScreenState();
}

class _AddExpenceScreenState extends State<BillDteailsSCreen> {
  TextStyle ts1 = TextStyle(
    color: Color(0xFF666666),
  );

  late Bills bill;

  late double? fee;

  TextStyle simpleTitle=TextStyle(color:Color(0xFF888888), fontSize: 18,fontWeight: FontWeight.w500);



  _AddExpenceScreenState(){
    bill=Bills(
        id: '4',
        name: 'Youtube Premium',
        amount: 4.99,
        date: DateTime.now(),
        img: "image 6.png");

    fee=(bill.amount!*16.59)/100;
  }


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
              "Bill Details",
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${context.read<ProviderP>().payingbill.name}",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      DateFormat.yMMMd().format(bill.date!),
                      style: TextStyle(color: Color(0xFF666666)),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 30,),
            Padding(padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Price",style: TextStyle(color: Color(0xFF666666)),),
                      Text("\$  ${context.read<ProviderP>().payingbill.amount!.toStringAsFixed(2)}",style: TextStyle(fontWeight: FontWeight.w500),),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Fee",style: TextStyle(color: Color(0xFF666666))),
                      Text("\$  ${context.read<ProviderP>().payingbill.fee!.toStringAsFixed(2)}",style: TextStyle(fontWeight: FontWeight.w500),),
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


            SizedBox(height: 30,),
            Padding(padding:EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Select payment method",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17),),
                  SizedBox(height: 15,),
                  InkWell(
                      onTap:(){
                        setState(() {
                          current=1;
                        });
                      },
                      child:Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:current==1?Color.fromRGBO(67, 136, 131, 0.1):Color(0xFFFAFAFA)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Row(
                              children: [
                                Container(
                                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                    margin: EdgeInsets.symmetric(horizontal:15),

                                    decoration: BoxDecoration(
                                      color:current==1?Colors.white:Color(0xFFFAFAFA),
                                      shape: BoxShape.circle,
                                    ),child: Icon(Icons.credit_card_outlined,size: 30,color:current==1?Color(0xFF438883):Color(0xFF888888),)
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Debit Card",style: simpleTitle,),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                              margin: EdgeInsets.symmetric(horizontal:15),
                              child: current==1?Image(image:AssetImage('img/check-circle-fill 1.png'),width: 30,):null,
                            ),
                          ],
                        ),
                      )),
                  SizedBox(height: 15,),
                  InkWell(
                      onTap:(){
                        setState(() {
                          current=2;
                        });
                      },
                      child:Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:current==2?Color.fromRGBO(67, 136, 131, 0.1):Color(0xFFFAFAFA)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Row(
                              children: [
                                Container(
                                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                    margin: EdgeInsets.symmetric(horizontal:15),

                                    decoration: BoxDecoration(
                                      color:current==2?Colors.white:Color(0xFFFAFAFA),
                                      shape: BoxShape.circle,
                                    ),child: Icon(Icons.paypal,size: 30,color:current==2?Color(0xFF438883):Color(0xFF888888),)
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Paypal",style: simpleTitle,),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                              margin: EdgeInsets.symmetric(horizontal:15),
                              child: current==2?Image(image:AssetImage('img/check-circle-fill 1.png'),width: 30,):null,
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              width: 1000,
              alignment: Alignment.center,
              child: GestureDetector(
                  onTap: (){
                    if(current!=-1){
                      String method;
                      if(current==1){
                        context.read<ProviderP>().setPayingBillPaymentMethod("Debit Card");
                      }else{
                        context.read<ProviderP>().setPayingBillPaymentMethod("PayPal");
                      }
                      Navigator.pushNamed(context,'/home',arguments:Arguments(BillPaymentScreen(title: "home"),2));
                    }
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
                          'Pay Now',
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
