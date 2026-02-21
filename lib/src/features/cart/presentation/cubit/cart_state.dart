part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  final List<CartItem> items;

  const CartState({this.items = const []});

  double get subtotal => items.fold(0, (sum, item) => sum + item.totalPrice);
  double get deliveryFee => items.isEmpty ? 0 : 5.00;
  double get total => subtotal + deliveryFee;

  @override
  List<Object?> get props => [items];
}

class CartInitial extends CartState {
  const CartInitial();
}

class CartLoaded extends CartState {
  const CartLoaded({required super.items});
}
