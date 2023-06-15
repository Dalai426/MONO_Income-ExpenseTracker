import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lab11/Screens/ConnectWalletScreen.dart';
import 'package:provider/provider.dart';
import '../Arguments.dart';
import '../Provider/Provider.dart';


class UpComingBill extends StatefulWidget {
  const UpComingBill({Key? key}) : super(key: key);

  @override
  State<UpComingBill> createState() => _UpBills();
}

class _UpBills extends State<UpComingBill> {


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child:SingleChildScrollView(
        child: Column(
          children: context.read<ProviderP>().list_bills.map((t) {
            return  Padding(padding:new EdgeInsets.only(bottom: 10),
                child:Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Row(
                        children:[
                          Container(
                            padding: new EdgeInsets.all(10),
                            margin: new EdgeInsets.only(right: 20),

                            child:Image.asset(
                                '${t.img}',
                                width: 25,
                              height: 25,
                              ),
                            decoration:BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Color(0xFFF0F6F5),
                            ),

                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Text(
                                  t.name!,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Text(
                                DateFormat.yMMMd().format(t.date!),
                                style: TextStyle(color: Color(0xFF666666),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          )
                        ]),

                    OutlinedButton(
                      onPressed: () {
                        Provider.of<ProviderP>(context,listen: false).setPay(t);
                        Navigator.pushNamed(context,'/home',arguments:Arguments(ConnectWalletScreen(title: "home"),2));
                      },
                      child: Text(
                        'Pay',
                        style: TextStyle(color: Color(0xFF438883)),
                      ),
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Color(0xFFECF9F8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                        side: BorderSide(
                          width: 0, // Change this value to adjust the border width
                          color: Color(0xFFECF9F8), // Change this value to adjust the border color
                        ),
                      ),

                    ),
                  ],
                )
            );
          }).toList(),
        ),
      ),

    );
  }


}
