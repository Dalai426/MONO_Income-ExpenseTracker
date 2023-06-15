import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lab11/Screens/BillDetailsScreen.dart';
import 'package:lab11/Screens/ConnectWalletScreen.dart';
import 'package:provider/provider.dart';
import '../../model/transaction.dart';
import '../Arguments.dart';
import '../Provider/Provider.dart';
import '../Screens/AddExpenceScreen.dart';
import '../model/Bills.dart';

class AccountsTab extends StatefulWidget {
  const AccountsTab ({Key? key}) : super(key: key);

  @override
  State<AccountsTab> createState() => _tab();
}

class _tab extends State<AccountsTab> {



  TextStyle simpleTitle=TextStyle(color:Color(0xFF888888), fontSize: 18,fontWeight: FontWeight.w500);
  TextStyle simpleSub=TextStyle(color:Color(0xFF888888), fontSize: 12,fontWeight: FontWeight.w400);
  int current=-1;

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child:SingleChildScrollView(
        child: Column(
           children: [
             InkWell(
              onTap:(){
                setState(() {
                  current=0;
                });
              },
              child:Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:current==0?Color.fromRGBO(67, 136, 131, 0.1):Color(0xFFFAFAFA)
                ),
                child: Row(
                  children: [

                    Flexible(
                        child:Container(
                          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      margin: EdgeInsets.symmetric(horizontal:15),

                      decoration: BoxDecoration(
                        color:current==0?Colors.white:Color(0xFFFAFAFA),
                        shape: BoxShape.circle,
                      ),child:Icon(Icons.museum,size: 30,color:current==0?Color(0xFF438883):Color(0xFF888888))
                    ),

                    flex: 1,),
                    Flexible(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Bank Link",style: simpleTitle,),
                          SizedBox(height: 5,),
                          Text("Connect your bank account to deposit & fund", style: simpleSub,)
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child:Container(
                        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                        margin: EdgeInsets.symmetric(horizontal:15),
                        child: current==0?Image(image:AssetImage('img/check-circle-fill 1.png'),width: 50,):null,
                      ),
                    ),


                  ],
                ),
              )),
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
                     children: [

                       Flexible(
                         child:Container(
                           padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                           margin: EdgeInsets.symmetric(horizontal:15),

                           decoration: BoxDecoration(
                             color:current==1?Colors.white:Color(0xFFFAFAFA),
                             shape: BoxShape.circle,
                           ),child:Icon(Icons.currency_bitcoin,size: 30,color:current==1?Color(0xFF438883):Color(0xFF888888))
                         ),

                         flex: 1,),
                       Flexible(
                         flex: 2,
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("Bank Link",style: simpleTitle,),
                             SizedBox(height: 5,),
                             Text("Connect your bank account to deposit & fund", style: simpleSub,)
                           ],
                         ),
                       ),
                       Flexible(
                         flex: 1,
                         child:Container(
                           padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                           margin: EdgeInsets.symmetric(horizontal:15),
                           child: current==1?Image(image:AssetImage('img/check-circle-fill 1.png'),width: 50,):null,
                         ),
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
                     children: [

                       Flexible(
                         child:Container(
                           padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                           margin: EdgeInsets.symmetric(horizontal:15),

                           decoration: BoxDecoration(
                             color:current==2?Colors.white:Color(0xFFFAFAFA),
                             shape: BoxShape.circle,
                           ),child: Icon(Icons.paypal,size: 30,color:current==2?Color(0xFF438883):Color(0xFF888888),)
                         ),

                         flex: 1,),
                       Flexible(
                         flex: 2,
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("Bank Link",style: simpleTitle,),
                             SizedBox(height: 5,),
                             Text("Connect your bank account to deposit & fund", style: simpleSub,)
                           ],
                         ),
                       ),
                       Flexible(
                         flex: 1,
                         child:Container(
                           padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                           margin: EdgeInsets.symmetric(horizontal:15),
                           child: current==2?Image(image:AssetImage('img/check-circle-fill 1.png'),width: 50,):null,
                         ),
                       ),


                     ],
                   ),
                 )),
             SizedBox(height: 40,),
             InkWell(
               onTap: (){
                 if(current!=-1 && !context.read<ProviderP>().cardNumber.contains("*")) {
                   Provider.of<ProviderP>(context,listen: false).setCard();
                     Navigator.pushNamed(context, '/home', arguments: Arguments(
                         BillDteailsSCreen(title: "home"), 2));
                 }else{
                   // Fluttertoast.showToast(
                   //   msg: "THE toast message",
                   //   toastLength: Toast.LENGTH_SHORT,
                   //   timeInSecForIosWeb: 1,
                   //   backgroundColor: Colors.black,
                   //   textColor: Colors.white,
                   //   fontSize: 16.0,
                   // );
                 }

               },
              child:Container(
                width: 300,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text("Next",style:TextStyle(fontSize: 17,color: Color(0xFF438883),fontWeight: FontWeight.w500),),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  border: Border.all(
                    color: Color(0xFF438883),
                    width: 1
                  )
                ),
              )
             )
            ]
        ),
      ),

    );
  }
}
