import 'package:flutter/material.dart';
import 'package:lab11/Provider/Provider.dart';
import 'package:lab11/Screens/MyHomeScreen.dart';
import 'package:lab11/Screens/MyWalletScreen.dart';
import 'package:lab11/Screens/Starting.dart';
import 'package:lab11/StartingMono.dart';
import 'package:provider/provider.dart';

import 'notfiservice.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  runApp(const HomeScreen());
}

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProviderP(),
        ),
      ],
      child:MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: '/',
        routes: {
          '/': (context) => const Start(title: ''),
          '/start': (context) => const StartMono(title: "starting"),
          '/home': (context) =>const MyHomeScreen(title:"Home"),
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );




  }
}



