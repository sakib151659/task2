import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:task2/authenticate/login.dart';
import 'package:task2/sharedFile/textInputDecoration.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formKey = GlobalKey<FormState>();
  // text field state
  String Email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30.0,10,30,0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: HexColor("#0E9AD6"),
                  radius: 18,
                  child: InkWell(
                    child: Icon(
                      Icons.arrow_back_ios, size: 30,
                    ),
                    onTap: (){
                      Navigator.of(context).pop();
                      Navigator.push(context, new MaterialPageRoute(builder: (context) => LoginPage() ));

                    },
                  ),
                ),

                SizedBox(height:130),



                Text(
                  'Forget Password!',
                  style: GoogleFonts.ebGaramond(
                    textStyle: TextStyle(color: HexColor("#0C9AD6"),
                      fontSize: 27.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Text(
                  "YOU CAN EASILY RECOVER IT.",
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
                            hintText: 'Email',
                          ),
                          validator: (val) => val!.isEmpty? 'Enter your Email' : null ,
                          onChanged: (val){
                            setState(()=> Email = val);

                          }
                      ),


                      SizedBox(height: 12.0),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                      ),


                    ],
                  ),
                ),
                Text(
                  "We'll send the recovery link to your email.",
                  style: TextStyle(color: HexColor("#272727"), fontSize: 14.0),
                ),

                SizedBox(height: 68.0),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: ElevatedButton(
                          child: const Text('SEND RECOVERY LINK',
                            style: TextStyle(color: Colors.white, fontSize: 17.0, ),
                          ),
                          onPressed: () {

                          },
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
