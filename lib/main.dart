import 'package:real_final_test/provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'package:provider/provider.dart';
import 'dart:io';

void main() {
  HttpOverrides.global = NoCheckCertificateHttpOverrides();
  runApp(const MyApp());
}

class NoCheckCertificateHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // MultiProvider를 통해 여러가지 Provider를 관리
        home: MultiProvider(

          // ChangeNotifierProvider 통해 변화에 대해 구독
            providers: [
              ChangeNotifierProvider(
                  create: (BuildContext context) => EvProvider())
            ],
            child:
            Home() // home.dart
        ));
  }
}