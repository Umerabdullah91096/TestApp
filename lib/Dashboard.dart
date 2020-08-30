import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testapp/main.dart';
import './Login.dart';

class Dashboard extends StatefulWidget {
  //final FirebaseUser user;

  //Dashboard({Key key, this.user}) : super(key: key);
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Dashboard"),
        ),
        body: Align(alignment: Alignment.topCenter,
        child: Column(
          
          children: [
          Container(
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
              children: [
        //   Text("Name: ${widget.user.diplayName} ",style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),),
            Text(""),
           // Text("Email: ${widget.user.email}",style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),),
          ],),),
          Container(
            height: 200,
            alignment: Alignment.bottomCenter,
            child: RaisedButton(onPressed:()=> runApp(MyApp()),child:Text("Logout",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),),)
         
        ],)
        ),
      ),
    );
  }
}
