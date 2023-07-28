import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laza/logIn.dart';
import 'SignIn.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;

bool validateCredentials(String username, String password, String email) {
  if (username.isNotEmpty && password.isNotEmpty && email.isNotEmpty) {
    return true; // Credentials are valid
  }
  return false;
}

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _email = TextEditingController();
  bool _isLoginError = false;
  bool isSwitch = false;
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
          Spacer(),
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

  Future<void> _logIn() async {
    final String username = _username.text;
    final String password = _password.text;
    final String email = _email.text;

    const String apiUrl = 'http://192.168.0.194:3000/signup';

    Map<String, String> headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {
      'username': username,
      'password': password,
      'email': email,
    };

    setState(() {
      _isLoginError = !validateCredentials(username, password, email);
    });

    if (!_isLoginError) {
      try {
        final response = await http.post(
          Uri.parse(apiUrl),
          headers: headers,
          body: jsonEncode(body),
        );
        if(response.statusCode == 409){
          Alert(context: context,
              title: 'Already Exists',
              desc: 'Username or Email already exists'
          ).show();
        }
        else if (response.statusCode == 201) {
          print('User created successfully');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => logIn(),
            ),
          );
          // Handle successful signup, such as displaying a success message or navigating to the next screen.
        } else {
          print('Failed to create user');
          // Handle failed signup, such as displaying an error message.
        }
      } catch (e) {
        print('Error: $e');
      }
    }
    else{
      Alert(context: context,
          title: 'Enter Data',
          desc: 'Enter Username, Password, Email Address'
      ).show();
    }
  }

  Widget conBottom(String str) {
    return Container(
      width: double.infinity,
      height: 82.0,
      color: Color(0xFF7661C5),
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
      bottomNavigationBar: conBottom('Sign Up'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => signIn()));
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
                      'Sign Up',
                      style: TextStyle(
                        fontFamily: 'inter',
                        fontWeight: FontWeight.bold,
                        fontSize: 28.0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 160.0,
              ),
              inText('Username', 10.0, _username),
              inText('Password', 0.0, _password),
              inText('Email Address', 10.0, _email),
              const SizedBox(
                height: 50.0,
              ),
              switchIn(),
              const SizedBox(
                height: 100.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
