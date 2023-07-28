import 'package:flutter/material.dart';
import 'package:laza/itemScreen.dart';


class ItemView extends StatefulWidget {
  const ItemView({super.key});

  @override
  State<ItemView> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.68,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for (int i = 1; i <= 4; i++)
          Container(
            // color: Colors.grey[400],
            padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ItemScreen(i.toString())));
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Image.asset('images/Clothes/Clothes$i.png'),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.grey[400],
                        size: 24,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  alignment: Alignment.centerLeft,
                  child: const Text('Nike Sportswear Club Fleece'),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    '\$99',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
