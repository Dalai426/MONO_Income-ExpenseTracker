import 'package:flutter/cupertino.dart';
import 'package:lab11/widgets/homepage.dart';

class Arguments {
  final Widget wid;
  final int current;
  Arguments(this.wid, this.current);
}

class ArgumentsDetatoPay {
  final Widget wid;
  final int current;
  final double price;
  final double fee;
  final double total;
  ArgumentsDetatoPay(this.wid, this.current, this.price, this.fee, this.total);
}