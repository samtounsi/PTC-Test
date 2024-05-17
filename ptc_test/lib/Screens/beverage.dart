import 'package:flutter/material.dart';
import 'package:ptc_test/Components/basics.dart';
import 'package:ptc_test/Models/products.dart';

// ignore: must_be_immutable
class Beverages extends StatelessWidget {
  String category;
  Beverages({super.key, required this.category});

  List<Product> products = [
    Product(
        image: 'assets/images/cola1.png',
        name: 'Diet Coke',
        quantity: '355ml',
        price: 1.99),
    Product(
        image: 'assets/images/cola2.png',
        name: 'Sprite Can',
        quantity: '325ml',
        price: 1.50),
    Product(
        image: 'assets/images/cola3.png',
        name: 'Apple & Grape Juice',
        quantity: '2L',
        price: 5.99),
    Product(
        image: 'assets/images/cola4.png',
        name: 'Orange Juice',
        quantity: '2L',
        price: 8.99),
    Product(
        image: 'assets/images/cola5.png',
        name: 'Coca Cola Can',
        quantity: '325ml',
        price: 4.99),
    Product(
        image: 'assets/images/cola6.png',
        name: 'Pepsi Can',
        quantity: '330ml',
        price: 4.99),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text(category),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: baseIconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 700,
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text('Add', size: 24),
                            Divider(),
                            textField(label: 'Name'),
                            textField(label: 'Description'),
                            textField(label: 'Price'),
                            textField(label: 'Image'),
                            SizedBox(height: 20),
                            baseButton(
                              onPressed: () {},
                              title: 'Add Item',
                              width: MediaQuery.of(context).size.width - 20,
                            ),
                          ],
                        ),
                      );
                    });
              },
              icon: Icons.add,
              size: 20,
            ),
          ),
        ],
      ),
      body: GridView.builder(
          padding: EdgeInsets.all(10),
          physics: BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) => productElement(products[index])),
    );
  }

  Widget productElement(Product p) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color.fromRGBO(226, 226, 226, 1))),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Center(
                child: Image.asset(
                  p.image,
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 7),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: SizedBox(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text(p.name, color: Colors.black),
                        text("${p.quantity},\nPrice",
                            size: 14, color: Color.fromRGBO(124, 124, 124, 1)),
                        SizedBox(height: 2),
                        text('\$${p.price.toStringAsFixed(2)}',
                            color: Colors.black, size: 19),
                      ]),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 183, left: 133),
            child: baseIconButton(onPressed: () {}, icon: Icons.add),
          ),
        ],
      ),
    );
  }
}
