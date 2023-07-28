import 'package:flutter/material.dart';
import 'package:laza/main.dart';

class Confirm extends StatelessWidget {
  const Confirm({super.key});

  Widget conBottom(String str,BuildContext context){
    return Container(
      width: double.infinity,
      height: 106.0,
      color: Color(0xFF7661C5),
      child: TextButton(onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(title: ''),
          ),
        );
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
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
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
              height: 130.0,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(image: AssetImage('images/Confirmed.png')),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    'Order Confirmed',
                    style: TextStyle(
                      fontFamily: 'inter',
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Your Order has been Confirmed Successfully',
                    style: TextStyle(
                      fontFamily: 'inter',
                      color: Colors.grey[400],
                      // fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            // const SizedBox(
            //   height: 181.0,
            // ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: conBottom('Contiinue Shopping',context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
