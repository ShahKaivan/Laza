import 'package:flutter/material.dart';
import 'SignIn.dart';

class Gen extends StatefulWidget {
  const Gen({super.key});

  @override
  State<Gen> createState() => _GenState();
}

class _GenState extends State<Gen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // color: Colors.deepPurple[400],
        decoration: const BoxDecoration(
          color: Color(0xFF7661C5),
          image: DecorationImage(
            image: AssetImage('images/BackGen.png'),
            fit: BoxFit.cover,
          ),
        ),
        // child: Align(
        //   alignment: Alignment.bottomCenter,
        //   child: FractionallySizedBox(
            // widthFactor: 0.8,
            // heightFactor: 0.35,
            // crossAxisAlignment: CrossAxisAlignment.center,
            // children: <Widget>[
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(top: 50.0),
                width: MediaQuery.of(context).size.width * 0.9,
                height: 250,
                // padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      'Look Good, Feel Good',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'poppins',
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      'Create your individual & unique style and look amazing everyday.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'poppins',
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // Padding(padding: EdgeInsets.all(5.0),),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Men',
                            style: TextStyle(color: Colors.grey, fontSize: 25.0),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.white),
                            shape:
                                MaterialStatePropertyAll<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            fixedSize:
                                MaterialStateProperty.all(Size(155.0, 60.0)),
                            overlayColor:
                                MaterialStateProperty.all(Color(0xFF7661C5)),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        TextButton(
                          onPressed: () => null,
                          child: Text(
                            'Women',
                            style: TextStyle(color: Colors.grey, fontSize: 25.0),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.white),
                            shape:
                                MaterialStatePropertyAll<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            fixedSize:
                                MaterialStateProperty.all(Size(155.0, 60.0)),
                            overlayColor:
                                MaterialStateProperty.all(Color(0xFF7661C5)),
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => signIn()));
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(color: Colors.grey, fontSize: 15.0),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(21),
                ),
              ),
            ),
          ),
        );
  }
}
