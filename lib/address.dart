import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laza/cartPage.dart';

class Address extends StatefulWidget {
  const Address({super.key});

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  bool isValue = false;
  AppBar cartAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CartPage(),
            ),
          );
        },
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFD3D3D3),
          ),
          margin: const EdgeInsets.all(8),
          child: const CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
            ),
          ),
        ),
      ),
      title: const Padding(
        padding: EdgeInsets.only(left: 75),
        child: Text(
          'Address',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
  Widget txtBox(String text, double txtwidth,TextInputType txttype){
    return SizedBox(
      width: txtwidth ,
      child: TextField(
        keyboardType: txttype,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[300],
          labelText: text,
          labelStyle: const TextStyle(
            color: Colors.grey,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          enabledBorder: const OutlineInputBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(
                color: Colors.white,
              )),
          focusedBorder: const OutlineInputBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: const Color(0xFF7661C5),
          child: TextButton(
            onPressed: () {
              // _logIn();
            },
            child: const Text(
              'Save Address',
              style: TextStyle(
                fontFamily: 'inter',
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      appBar: cartAppBar(context),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20.0,
              ),
              const Text('Name',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              txtBox('Shah Kaivan', double.infinity,TextInputType.text),
              const SizedBox(
                height: 20.0,
              ),
              const Row(
                children: [
                  Text('Country',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 100.0,
                  ),
                  Text('City',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  txtBox('India', 160.0,TextInputType.text),
                  const SizedBox(
                    width: 20.0,
                  ),
                  txtBox('Bhavnagar', 164.0,TextInputType.text),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text('Phone Number',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              txtBox('+91 12345687999', double.infinity,TextInputType.number),
              const SizedBox(
                height: 20.0,
              ),
              const Text('Address',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              txtBox('Vijayrajnagar', double.infinity, TextInputType.text),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  const Text(
                    'Save as primary address',
                    style: TextStyle(
                      fontFamily: 'inter',
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  CupertinoSwitch(
                    trackColor: Colors.grey,
                    activeColor: Colors.green,
                    value: isValue,
                    onChanged: (value) {
                      setState(() {
                        isValue = value;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

    );
  }
}
