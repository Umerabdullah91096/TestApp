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
          child: RaisedButton(onPressed: ()=>runApp(Dashboard()),child:Text("Login")),)
                      ],
                    ),
                  ),     
        ),   
      ),
    );
  }
  // Future<void> signIn() async {
  //   if(formKey.currentState.validate()){
  //     formKey.currentState.save();
  //     try{
  //       FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  //       Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard(user: user)));
        
  //     }catch(e){
  //       print(e.message);
  //     }
  //   }
  // }
 
}
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'customTextField.dart';

// class LoginRegister extends StatefulWidget {
//   @override
//   _LoginRegisterState createState() => _LoginRegisterState();
// }

// class _LoginRegisterState extends State<LoginRegister> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   PersistentBottomSheetController _sheetController;
//   String _email;
//   String _password;
//   String _displayName;
//   bool _loading = false;
//   bool _autoValidate = false;
//   String errorMsg = "";

//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Color primaryColor = Colors.white;

//     //GO logo widget
//     Widget logo(){
//       return Padding(
//         padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
//         child: Container(
//           width: MediaQuery.of(context).size.width,
//           height: 220,
//           child: Stack(
//             children: <Widget>[
//               Positioned(
//                   child: Container(
//                 child: Align(
//                   child: Container(
//                     decoration: BoxDecoration(
//                     border: Border.all(color: Colors.blueGrey,width: 3),
//                     image:DecorationImage(fit: BoxFit.cover,image: AssetImage('assets/images/prescription.png')) ,
//                     shape: BoxShape.circle, color: Colors.white),
//                     width: 150,
//                     height: 150,
                    
//                   ),
//                 ),
//                 height: 154,
//               )),],)));

//     }
//     // Widget logo() {
//     //   return Padding(
//     //     padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
//     //     child: Container(
//     //       width: MediaQuery.of(context).size.width,
//     //       height: 220,
//     //       child: Stack(
//     //         children: <Widget>[
//     //           Positioned(
//     //               child: Container(
//     //             child: Align(
//     //               child: Container(
//     //                 decoration: BoxDecoration(
//     //                     shape: BoxShape.rectangle, color: Colors.white),
//     //                 width: 150,
//     //                 height: 150,
//     //               ),
//     //             ),
//     //             height: 154,
//     //           )),
//     //           Positioned(
//     //             child: Container(
//     //                 height: 154,
//     //                 child: Align(
//     //                   child: Text(
//     //                     "GO",
//     //                     style: TextStyle(
//     //                       fontSize: 120,
//     //                       fontWeight: FontWeight.bold,
//     //                       color: Colors.blueGrey[200],
//     //                     ),
//     //                   ),
//     //                 )),
//     //           ),
//     //           Positioned(
//     //             width: MediaQuery.of(context).size.width * 0.15,
//     //             height: MediaQuery.of(context).size.width * 0.15,
//     //             bottom: MediaQuery.of(context).size.height * 0.046,
//     //             right: MediaQuery.of(context).size.width * 0.22,
//     //             child: Container(
//     //               decoration: BoxDecoration(
//     //                   shape: BoxShape.circle, color: Colors.white),
//     //             ),
//     //           ),
//     //           Positioned(
//     //             width: MediaQuery.of(context).size.width * 0.08,
//     //             height: MediaQuery.of(context).size.width * 0.08,
//     //             bottom: 0,
//     //             right: MediaQuery.of(context).size.width * 0.32,
//     //             child: Container(
//     //               decoration: BoxDecoration(
//     //                   shape: BoxShape.circle, color: Colors.white),
//     //             ),
//     //           ),
//     //         ],
//     //       ),
//     //     ),
//     //   );
//     // }

//     //button widgets
//     Widget filledButton(String text, Color splashColor, Color highlightColor,
//         Color fillColor, Color textColor, void function()) {
//       return RaisedButton(
//         highlightElevation: 0.0,
//         splashColor: splashColor,
//         highlightColor: highlightColor,
//         elevation: 0.0,
//         color: fillColor,
//         shape: RoundedRectangleBorder(
//             borderRadius: new BorderRadius.circular(30.0)),
//         child: Text(
//           text,
//           style: TextStyle(
//               fontWeight: FontWeight.bold, color: textColor, fontSize: 20),
//         ),
//         onPressed: () {
//           function();
//         },
//       );
//     }

//     outlineButton(void function(),String nam) {
//       return OutlineButton(
//         highlightedBorderColor: Colors.white,
//         borderSide: BorderSide(color: Colors.white, width: 2.0),
//         highlightElevation: 0.0,
//         splashColor: Colors.white,
//         highlightColor: Colors.white,
//         color: Colors.white,
//         shape: RoundedRectangleBorder(
//           borderRadius: new BorderRadius.circular(30.0),
//         ),
//         child: Text(
//           nam,
//           style: TextStyle(
//               fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
//         ),
//         onPressed: () {
//           function();
//         },
//       );
//     }

