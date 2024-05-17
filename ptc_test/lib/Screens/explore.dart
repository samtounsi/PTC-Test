import 'package:flutter/material.dart';
import 'package:ptc_test/Models/categoryElement.dart';
import 'package:ptc_test/Screens/beverage.dart';

import '../Components/basics.dart';

// ignore: must_be_immutable
class Explore extends StatelessWidget {
  Explore({super.key});

  List<CategoryElement> categories = [
    CategoryElement(
        image: 'assets/images/test1.png',
        category: 'Fresh Fruits & Vegetables',
        color: Color.fromARGB(25, 83, 177, 117)),
    CategoryElement(
        image: 'assets/images/test2.png',
        category: 'Cooking Oil & Ghee',
        color: Color.fromRGBO(248, 164, 76, 0.1)),
    CategoryElement(
        image: 'assets/images/test3.png',
        category: 'Meat & Fish',
        color: Color.fromRGBO(247, 165, 147, 0.1)),
    CategoryElement(
        image: 'assets/images/test4.png',
        category: 'Bakery & Snacks',
        color: Color.fromRGBO(211, 176, 224, 0.25)),
    CategoryElement(
        image: 'assets/images/test5.png',
        category: 'Diary & Eggs',
        color: Color.fromRGBO(253, 229, 152, 0.25)),
    CategoryElement(
        image: 'assets/images/test6.png',
        category: 'Beverages',
        color: Color.fromRGBO(183, 223, 245, 0.25)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        physics: BouncingScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Beverages(category: categories[index].category)));
            },
            child: Container(
              decoration: BoxDecoration(
                color: categories[index].color,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: AddOp(categories[index].color),
                  style: BorderStyle.solid,
                  strokeAlign: BorderSide.strokeAlignInside,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    categories[index].image,
                    height: 142,
                    width: 160,
                    fit: BoxFit.contain,
                  ),
                  text(categories[index].category,
                      fontFamily: 'Poppins',
                      size: 16,
                      weight: FontWeight.w400,
                      color: Colors.black,
                      textAlign: TextAlign.center),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Color AddOp(Color color) {
    Color color1 =
        Color.fromRGBO(color.red, color.green, color.blue, color.opacity + 0.6);
    return color1;
  }
}
