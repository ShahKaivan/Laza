import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:laza/bottomNav.dart';
import 'package:laza/itemView.dart';
import 'package:laza/navbar.dart';
import 'Gen.dart';
import 'cartPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AnimatedSplashScreen(
          duration: 3000,
          splash: const Center(
            child: Text(
              'Laza',
              style: TextStyle(
                fontSize: 50,
                color: Colors.white,
                fontFamily: 'DancingScript',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          nextScreen: const Gen(),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Color(0xFF7661C5)),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<bool> isSelectedList = [false, false, false, false];
  Widget buildChip(String text, String logo, int index) {
    return Transform(
      transform: Matrix4.identity()..scale(1.4),
      child: Theme(
        data: ThemeData(
          chipTheme: ChipThemeData(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        child: FilterChip(
          label: Text(text),
          selected: isSelectedList[index],
          onSelected: (bool value) {
            setState(() {
              isSelectedList[index] = value;
            });
          },
          avatar: Container(
            color: Colors.white,
            child: Image(
              image: AssetImage('images/$logo'),
            ),
          ),
        ),
      ),
    );
  }

  // Widget Material(int img, String txt, String price){
  //   return Container(
  //         decoration: const BoxDecoration(
  //           color: Colors.white,
  //         ),
  //         child: Image.asset('images/Clothes/Clothes$img.png'),
  //         child: Text(txt),
  //         child: Text('\$$price'),
  //       );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNav(),
      drawer: const NavBar(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(
              Icons.align_horizontal_left_rounded,
            ),
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        }),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
            },
            icon: Icon(Icons.card_travel_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hello',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Welcome to Laza.',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey,
                  ),
                ),
                const Row(
                  children: [
                    SizedBox(
                      width: 270.0,
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFD3D3D3),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          labelText: "Search...",
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide(
                                color: Colors.white,
                              )),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    SizedBox(
                      width: 65.0,
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFF7661C5),
                          prefixIcon: Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.mic_none_rounded,
                                color: Colors.white,
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide(
                                color: Colors.white,
                              )),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    const Text(
                      'Choose Brand',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'View All',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    height: 80.0,
                    child: Row(
                      children: [
                        buildChip('Adidas', 'Adidas.png', 0),
                        SizedBox(width: 45.0),
                        buildChip('Nike', 'Nike.png', 1),
                        SizedBox(width: 40.0),
                        buildChip('Fila', 'Fila.png', 2),
                        SizedBox(width: 40.0),
                        buildChip('Puma', 'Puma.png', 3),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      'New Arraival',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'View All',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
                // Material(1,'Nike Sportswear Club\n Fleece','99'),
                ItemView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
