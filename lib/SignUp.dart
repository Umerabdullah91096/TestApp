import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:testapp/main.dart';

class SignUp extends StatefulWidget {
    final Widget child;
    
  SignUp({Key key, this.child}) : super(key: key);
   SignUpState createState() => SignUpState();
 }
 class SignUpState extends State<SignUp> {
     final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email, password,name;
   TextEditingController control = TextEditingController();
   TextEditingController control1 = TextEditingController();
   TextEditingController control2 = TextEditingController();
  Color primaryColor=Color(0xff18203d);
  
  
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
                  'SignUp     ',
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
              Text("Enter Name:",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400,color: Colors.white), ),
              Text(""),
              TextFormField(
                autofocus: true,
                controller: control2,
                maxLength: 20,
                maxLines: 1,           
                keyboardType: TextInputType.emailAddress,
                validator: (input) {
                            if(input.length==0) {
                              return "Name cannot be empty";
                            }else{
                              return null;
                            }
                          },
                          onSaved: (input) => name = input,
  decoration: InputDecoration(
                            labelText: "Enter Name",
                            counterStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(Icons.supervised_user_circle_sharp),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              
                            ),
),
              ),     
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
                      
                keyboardType: TextInputType.emailAddress,
                validator: (input) => input.length < 6 ? 'Password too short.' : null,
                onSaved: (input) => password = input,            
  decoration: InputDecoration(
                            labelText: "Enter Password",                       
                            prefixIcon: Icon(Icons.lock),
                            
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
          child: RaisedButton(onPressed: signUp,child:Text("SignUp")),)
                      ],
                    ),
                  ),     
        ),   
      ),
    );
  }
  Future<void> signUp() async {
    if(formKey.currentState.validate()){
      formKey.currentState.save();
      try{
        FirebaseUser user = await FirebaseAuth.instance.createUserWithEmailAndPassword (email: email, password: password);
      
        
      }catch(e){
        print(e.message);
      }
    }
  }}
 