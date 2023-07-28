import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laza/main.dart';
import 'pass.dart';
import 'SignIn.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;

bool validateCredentials(String username, String password) {
  if (username.isNotEmpty && password.isNotEmpty) {
    return true; // Credentials are valid
  }
  return false;
}

class logIn extends StatefulWidget {
  const logIn({super.key});

  @override
  State<logIn> createState() => _logInState();
}

class _logInState extends State<logIn> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoginError = false;
  bool isSwitch = false;

  Future<void> _logIn() async {
    final String username = _usernameController.text;
    final String password = _passwordController.text;
    const String apiUrl = 'http://192.168.0.194:3000/login';
    Map<String, String> headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {
      'username': username,
      'password': password,
    };

    setState(() {
      _isLoginError = !validateCredentials(username, password);
    });

    if(!_isLoginError){
      try{
        final response = await http.post(
          Uri.parse(apiUrl),
          headers: headers,
          body: jsonEncode(body),
        );
        if(response.statusCode == 200){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyHomePage(title: ''),
            ),
          );
        }
        else if(response.statusCode == 401){
          Alert(context: context,
              title: 'Invalid Data',
              desc: 'Invalid Username or Password'
          ).show();
        }
        else{
          print('Failed to Authenticate');
        }
      }catch (e) {
        print('Error: $e');
      }
    }
    else{
      Alert(context: context,
          title: 'Required Field',
          desc: 'Enter Username and Password'
      ).show();
    }
    // if (!_isLoginError) {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => MyHomePage(title: 'laza'),
    //     ),
    //   );
    // }
    // else{
    //   Alert(context: context,
    //       title: 'Invalid Data',
    //       desc: 'Invalid Username or Password'
    //   ).show();
    // }
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

  Widget switchIn() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
      child: Row(
        children: <Widget>[
          const Text(
            'Remember me',
            style: TextStyle(
              fontFamily: 'inter',
              fontSize: 16.0,
            ),
          ),
          const Spacer(),
          CupertinoSwitch(
            trackColor: Colors.grey,
            activeColor: Colors.green,
            value: isSwitch,
            onChanged: (value) {
              setState(() {
                isSwitch = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget conBottom(String str) {
    return Container(
      width: double.infinity,
      height: 82.0,
      color: const Color(0xFF7661C5),
      child: TextButton(
        onPressed: () {
          _logIn();
        },
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: conBottom('Login'),
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
                      MaterialPageRoute(builder: (context) => const signIn()));
                },
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                ),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
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
                      'Welcome',
                      style: TextStyle(
                        fontFamily: 'inter',
                        fontWeight: FontWeight.bold,
                        fontSize: 28.0,
                      ),
                    ),
                    Text(
                      'Please enter your data to continue',
                      style: TextStyle(
                        fontFamily: 'inter',
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 180.0,
              ),
              //
              inText('Username', 10.0, _usernameController),
              inText('Password', 0.0, _passwordController),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ResetPass())
                      );
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.red[200],
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              switchIn(),
              const SizedBox(
                height: 70.0,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          'By connecting your account confirm that you agree with our',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ' Terms and condition',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 14.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
              // const SizedBox(
              //   height: 20.0,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
