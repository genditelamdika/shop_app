import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/model/cart.dart';
import 'package:hive/hive.dart';

final cartBoxProvider = Provider<Box<CartItem>>((ref) {
  throw UnimplementedError();
});

class CartNotifier extends StateNotifier<List<CartItem>> {
  final Box<CartItem> box;

  CartNotifier(this.box) : super(box.values.toList());

  void addToCart(CartItem item) {
    final index = state.indexWhere((element) => element.id == item.id);
    if (index >= 0) {
      final existingItem = state[index];
      existingItem.quantity += item.quantity;
      existingItem.save();
      state = [...state];
    } else {
      box.add(item);
      state = box.values.toList();
    }
  }

  void removeFromCart(int id) {
    final key = box.keys.firstWhere(
      (key) => box.get(key)!.id == id,
      orElse: () => null,
    );
   

    if (key != null) {
      box.delete(key);
      state = box.values.toList();
    }
  }

  void updateQuantity(int id, int quantity) {
    final item = box.values.firstWhere((item) => item.id == id);
    item.quantity = quantity;
    item.save();
    state = box.values.toList();
  }
  void clearCart() async {
    await box.clear();  
    state = [];         
  }

  double get totalPrice =>
      state.fold(0, (sum, item) => sum + item.price * item.quantity);
      
}

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) {
  final box = ref.watch(cartBoxProvider);
  return CartNotifier(box);
});
