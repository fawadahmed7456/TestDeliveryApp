import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/checkout_cubit.dart';
import '../cubit/cart_cubit.dart';
import '../../../../core/core.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: BlocConsumer<CheckoutCubit, CheckoutState>(
        listener: (context, state) {
          if (state is CheckoutSuccess) {
            context.read<CartCubit>().clearCart();
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.kOrderTracking,
              (route) => route.settings.name == Routes.kHome,
              arguments: state.orderId,
            );
          } else if (state is CheckoutError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Shipping Address',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: const ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text('123 Delivery St, Food City'),
                    subtitle: Text('Contact: +1 234 567 890'),
                    trailing: Icon(Icons.edit),
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Payment Method',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: const ListTile(
                    leading: Icon(Icons.credit_card),
                    title: Text('Visa ending in 1234'),
                    trailing: Icon(Icons.check_circle, color: Colors.green),
                  ),
                ),
                const Spacer(),
                if (state is CheckoutLoading)
                  const Center(child: CircularProgressIndicator())
                else
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                    onPressed: () => context.read<CheckoutCubit>().placeOrder(),
                    child: const Text('Confirm Order', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
