import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:task2/authenticate/login.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#0E9AD6"),
        elevation: 0.0,
        centerTitle: true ,
        title: FittedBox(child: new Text("Home Page")),
        automaticallyImplyLeading: true,
          leading: IconButton(icon:Icon(Icons.arrow_back),
            onPressed:() {
              Navigator.push(context, new MaterialPageRoute(builder: (context) => LoginPage() ));

            },
            //onPressed:() => exit(0),
          )
      ),
      body: Column(
        children: <Widget>[
          Text("Welcome Home"),
        ],
      ),
    );
  }
}
