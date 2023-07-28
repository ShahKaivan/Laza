import 'package:flutter/material.dart';
import 'pass.dart';

class NewPass extends StatefulWidget {
  const NewPass({super.key});

  @override
  State<NewPass> createState() => _NewPassState();
}

class _NewPassState extends State<NewPass> {
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _conf = TextEditingController();
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

  Widget conBottom(String str) {
    return Container(
      width: double.infinity,
      height: 70.0,
      color: const Color(0xFF7661C5),
      child: TextButton(
        onPressed: () {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => Otp()));
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ResetPass()));
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
                      'New Password',
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
                height: 180.0,
              ),
              inText('Password', 0.0, _pass),
              inText('Confirm Password', 0.0, _conf),
              const SizedBox(
                height: 265.0,
              ),
              const Center(
                child: Text('Please write your new password',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              conBottom('Reset Password'),
            ],
          ),
        ),
      ),
    );
  }
}
