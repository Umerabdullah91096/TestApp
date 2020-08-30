import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testapp/Login.dart';
import 'package:testapp/SignUp.dart';

void main() => runApp(MyApp());

  class MyApp extends StatefulWidget {
    _MyAppState createState() => _MyAppState();
 }
 class _MyAppState extends State<MyApp> {
   Color primaryColor=Color(0xff18203d);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: Colors.black12,
          leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                
                onPressed: () => exit(0),
              ),
          title: Center(
                child: Text(
                  'Home    ',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      fontStyle: FontStyle.italic,
                      color: Colors.white),
                ),
              ),
        ),
        body: Center(
          
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

            RaisedButton(
              color: primaryColor,
            textColor: Colors.white,
               padding: const EdgeInsets.all(10.0),
               child: Text(
              "Login",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
            ),
            onPressed:()=> runApp(Login()),
           
          ),
          Text(""),
          RaisedButton(
            color: primaryColor,
            textColor: Colors.white,
           
            padding: const EdgeInsets.all(10.0),
            onPressed:() {
             runApp ( SignUp());
            },
            child: Text(
              "Sign Up",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
            ),
          ),
          ]
          
          ),
        ),
      ),
    );
  }
}

