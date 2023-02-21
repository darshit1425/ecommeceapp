import 'package:flutter/material.dart';

import '2.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  List Images = [
    "assets/images/airpods.png",
    "assets/images/i watch.png",
    "assets/images/homepods.png",
    "assets/images/ipad.png",
    "assets/images/iphone.png",
  ];
  List Price = [
    "\$26900.00",
    "\$82000.00",
    "\$8499.00",
    "\$41600.00",
    "\$139900.00",
  ];
  List Name = [
    "airpod",
    "i-watch",
    "homepod",
    "ipad",
    "i-phone",
  ];
  List Ratings=[
    "⭐⭐⭐",
    "⭐⭐⭐⭐",
    "⭐⭐⭐⭐⭐",
    "⭐⭐⭐⭐",
    "⭐⭐⭐⭐⭐",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff3064ec),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(25),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Explore Product",
                    style: TextStyle(
                      letterSpacing: 2,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 55,
                      width: 230,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "  🔍  Apple Product",
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 55,
                      width: 50,
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: Color(0xff3064ec),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: Images.asMap()
                      .entries
                      .map((e) => Product(e.key))
                      .toList(),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 225,
                    color: Color(0xff1b5aef),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                          ),
                          height: 60,
                          width: 60,
                          child: Icon(
                            Icons.favorite,
                            size: 35,
                            color: Color(0xff3064ec),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                          ),
                          height: 60,
                          width: 60,
                          child: Icon(
                            Icons.list,
                            size: 35,
                            color: Color(0xff3064ec),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                          ),
                          height: 60,
                          width: 60,
                          child: Icon(
                            Icons.shopping_bag,
                            size: 35,
                            color: Color(0xff3064ec),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget Product(int index) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          setState(
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProductDetail(Images[index], Price[index], Name[index],Ratings[index]),
                ),
              );
            },
          );
        },
        child: Container(
          height: 300,
          width: 200,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            shape: BoxShape.circle),
                        child: Icon(
                          Icons.favorite,
                          color: Color(0xff3064ec),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Color(0xff3064ec), shape: BoxShape.circle),
                        child: Icon(
                          Icons.local_mall_outlined,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Image.asset(Images[index]),
              SizedBox(height: 20),
              Text("${Name[index]}"),
              Text("${Price[index]}"),
              Text("${Ratings[index]}"),
            ],
          ),
        ),
      ),
    );
  }
}
