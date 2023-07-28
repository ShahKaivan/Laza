import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class CartItems extends StatelessWidget {
//   List<int> isValue = [1,1,1];
//   CartItems({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         for(int i=1;i<4;i++)
//         Container(
//           height: 130,
//           margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//           padding: EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Row(
//             children: [
//               Container(
//                 height: 100,
//                 width: 100,
//                 margin: EdgeInsets.only(right: 15),
//                 child: Image.asset('images/Clothes/Clothes$i.png'),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text('Nike Sportswear Club \nFleece',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10.0,
//                   ),
//                   Text('\$45 (-\$4.00 Tax)',
//                     style: TextStyle(
//                       color: Colors.grey[400],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10.0,
//                   ),
//                   Row(
//                     children: [
//                       Container(
//                         padding: EdgeInsets.all(4.0),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(20),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.5),
//                               spreadRadius: 1,
//                               blurRadius: 10,
//                             )
//                           ]
//                         ),
//                         child: GestureDetector(
//                           onTap: () {
//                             isValue[i]++;
//                           },
//                           child: const Icon(
//                             CupertinoIcons.minus,
//                             size: 18,
//                           ),
//                         ),
//                       ),
//                       Container(
//                         margin: const EdgeInsets.symmetric(horizontal: 10),
//                         child: Text(isValue[i] as String,
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       Container(
//                         padding: EdgeInsets.all(4.0),
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(20),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey.withOpacity(0.5),
//                                 spreadRadius: 1,
//                                 blurRadius: 10,
//                               )
//                             ]
//                         ),
//                         child: GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               isValue[i]++;
//                             });
//                           },
//                           child: const Icon(
//                             Icons.add,
//                             size: 18,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
class CartItems extends StatefulWidget {
  const CartItems({super.key});

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  List<int> isValue = [1,1,1,1];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for(int i=1;i<4;i++)
        Container(
          height: 130,
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Container(
                height: 100,
                width: 100,
                margin: EdgeInsets.only(right: 15),
                child: Image.asset('images/Clothes/Clothes$i.png'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Nike Sportswear Club \nFleece',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text('\$45 (-\$4.00 Tax)',
                    style: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 10,
                            )
                          ]
                        ),
                        child: GestureDetector(
                          onTap: () {
                            if(isValue[i]>0){
                              setState(() {
                                isValue[i]--;
                              });
                            }
                          },
                          child: const Icon(
                            CupertinoIcons.minus,
                            size: 18,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(isValue[i].toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 10,
                              )
                            ]
                        ),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isValue[i]++;
                            });
                          },
                          child: const Icon(
                            Icons.add,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}