import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:laza/OTP.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'logIn.dart';
import 'package:http/http.dart' as http;

bool validateCredentials(String email) {
  if (email.isNotEmpty) {
    return true; // Credentials are valid
  }
  return false;
}


class ResetPass extends StatefulWidget {
  const ResetPass({super.key});

  @override
  State<ResetPass> createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {
  final TextEditingController _email = TextEditingController();
  // EmailOTP myauth = EmailOTP();
  bool _emailerror = false;
  Widget conBottom(String str) {

    final String email = _email.text;
    const String apiUrl = 'http://192.168.0.194:3000/forget';

    Map<String, String> headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {
      'email': email,
    };
    return Container(
      width: double.infinity,
      height: 70.0,
      color: const Color(0xFF7661C5),
      child: TextButton(
        onPressed: () async {
          setState(() {
            _emailerror = !validateCredentials(email);
          });
          if(!_emailerror){
            try{
              final response = await http.post(
                Uri.parse(apiUrl),
                headers: headers,
                body: jsonEncode(body),
              );
              if(response.statusCode==400){
                Alert(context: context,
                    title: 'Email Required',
                    desc: 'Enter your login Email ID'
                ).show();
              }
              else if(response.statusCode==404){
                Alert(context: context,
                    title: 'Invalid Email',
                    desc: 'This Email ID doesn\'t exists'
                ).show();
              }
              else if(response.statusCode==200){
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('OTP Sent Successfully')));
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Otp()));
              }
            }
            catch(e){

            }
          }
        },

        //   myauth.setConfig(
        //       appEmail: "kaivanpshah2003@gmail.com",
        //       appName: "Email OTP",
        //       userEmail: _email.text,
        //       otpLength: 4,
        //       otpType: OTPType.digitsOnly);
        //   if (await myauth.sendOTP() == true) {
        //     ScaffoldMessenger.of(context).showSnackBar(
        //         const SnackBar(content: Text('OTP Sent Successfully')));
        //     Navigator.push(
        //         context, MaterialPageRoute(builder: (context) => Otp()));
        //   }
        //   else{
        //     ScaffoldMessenger.of(context).showSnackBar(
        //         const SnackBar(content: Text('Oops, OTP sent failed')));
        //   }
        // },
        child: Text(
          str,
          style: const TextStyle(
            fontFamily: 'inter',
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget inText(String text, double ver, TextEditingController cont) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ver, horizontal: 30.0),
      child: TextField(
        controller: cont,
        decoration: InputDecoration(
          labelText: text,
          labelStyle: const TextStyle(color: Colors.grey),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const logIn()));
                },
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                ),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  backgroundColor: Color(0xFFD3D3D3),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Forgot Password',
                      style: TextStyle(
                        fontFamily: 'inter',
                        fontWeight: FontWeight.bold,
                        fontSize: 28.0,
                      ),
                    ),
                    Image(image: AssetImage('images/forget.png'))
                  ],
                ),
              ),
              inText('Email Address', 80.0, _email),
              SizedBox(
                height: 100.0,
              ),
              const Text(
                'Please write your email to receive a confirmation code to set a new password.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'inter',
                  fontSize: 15.0,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              conBottom('Confirm Code'),
            ],
          ),
        ),
      ),
    );
  }
}
