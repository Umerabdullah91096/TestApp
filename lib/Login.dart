import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth_web/firebase_auth_web.dart';

import 'package:testapp/Dashboard.dart';
import 'package:testapp/main.dart';

 class Login extends StatefulWidget {
    final Widget child;
    
  Login({Key key, this.child}) : super(key: key);
   LoginState createState() => LoginState();
 }
 class LoginState extends State<Login> {
     final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email, password;
   TextEditingController control = TextEditingController();
   TextEditingController control1 = TextEditingController();
  Color primaryColor=Color(0xff18203d);
  bool _obscureText = true;
  
   void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp (
      
          home: Scaffold(
            resizeToAvoidBottomPadding: false,
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: Colors.black12,
          leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed:() => runApp(MyApp()),
              ),
          title: Center(
                child: Text(
                  'LogIn     ',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      fontStyle: FontStyle.italic,
                      color: Colors.white),
                ),
              ),),
        body: Align(
          alignment: Alignment.topCenter,
                  child: Form(
                    key: formKey,
                                      child: Column(
                      children: <Widget>[
                                         Container(   
            height: 400,
            width: 300,             
            child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[      
              Text("Enter Email:",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400,color: Colors.white), ),
              Text(""),
              TextFormField(
                autofocus: true,
                controller: control,
                maxLength: 30,
                maxLines: 1,           
                keyboardType: TextInputType.emailAddress,
                validator: (input) {
                            if(input.length==0) {
                              return "Email cannot be empty";
                            }else{
                              return null;
                            }
                          },
                          onSaved: (input) => email = input,
  decoration: InputDecoration(
                            labelText: "Enter Email",
                            counterStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(Icons.email),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              
                            ),
),
              ),          
              Text("Enter Password:",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400,color: Colors.white),),
              Text(""),
               TextFormField(
                autofocus: true,
                controller: control1,
                maxLines: 1,
               obscureText: _obscureText,            
                keyboardType: TextInputType.emailAddress,
                validator: (input) => input.length < 6 ? 'Password too short.' : null,
                onSaved: (input) => password = input,            
  decoration: InputDecoration(
                            labelText: "Enter Password",                       
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(icon: Icon(Icons.remove_red_eye),onPressed: _toggle),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),                          
                            ),
),
              ),     
            ],),
          ),
          Container(height: 100,alignment: Alignment.bottomCenter,
          child: RaisedButton(onPressed: signIn,child:Text("Login")),)
                      ],
                    ),
                  ),     
        ),   
      ),
    );
  }
  Future<void> signIn() async {
    if(formKey.currentState.validate()){
      formKey.currentState.save();
      try{
        FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard(user: user)));
        
      }catch(e){
        print(e.message);
      }
    }
  }
 
}




