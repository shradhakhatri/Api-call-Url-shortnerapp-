import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_shortner_app/views/url_shortner_provider.dart';
import 'package:url_shortner_app/views/url_shortner_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    child: const MyApp(),
   create:(context) => Urlshortnerprovider(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Url Shortner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:const Urlshortnerscreen(),
    );
  }
}