//     void _validateLoginInput() async {
//       final FormState form = _formKey.currentState;
//       if (_formKey.currentState.validate()) {
//         form.save();
//         _sheetController.setState(() {
//           _loading = true;
//         });
//         try {
//           FirebaseUser user = await FirebaseAuth.instance
//               .signInWithEmailAndPassword(email: _email, password: _password);

//           Navigator.of(context).pushReplacementNamed('/home');
//         } catch (error) {
//           switch (error.code) {
//             case "ERROR_USER_NOT_FOUND":
//               {
//                 _sheetController.setState(() {
//                   errorMsg =
//                       "There is no user with such entries. Please try again.";

//                   _loading = false;
//                 });
//                 showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AlertDialog(
//                         content: Container(
//                           child: Text(errorMsg),
//                         ),
//                       );
//                     });
//               }
//               break;
//             case "ERROR_WRONG_PASSWORD":
//               {
//                 _sheetController.setState(() {
//                   errorMsg = "Password doesn\'t match your email.";
//                   _loading = false;
//                 });
//                 showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AlertDialog(
//                         content: Container(
//                           child: Text(errorMsg),
//                         ),
//                       );
//                     });
//               }
//               break;
//             default:
//               {
//                 _sheetController.setState(() {
//                   errorMsg = "";
//                 });
//               }
//           }
//         }
//       } else {
//         setState(() {
//           _autoValidate = true;
//         });
//       }
//     }

//     void _validateRegisterInput() async {
//       final FormState form = _formKey.currentState;
//       if (_formKey.currentState.validate()) {
//         form.save();
//         _sheetController.setState(() {
//           _loading = true;
//         });
//         try {
//           FirebaseUser user = await FirebaseAuth.instance
//               .createUserWithEmailAndPassword(
//                   email: _email, password: _password);
//           UserUpdateInfo userUpdateInfo = new UserUpdateInfo();
//           userUpdateInfo.displayName = _displayName;
//           user.updateProfile(userUpdateInfo).then((onValue) {
//             Firestore.instance.collection('users').document().setData(
//                 {'email': _email, 'displayName': _displayName}).then((onValue) {
//               _sheetController.setState(() {
//                 _loading = false;
//               });
//             Navigator.of(context).pop();
            
//             });
//           });
//         } catch (error) {
//           switch (error.code) {
//             case "ERROR_EMAIL_ALREADY_IN_USE":
//               {
//                 _sheetController.setState(() {
//                   errorMsg = "This email is already in use.";
//                   _loading = false;
//                 });
//                 showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AlertDialog(
//                         content: Container(
//                           child: Text(errorMsg),
//                         ),
//                       );
//                     });
//               }
//               break;
//             case "ERROR_WEAK_PASSWORD":
//               {
//                 _sheetController.setState(() {
//                   errorMsg = "The password must be 6 characters long or more.";
//                   _loading = false;
//                 });
//                 showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AlertDialog(
//                         content: Container(
//                           child: Text(errorMsg),
//                         ),
//                       );
//                     });
//               }
//               break;
//             default:
//               {
//                 _sheetController.setState(() {
//                   errorMsg = "";
//                 });
//               }
//           }
//         }
//       } else {
//         setState(() {
//           _autoValidate = true;
//         });
//       }
//     }

//     String emailValidator(String value) {
//       Pattern pattern =
//           r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//       RegExp regex = new RegExp(pattern);
//       if (value.isEmpty) return '*Required';
//       if (!regex.hasMatch(value))
//         return '*Enter a valid email';
//       else
//         return null;
//     }

//     void loginSheet() {
//       _sheetController = _scaffoldKey.currentState
//           .showBottomSheet<void>((BuildContext context) {
//         return  DecoratedBox(
//           decoration: BoxDecoration(),
//           child: ClipRRect(
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(40.0),
//                 topRight: Radius.circular(40.0)),
//             child: Container(
//               child: ListView(
//                 children: <Widget>[
//                   Container(
//                      decoration: BoxDecoration(
//                        color: Colors.grey,
//       // gradient: LinearGradient(
//       //     colors: [Color(0xFF282a57)],
//       //     begin: Alignment.topCenter,
//       //     end: Alignment.bottomCenter),
//       ),
                    
