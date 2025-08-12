import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/providers/cart_providers.dart';
import 'package:shop_app/utils/paymentmodalsucces.dart';

class CheckoutPage extends ConsumerWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);
    final totalPrice = cartItems.fold<double>(
      0,
      (sum, item) => sum + item.price * item.quantity,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: cartItems.isEmpty
          ? const Center(child: Text('Your cart is empty'))
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemCount: cartItems.length,
                      separatorBuilder: (_, __) => const Divider(),
                      itemBuilder: (context, index) {
                        final item = cartItems[index];
                        return ListTile(
                          leading: Image.network(
                            item.image,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            item.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text("${item.quantity} x \$ ${item.price}"),
                          trailing: Text(
                            "\$ ${(item.price * item.quantity)}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        );
                      },
                    ),
                  ),

                  const Divider(thickness: 1.2),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Payment amount :",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "\$ $totalPrice",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        showPaymentSuccessModal(context, ref);
                      },
                      child: const Text(
                        "Pay Now",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
