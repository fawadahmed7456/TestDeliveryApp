import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/order_cubit.dart';

class OrderTrackingScreen extends StatefulWidget {
  final String orderId;

  const OrderTrackingScreen({super.key, required this.orderId});

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  @override
  void initState() {
    super.initState();
    context.read<OrderCubit>().trackOrder(widget.orderId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Track Order', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          String status = 'Processing';
          double progress = 0.1;

          if (state is OrderTrackingUpdate) {
            status = state.status;
            progress = state.progress;
          }

          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  'Order ID: ${widget.orderId}',
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 10),
                Text(
                  status,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                ),
                const SizedBox(height: 40),
                LinearProgressIndicator(
                  value: progress,
                  minHeight: 10,
                  borderRadius: BorderRadius.circular(10),
                ),
                const SizedBox(height: 40),
                Expanded(
                  child: ListView(
                    children: [
                      _buildStatusStep('Order Confirmed', progress >= 0.2),
                      _buildStatusStep('Preparing Food', progress >= 0.4),
                      _buildStatusStep('On the way', progress >= 0.7),
                      _buildStatusStep('Delivered', progress >= 1.0),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatusStep(String title, bool isCompleted) {
    return ListTile(
      leading: Icon(
        isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
        color: isCompleted ? Colors.green : Colors.grey,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: isCompleted ? FontWeight.bold : FontWeight.normal,
          color: isCompleted ? Colors.black : Colors.grey,
        ),
      ),
    );
  }
}
