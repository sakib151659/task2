import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:task2/home/home.dart';
import 'package:task2/sharedFile/textInputDecoration.dart';

import 'login.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  final _formKey = GlobalKey<FormState>();
  // text field state
  String firstName = '';
  String lastName = '';
  String Email = '';
  String password = '';
  String error = '';
  String contactNumber = '';
  String city = '';
  String zipCode = '';
  String checkBoxText = 'I agree to the ';
  bool checked = false;
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
                  child: InkWell(
                    child: Icon(
                      Icons.arrow_back_ios, size: 30,
                    ),
                    onTap: (){

                      Navigator.push(context, new MaterialPageRoute(builder: (context) => LoginPage() ));


                    },
                  ),
                ),

                SizedBox(height:130),



                Text(
                  'Welcome to Thymbol!',
                  style: GoogleFonts.ebGaramond(
                    textStyle: TextStyle(color: HexColor("#0C9AD6"),
                      fontSize: 27.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Text(
                  "WHERE BUSINESS AND CONSUMERS MEET.",
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
                                    hintText: 'FirstName*',
                                  ),
                                  validator: (val) => val!.isEmpty? 'Enter your First Name' : null ,
                                  onChanged: (val){
                                    setState(()=> firstName = val);

                                  }
                              ),

                            SizedBox(height: 20,),
                                TextFormField(
                                  decoration:textInputDecoration.copyWith(
                                    hintText: 'LastName*',
                                  ),
                                  validator: (val) => val!.isEmpty? 'Enter your Last Name' : null ,
                                  onChanged: (val){
                                    setState(()=> lastName = val);

                                  }
                              ),
                      SizedBox(height: 20.0),

                      TextFormField(

                          decoration:textInputDecoration.copyWith(
                            hintText: 'Email*',
                          ),
                          validator: (val) => val!.isEmpty? 'Enter your Email' : null ,
                          onChanged: (val){
                            setState(()=> Email = val);

                          }
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                          decoration:textInputDecoration.copyWith(
                            hintText: 'Password*',
                          ),

                          obscureText: true,
                          validator: (val) => val!.length < 6 ? 'Enter at lest 6 digit password' : null ,
                          onChanged: (val){
                            setState(()=> password = val);

                          }
                      ),

                      SizedBox(height: 20.0),

                      TextFormField(

                          decoration:textInputDecoration.copyWith(
                            hintText: 'Contact Number*',
                          ),
                          validator: (val) => val!.isEmpty? 'Enter your Contact Number' : null ,
                          onChanged: (val){
                            setState(()=> contactNumber = val);

                          }
                      ),

                      SizedBox(height: 20.0),

                      TextFormField(

                          decoration:textInputDecoration.copyWith(
                            hintText: 'City*',
                            suffixIcon: Icon(Icons.search, ),
                          ),
                          validator: (val) => val!.isEmpty? 'Enter your City' : null ,
                          onChanged: (val){
                            setState(()=> city = val);

                          }
                      ),

                      SizedBox(height: 20.0),

                      TextFormField(

                          decoration:textInputDecoration.copyWith(
                            hintText: 'Zip Code*',
                            suffixIcon: Icon(Icons.refresh, ),
                          ),
                          validator: (val) => val!.isEmpty? 'Enter your zip code' : null ,
                          onChanged: (val){
                            setState(()=> zipCode = val);

                          }

                      ),

                      SizedBox(height: 20,),

                      Row(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Checkbox(
                                value: this.checked,
                                onChanged: (checked) {
                                  setState(() {
                                    this.checked = checked!;
                                  });
                                },
                                activeColor: HexColor("#0C9AD6"),
                                focusColor: Colors.white,
                              ),


                            Text(checkBoxText,style: TextStyle(color: Colors.black54,
                              fontSize: 15,
                            ),
                            ),

                            InkWell(
                              child: Text('Terms & Conditions',style: TextStyle(color: HexColor("#0C9AD6"),decoration:TextDecoration.underline,
                                fontSize: 15,
                              ),
                              ),
                              onTap: (){
                                setState(() {

                                });
                              },
                            ),
                            SizedBox(width: 10,),
                            Icon(Icons.hide_source, color: Colors.white,)

                          ],
                        ),


                      SizedBox(height: 20.0),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              height: 50,
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: ElevatedButton(
                                child: const Text('REGISTER',
                                  style: TextStyle(color: Colors.white, fontSize: 17.0, ),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate() & checked ) {
                                    Navigator.of(context).pop();
                                    Navigator.push(context, new MaterialPageRoute(builder: (context) => HomePage() ));
                                  }else {
                                    setState(() {
                                      checkBoxText = 'Please read ';

                                    });
                                  }

                                },
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
