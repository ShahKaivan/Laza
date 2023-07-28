import 'package:flutter/material.dart';
import 'package:laza/Gen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laza/signUp.dart';
import 'logIn.dart';

class signIn extends StatefulWidget {
  const signIn({super.key});

  @override
  State<signIn> createState() => _signInState();
}

class _signInState extends State<signIn> {
  Widget conBottom(String str){
    return Container(
      width: double.infinity,
      height: 82.0,
      color: Color(0xFF7661C5),
      child: TextButton(onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => signUp()));
      },
        child: Text(str,
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: conBottom('Create an Account'),
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
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Gen()));
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
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Let\'s Get Started',
                        style: TextStyle(
                          fontFamily: 'inter',
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0,
                        ),
                      ),
                      const SizedBox(
                        height: 180.0,
                      ),
                      const Card(
                        color: Colors.blue,
                        margin: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 30.0),
                        child: ListTile(
                          leading: Icon(
                            Icons.facebook_rounded,
                            color: Colors.white,
                          ),
                          title: Text(
                            'Facebook',
                            style: TextStyle(
                              fontFamily: 'inter',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                      const Card(
                        color: Colors.lightBlue,
                        margin:
                            EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
                        child: ListTile(
                          leading: Icon(
                            FontAwesomeIcons.twitter,
                            color: Colors.white,
                          ),
                          title: Text(
                            'Twitter',
                            style: TextStyle(
                              fontFamily: 'inter',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                      const Card(
                        color: Colors.redAccent,
                        margin: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 30.0),
                        child: ListTile(
                          leading: Icon(
                            FontAwesomeIcons.google,
                            color: Colors.white,
                          ),
                          title: Text(
                            'Google',
                            style: TextStyle(
                              fontFamily: 'inter',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 150.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'Already have an account?',
                            style: TextStyle(
                              fontFamily: 'inter',
                              fontSize: 15.0,
                              color: Colors.grey,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                MaterialPageRoute(builder: (context) => logIn())
                              );
                            },
                            child: const Text(
                              'Signin',
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'inter',
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
