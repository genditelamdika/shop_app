import 'package:hive/hive.dart';

part 'cart.g.dart';

@HiveType(typeId: 0)
class CartItem extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String image;

  @HiveField(3)
  final double price;

  @HiveField(4)
  int quantity;

  CartItem({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    this.quantity = 1,
  });
    @override
  String toString() {
    return 'CartItem(id: $id, title: $title, price: $price, quantity: $quantity)';
  }
}
