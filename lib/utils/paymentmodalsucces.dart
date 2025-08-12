import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/providers/cart_providers.dart';

class PaymentSuccessModal extends StatelessWidget {
  final VoidCallback onOk;

  const PaymentSuccessModal({super.key, required this.onOk});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.5), 
        body: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 15,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.check_circle_outline,
                  color: Colors.green.shade600,
                  size: 80,
                ),
                const SizedBox(height: 16),
                const Text(
                  "Succes!",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Your order will be processed immediately..",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onOk,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade600,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "OK",
                      style: TextStyle(fontSize: 18,color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void showPaymentSuccessModal(BuildContext context, WidgetRef ref) {
  showDialog(
    context: context,
    barrierDismissible: false, 
    builder: (context) => PaymentSuccessModal(
      onOk: () {
        ref.read(cartProvider.notifier).clearCart();
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      },
    ),
  );
}

