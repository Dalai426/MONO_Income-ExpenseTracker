import 'package:flutter/foundation.dart';

class Bills {
  String? id;
  String? name;
  double? amount;
  DateTime? date;
  String? img;

  Bills(
      {@required this.id,
        @required this.name,
        @required this.amount,
        @required this.date,
        @required this.img}
      );

  @override
  String toString() {
    // TODO: implement toString
    return "${id},${name}";

  }
}


class PayingBills {
  String? id;
  String? name;
  double? amount;
  DateTime? date;
  String? img;
  double? fee;
  String? paymentmethod;
  double? total;

  PayingBills(
      {@required this.id,
        @required this.name,
        @required this.amount,
        @required this.date,
        @required this.img,
        @required this.fee,
        @required this.paymentmethod,
        @required this.total});

  void setImage(String img){
    this.img=img;
  }


}