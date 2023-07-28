import 'dart:async';
import 'newpass.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pass.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  int _start = 20;
  late Timer _timer;
  String _timerText = '00:20';
  bool _showResendButton = false;
  final TextEditingController _otp1 = TextEditingController();
  final TextEditingController _otp2 = TextEditingController();
  final TextEditingController _otp3 = TextEditingController();
  final TextEditingController _otp4 = TextEditingController();

  Widget conBottom(String str) {
    // const String apiUrl = 'http://192.168.0.194:3000/forget';
    // String otp = _otp1.text + _otp2.text + _otp3.text + _otp4.text;
    // int? value = int.tryParse(otp);
    // Map<String, String> headers = {'Content-Type': 'application/json'};
    // Map<String, dynamic> body = {
    //   'email': email,
    //   'otp': value
    // };
    return Container(
      width: double.infinity,
      height: 70.0,
      color: const Color(0xFF7661C5),
      child: TextButton(
        onPressed: () async {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const NewPass()));
          // if(await widget.verifyOTP(otp: ))
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
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            _showResendButton = true;
          });
        } else {
          setState(() {
            _start--;
            _timerText = '${_start ~/ 60}:${_start % 60}'.padLeft(2, '0');
          });
        }
      },
    );
  }

  void resendOtp() {
    setState(() {
      _start = 20;
      _showResendButton = false;
      startTimer();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget otpText(TextEditingController cont) {

    return SizedBox(
      width: 68.0,
      child: TextFormField(
        controller: cont,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        onSaved: (pin1) {},
        decoration: const InputDecoration(
            hintText: "0",
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            )),
        style: Theme.of(context).textTheme.titleLarge,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
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
                      'Verification Code',
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
              const SizedBox(
                height: 70.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  otpText(_otp1),
                  otpText(_otp2),
                  otpText(_otp3),
                  otpText(_otp4),
                ],
              ),
              const SizedBox(
                height: 210.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (!_showResendButton)
                    Text(
                      _timerText,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  if (_showResendButton)
                    GestureDetector(
                      onTap: () {
                        resendOtp();
                      },
                      child: const Text(
                        'Resend OTP',
                         style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),

                  const Text('resend confirmation code.')
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              conBottom('Confirm Code')
            ],
          ),
        ),
      ),
    );
  }
}
