import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:map_app_flutter/data/models/place_model.dart';
import 'package:map_app_flutter/ui/pages/detail_page/detail_page.dart';
import 'package:map_app_flutter/ui/pages/home_page/home_page.dart';
import 'package:map_app_flutter/ui/pages/map_page/map_page.dart';
import 'package:map_app_flutter/ui/pages/splash_page/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
     onGenerateRoute: (settings){
       switch(settings.name){
         case "/":
           return CupertinoPageRoute(
             builder: (context) => SplashPage(),
           );
         case "/homePage":
           return CupertinoPageRoute(
             builder: (context) => HomePage(),
           );
         case "/detailPage":
           return CupertinoPageRoute(
             builder: (context) => DetailPage(xid:settings.arguments as String),
           );

       }
     },

      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
     // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
