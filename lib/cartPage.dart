import 'package:flutter/material.dart';
import 'package:laza/address.dart';
import 'package:laza/confirm.dart';
import 'package:laza/main.dart';
import 'cartItems.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  AppBar cartAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MyHomePage(title:''),
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
        padding: EdgeInsets.only(left: 95),
        child: Text(
          'Cart',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cartAppBar(context),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: const Color(0xFF7661C5),
          child: TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Confirm()));
            },
            child: const Text(
              'Checkout',
              style: TextStyle(
                fontFamily: 'inter',
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 500,
            padding: const EdgeInsets.only(top: 15.0),
            decoration: const BoxDecoration(
              color: Color(0xFFEDECF2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: const Column(
              children: [
                CartItems(),
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                const Text(
                  'Delivery Address',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Address(),
                      ),
                    );
                  },
                  child: const Icon(Icons.arrow_forward_ios, size: 15.0),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbNvqugXh0VzdRykozxtrXzW-n0L-d-4KNRA&usqp=CAU',
                  height: 60.0,
                  width: 60.0,
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Vijayrajnagar'),
                    Text(
                      'Bhavnagar',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 30.0,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: const Row(
              children: [
                Text(
                  'Payment Method',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Spacer(),
                Icon(Icons.arrow_forward_ios, size: 15.0),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOE59eESJs4fIzUA_hgYJ4OpSgIKyEi_dvEA&usqp=CAU',
                  height: 60.0,
                  width: 60.0,
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Visa Premium'),
                    Text(
                      '***** 12345',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 30.0,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: const Row(
              children: [
                Text(
                  'Order Info',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Spacer(),
                Icon(Icons.arrow_forward_ios, size: 15.0),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Subtotal',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey[400],
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      '\$123',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Text(
                      'Shipping Cost',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey[400],
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      '\$10',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey[400],
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      '\$133',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
