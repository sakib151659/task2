import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:task2/authenticate/forgetPass.dart';
import 'package:task2/authenticate/signup.dart';
import 'package:task2/home/home.dart';
import 'package:task2/sharedFile/textInputDecoration.dart';
import 'package:google_fonts/google_fonts.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  // text field state
  String userName = '';
  String password = '';
  String error = '';
  bool passwordIcon = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Padding(
          padding: const EdgeInsets.fromLTRB(30.0,10,30,0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                CircleAvatar(
                    backgroundColor: HexColor("#0E9AD6"),
                    radius: 18,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                      child: InkWell(
                        child: Icon(
                          Icons.arrow_back_ios, size: 30,
                        ),
                        onTap: (){

                        },
                      ),
                    ),
                  ),

                SizedBox(height:130),



                Text(
                  'Welcome Back!',
                  style: GoogleFonts.ebGaramond(
                    textStyle: TextStyle(color: HexColor("#0C9AD6"),
                      fontSize: 27.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Text(
                  "GREAT DEALS ARE WAITING FOR YOU.",
                  style: TextStyle(color: HexColor("#0C9AD6"),
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),

                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      TextFormField(

                          decoration:textInputDecoration.copyWith(
                            hintText: 'Username',
                          ),
                          validator: (val) => val!.isEmpty? 'Enter an user Name' : null ,
                          onChanged: (val){
                            setState(()=> userName = val);

                          }
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                          decoration:textInputDecoration.copyWith(
                            hintText: 'Password',
                            // suffixIcon: InkWell(
                            //     child: Icon(Icons.remove_red_eye, ),
                            //   onTap: (){
                            //       setState(() {
                            //         passwordIcon: false;
                            //       });
                            //   },
                            // ),

                              suffixIcon: IconButton(
                                  icon: Icon(
                                      passwordIcon ? Icons.visibility : Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      passwordIcon = !passwordIcon;
                                    });
                                  })

                          ),

                          obscureText: passwordIcon,
                          validator: (val) => val!.length < 6 ? 'Enter at lest 6 digit password' : null ,
                          onChanged: (val){
                            setState(()=> password = val);

                          }
                      ),

                      ////////////////////////////////
                      SizedBox(height: 12.0),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[

                            InkWell(
                              child: Text(
                                "Forget password?",
                                style: TextStyle(color: HexColor("#272727"), fontSize: 18.0,  ),
                              ),
                              onTap: () async{

                                Navigator.push(context, new MaterialPageRoute(builder: (context) => ForgetPassword() ));

                              },
                            ),


                          ],
                        ),
                      ),
                      ///////////////////////////////////

                      SizedBox(height: 20.0),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                                height: 50,
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: ElevatedButton(
                                    child: const Text('LOGIN',
                                      style: TextStyle(color: Colors.white, fontSize: 17.0, ),
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        Navigator.of(context).pop();
                                        Navigator.push(context, new MaterialPageRoute(builder: (context) => HomePage() ));
                                    }

                                    },
                                  ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 12.0),
                      Text(
                        "-or-",
                        style: TextStyle(color: HexColor("#272727"), fontSize: 14.0),
                      ),

                      SizedBox(height: 20.0),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              height: 50,
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: ElevatedButton(
                                child: const Text('FACEBOOK',
                                  style: TextStyle(color: Colors.white, fontSize: 17.0, ),
                                ),
                                onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.push(context, new MaterialPageRoute(builder: (context) => HomePage() ));
                                  }

                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 12.0),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                      ),


                      SizedBox(height: 12.0),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FittedBox(
                              child: Text(
                                "Don't have an Account?",
                                style: TextStyle(color: Colors.black87, fontSize: 14.0),
                              ),
                            ),
                            InkWell(
                              child: FittedBox(
                                child: Text(
                                  " SIGN UP",
                                  style: TextStyle(color: HexColor("#0E9AD6"), fontSize: 14.0, decoration:TextDecoration.underline,),
                                ),
                              ),
                              onTap: () async{
                                Navigator.of(context).pop();
                                Navigator.push(context, new MaterialPageRoute(builder: (context) => SignUp() ));


                              },
                            ),


                          ],
                        ),
                      ),

                    ],
                  ),
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