//                     child: Stack(
                    
                      
//                       children: <Widget>[
//                         Positioned(
//                           left: 10,
//                           top: 10,
//                           child: IconButton(
//                             onPressed: () {
//                               Navigator.of(context).pop();
//                             },
//                             icon: Icon(
//                               Icons.close,
//                               size: 30.0,
//                               color: Colors.white,
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                     height: 50,
//                     width: 50,
//                   ),
//                   Container(
//                      decoration: BoxDecoration(
//       gradient: LinearGradient(
//           colors: [Colors.grey,Color(0xFF282a57)],
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter),),

//                     child:
//                   SingleChildScrollView(

//                       child: Form(
//                     key: _formKey,
//                     autovalidate: _autoValidate,
//                     child: Column(
//                       children: <Widget>[
//                         Container(
//                           width: MediaQuery.of(context).size.width,
//                           height: 140,
//                           child: Stack(
//                             children: <Widget>[
//                               Positioned(
//                                 child: Align(
//                                   child: Container(
//                                     width: 140,
//                                     height: 140,
//                                     decoration: BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         color: Colors.blueGrey),
//                                   ),
//                                   alignment: Alignment.center,
//                                 ),
//                               ),
//                               Positioned(
//                                 child: Container(
//                                   child: Text(
//                                     "LOGIN",
//                                     style: TextStyle(
//                                       fontSize: 48,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   alignment: Alignment.center,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                             padding: EdgeInsets.only(bottom: 20, top: 60),
//                             child: CustomTextField(
//                               onSaved: (input) {
//                                 _email = input;
//                               },
//                               validator: emailValidator,
//                               icon: Icon(Icons.email),
//                               hint: "EMAIL",
//                             )),
// Padding(
//                             padding: EdgeInsets.only(bottom: 20),
//                             child: CustomTextField(
//                               icon: Icon(Icons.lock),
//                               obsecure: true,
//                               onSaved: (input) => _password = input,
//                               validator: (input) =>
//                                   input.isEmpty ? "*Required" : null,
//                               hint: "PASSWORD",
//                             )),
                        
//                         SizedBox(
//                           height: 20,
//                         ),
                        
//                         Padding(
//                           padding: EdgeInsets.only(
//                               left: 20,
//                               right: 20,
//                               bottom: MediaQuery.of(context).viewInsets.bottom),
//                           child: _loading == true
//                               ? CircularProgressIndicator(
//                                   valueColor: new AlwaysStoppedAnimation<Color>(
//                                       primaryColor),
//                                 )
//                               : Container(
//                                   child:  outlineButton(_validateLoginInput,"Login", 
                     
//                                     ),height: 50,width: MediaQuery.of(context).size.width,
//                                   //width: MediaQuery.of(context).size.width,
//                                 ),
//                         ),
//                         SizedBox(
                          
//                           height: 160,
//                         ),
//                       ],
//                     ),
//                   ))),
//                 ],
//               ),
//               height: MediaQuery.of(context).size.height / 1.1,
//               width: MediaQuery.of(context).size.width,
//               //color: Colors.grey,
//             ),
//           ),
//         );
//       });
//     }

