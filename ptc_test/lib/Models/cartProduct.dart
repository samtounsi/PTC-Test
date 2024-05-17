import 'package:ptc_test/Models/products.dart';

class CartProduct extends Product {
  int value;

  CartProduct(
      {required String image,
      required String name,
      required String quantity,
      required double price,
      required this.value})
      : super(image: image, name: name, quantity: quantity, price: price);
      
}
