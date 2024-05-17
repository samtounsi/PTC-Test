import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ptc_test/Components/basics.dart';
import 'package:ptc_test/Models/cartProduct.dart';
import 'package:ptc_test/Style/colors.dart';

import 'done.dart';

class MyCart extends StatefulWidget {
  MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  double totalPrice = 0;

  List<CartProduct> myCart = [
    CartProduct(
      image: 'assets/images/myCart1.png',
      name: 'Bell Pepper Red',
      quantity: '1kg',
      price: 4.99,
      value: 1,
    ),
    CartProduct(
      image: 'assets/images/myCart2.png',
      name: 'Egg Chicken Red',
      quantity: '4pcs',
      price: 1.99,
      value: 1,
    ),
    CartProduct(
      image: 'assets/images/myCart3.png',
      name: 'Organic Bananas',
      quantity: '12kg',
      price: 3.00,
      value: 1,
    ),
    CartProduct(
      image: 'assets/images/myCart4.png',
      name: 'Bell Pepper Red',
      quantity: '250g',
      price: 2.99,
      value: 1,
    ),
    CartProduct(
      image: 'assets/images/myCart2.png',
      name: 'Egg Chicken Red',
      quantity: '4pcs',
      price: 1.99,
      value: 1,
    ),
    CartProduct(
      image: 'assets/images/myCart3.png',
      name: 'Organic Bananas',
      quantity: '12kg',
      price: 3.00,
      value: 1,
    ),
    CartProduct(
      image: 'assets/images/myCart4.png',
      name: 'Bell Pepper Red',
      quantity: '250g',
      price: 2.99,
      value: 1,
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    totalPrice = calculateTotalPrice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          ListView.separated(
            padding: EdgeInsets.all(10),
            physics: BouncingScrollPhysics(),
            itemCount: myCart.length,
            itemBuilder: (context, index) => cartItem(myCart[index]),
            separatorBuilder: (context, index) => Divider(
              color: Color.fromRGBO(226, 226, 226, 1),
              indent: 20,
              endIndent: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: baseButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              text('Checkout', size: 24),
                              Divider(
                                  color: Color.fromRGBO(124, 124, 124, 0.3)),
                              checkout('Delivery', text('Select Method')),
                              Divider(
                                  color: Color.fromRGBO(124, 124, 124, 0.3)),
                              checkout(
                                  'Payment',
                                  SvgPicture.asset(
                                    'assets/images/visa.svg',
                                    height: 10,
                                    width: 15,
                                    fit: BoxFit.contain,
                                  )),
                              Divider(
                                  color: Color.fromRGBO(124, 124, 124, 0.3)),
                              checkout('Promo Code', text('Pick Discount')),
                              Divider(
                                  color: Color.fromRGBO(124, 124, 124, 0.3)),
                              checkout('Total Cost',
                                  text('\$${totalPrice.toStringAsFixed(2)}')),
                              Divider(
                                  color: Color.fromRGBO(124, 124, 124, 0.3)),
                              text('By placing an order you agree to our',
                                  size: 12, color: gray),
                              text('Terms And Conditions.', size: 12),
                              SizedBox(height: 5),
                              baseButton(
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Done()),
                                      (route) => false);
                                },
                                title: 'Place Order',
                                width: MediaQuery.of(context).size.width - 20,
                                height: 50,
                              ),
                            ],
                          ),
                        );
                      });
                },
                title: 'Go to Checkout',
                height: 67,
                width: 364),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0, left: 290),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(72, 158, 103, 1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: text('\$${totalPrice.toStringAsFixed(2)}',
                    fontFamily: 'Gilroy',
                    size: 13,
                    weight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget cartItem(CartProduct cp) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        children: [
          Image.asset(
            cp.image,
            height: 100,
            width: 100,
            fit: BoxFit.contain,
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text(cp.name, fontFamily: 'Gilroy', weight: FontWeight.bold),
              text('${cp.quantity}, Price',
                  fontFamily: 'Gilroy',
                  weight: FontWeight.w500,
                  size: 14,
                  color: Color.fromRGBO(124, 124, 124, 1)),
              SizedBox(height: 10),
              Row(
                children: [
                  baseIconButton(
                    onPressed: () {
                      setState(() {
                        if (cp.value != 0) cp.value--;
                        totalPrice = calculateTotalPrice();
                      });
                    },
                    icon: Icons.remove,
                    boxColor: Colors.transparent,
                    iconColor: Color.fromRGBO(179, 179, 179, 1),
                    side: BorderSide(color: Color.fromRGBO(179, 179, 179, 1)),
                  ),
                  SizedBox(width: 10),
                  text('${cp.value}',
                      fontFamily: 'Gilroy', weight: FontWeight.w600),
                  SizedBox(width: 10),
                  baseIconButton(
                    onPressed: () {
                      setState(() {
                        cp.value++;
                        totalPrice = calculateTotalPrice();
                      });
                    },
                    icon: Icons.add,
                    boxColor: Colors.transparent,
                    iconColor: green,
                    side: BorderSide(color: Color.fromRGBO(179, 179, 179, 1)),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              baseIconButton(
                onPressed: () {
                  setState(() {
                    myCart.remove(cp);
                  });
                },
                icon: Icons.close,
                boxColor: Colors.transparent,
                iconColor: Color.fromRGBO(179, 179, 179, 1),
              ),
              SizedBox(height: 50),
              text('\$${(cp.price * cp.value).toStringAsFixed(2)}',
                  fontFamily: 'Gilroy', size: 18, weight: FontWeight.w600),
            ],
          )
        ],
      ),
    );
  }

  Widget checkout(String s1, Widget s2) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 37,
        child: Row(
          children: [
            text(s1, size: 18, color: gray),
            Spacer(),
            s2,
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }

  double calculateTotalPrice() {
    double total = 0;
    for (var cp in myCart) {
      total += cp.price * cp.value;
    }
    return total;
  }
}