//     void registerSheet() {
//       _sheetController = _scaffoldKey.currentState
//           .showBottomSheet<void>((BuildContext context) {
//         return DecoratedBox(
//           decoration: BoxDecoration(),
//           child: ClipRRect(
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(40.0),
//                 topRight: Radius.circular(40.0)),
//             child: Container(
//               child: ListView(
//                 children: <Widget>[
//                   Container(
//                      decoration: BoxDecoration(
//                        color: Colors.grey,
//       // gradient: LinearGradient(
//       //     colors: [Color(0xFF282a57)],
//       //     begin: Alignment.topCenter,
//       //     end: Alignment.bottomCenter),
//       ),
//                     child: Stack(
//                       children: <Widget>[
//                         Positioned(
//                           left: 10,
//                           top: 10,
//                           child: IconButton(
//                             onPressed: () {
//                               Navigator.of(context).pop();
//                             },
//                             icon: Icon(
//                               Icons.close,
//                               size: 30.0,
//                               color: Colors.white,
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                     height: 50,
//                     width: 50,
//                   ),
//                   Container( decoration: BoxDecoration(
//       gradient: LinearGradient(
//           colors: [Colors.grey,Color(0xFF282a57)],
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter),),
//           child:
//                   SingleChildScrollView(
//                       child: Form(
//                     child: Column(children: <Widget>[
//                       Container(
//                         width: MediaQuery.of(context).size.width,
//                         height: 140,
//                         child: Stack(
//                           children: <Widget>[
//                             Positioned(
//                               child: Align(
//                                 child: Container(
//                                   width: 130,
//                                   height: 130,
//                                   decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       color: Colors.blueGrey),
//                                 ),
//                                 alignment: Alignment.center,
//                               ),
//                             ),
//                             Positioned(
//                               child: Container(
//                                 padding: EdgeInsets.only(bottom: 25, right: 40),
//                                 child: Text(
//                                   "REGI",
//                                   style: TextStyle(
//                                     fontSize: 44,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                                 alignment: Alignment.center,
//                               ),
//                             ),
//                             Positioned(
//                               child: Align(
//                                 child: Container(
//                                   padding: EdgeInsets.only(top: 40, left: 28),
//                                   width: 130,
//                                   child: Text(
//                                     "STER",
//                                     style: TextStyle(
//                                       fontSize: 40,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                                 alignment: Alignment.center,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                           padding: EdgeInsets.only(
//                             bottom: 20,
//                             top: 60,
//                           ),
//                           child: CustomTextField(
//                             icon: Icon(Icons.account_circle),
//                             hint: "DISPLAY NAME",
//                             validator: (input) =>
//                                 input.isEmpty ? "*Required" : null,
//                             onSaved: (input) => _displayName = input,
//                           )),
//                       Padding(
//                           padding: EdgeInsets.only(
//                             bottom: 20,
//                           ),
//                           child: CustomTextField(
//                             icon: Icon(Icons.email),
//                             hint: "EMAIL",
//                             onSaved: (input) {
//                               _email = input;
//                             },
//                             validator: emailValidator,
//                           )),
//                       Padding(
//                           padding: EdgeInsets.only(bottom: 20),
//                           child: CustomTextField(
//                             icon: Icon(Icons.lock),
//                             obsecure: true,
//                             onSaved: (input) => _password = input,
//                             validator: (input) =>
//                                 input.isEmpty ? "*Required" : null,
//                             hint: "PASSWORD",
//                           )),
//                       Padding(
//                         padding: EdgeInsets.only(
//                             left: 20,
//                             right: 20,
//                             bottom: MediaQuery.of(context).viewInsets.bottom),
//                         child: _loading
//                             ? CircularProgressIndicator(
//                                 valueColor: new AlwaysStoppedAnimation<Color>(
//                                     primaryColor),
//                               )
//                             : Container(
//                                 child: outlineButton( _validateRegisterInput,"REGISTER"
//                                    ),
//                                 height: 50,
//                                 width: MediaQuery.of(context).size.width,
//                               ),
//                       ),
//                       SizedBox(
//                         height: 100,
//                       ),
//                     ]),
//                     key: _formKey,
//                     autovalidate: _autoValidate,
//                   ))),
//                 ],
//               ),
//               height: MediaQuery.of(context).size.height / 1.1,
//               width: MediaQuery.of(context).size.width,
//               //color: Colors.white,
//             ),
//           ),
//         );
//       });
//     }

//     return Scaffold(
//         resizeToAvoidBottomPadding: false,
//         key: _scaffoldKey,
        
//         body:Container(
//           decoration: BoxDecoration(
//             //color: Colors.blueGrey
//       gradient: LinearGradient(
//           colors: [Color(0xFF282a57),Colors.grey],
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter),
//     ),child:
//          Column(
//           children: <Widget>[
//             logo(),
//             SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
//             // Padding(
//             //   child: Container(
//             //     child: filledButton("LOGIN", primaryColor, Colors.white,
//             //         Colors.white, primaryColor, loginSheet),
//             //     height: 50,
//             //   ),
//             //   padding: EdgeInsets.only(
//             //       top: MediaQuery.of(context).size.height * 0.05,
//             //       left: 20,
//             //       right: 20),
//             // ),
//             //  Padding(
//             //   child: Container(
//             //     child: filledButton("REGISTER", primaryColor, Colors.white,
//             //         Colors.white, primaryColor, registerSheet),
//             //     height: 50,
//             //   ),
//             //   padding: EdgeInsets.only(
//             //       top: MediaQuery.of(context).size.height * 0.05,
//             //       left: 20,
//             //       right: 20),
//             // ),
//              Padding(
//               child: Container(
//                 child: outlineButton(loginSheet,"LOGIN"),
//                 height: 50,
//               ),
//               padding: EdgeInsets.only(top: 10, left: 20, right: 20),
//             ),
//             Padding(
//               child: Container(
//                 child: outlineButton(registerSheet,"REGISTER"),
//                 height: 50,
//               ),
//               padding: EdgeInsets.only(top: 10, left: 20, right: 20),
//             ),
//             // Expanded(
//             //   child: Align(
//             //     child: ClipPath(
//             //       child: Container(
//             //         color: Colors.white,
//             //         height: 300,
//             //       ),
//             //       clipper: BottomWaveClipper(),
//             //     ),
//             //     alignment: Alignment.bottomCenter,
//             //   ),
//             // )
//           ],
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//         )));
//   }
// }



