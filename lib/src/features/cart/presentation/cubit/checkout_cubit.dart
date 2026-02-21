import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());

  void placeOrder() async {
    emit(CheckoutLoading());
    try {
      // Simulate order placement
      await Future.delayed(const Duration(seconds: 2));
      emit(CheckoutSuccess(orderId: 'ORD-${DateTime.now().millisecondsSinceEpoch}'));
    } catch (e) {
      emit(CheckoutError(message: e.toString()));
    }
  }
}
