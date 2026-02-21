import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());

  void trackOrder(String orderId) async {
    emit(const OrderTrackingUpdate(status: 'Confirmed', progress: 0.2));
    await Future.delayed(const Duration(seconds: 3));
    emit(const OrderTrackingUpdate(status: 'Preparing', progress: 0.4));
    await Future.delayed(const Duration(seconds: 3));
    emit(const OrderTrackingUpdate(status: 'On the way', progress: 0.7));
    await Future.delayed(const Duration(seconds: 3));
    emit(const OrderTrackingUpdate(status: 'Delivered', progress: 1.0));
  }
}
