import 'package:flutter/material.dart';
import 'package:friendlyeats_web_mobile/pages/mobile_page.dart';
import 'package:friendlyeats_web_mobile/pages/web_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    if(MediaQuery.of(context).size.width > 600){
      return WebPage();
    }
    return MobilePage();
  }
}
