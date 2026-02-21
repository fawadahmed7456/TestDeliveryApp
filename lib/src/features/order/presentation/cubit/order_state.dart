part of 'order_cubit.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object?> get props => [];
}

class OrderInitial extends OrderState {}

class OrderTrackingUpdate extends OrderState {
  final String status;
  final double progress;

  const OrderTrackingUpdate({required this.status, required this.progress});

  @override
  List<Object?> get props => [status, progress];
}
