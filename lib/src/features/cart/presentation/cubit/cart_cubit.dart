import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../shared/models/product.dart';
import '../../../../shared/models/cart_item.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartInitial());

  void addToCart(Product product) {
    final List<CartItem> updatedItems = List.from(state.items);
    final int existingIndex = updatedItems.indexWhere((item) => item.product.id == product.id);

    if (existingIndex != -1) {
      updatedItems[existingIndex] = updatedItems[existingIndex].copyWith(
        quantity: updatedItems[existingIndex].quantity + 1,
      );
    } else {
      updatedItems.add(CartItem(product: product));
    }

    emit(CartLoaded(items: updatedItems));
  }

  void removeFromCart(String productId) {
    final List<CartItem> updatedItems = List.from(state.items);
    updatedItems.removeWhere((item) => item.product.id == productId);
    emit(CartLoaded(items: updatedItems));
  }

  void updateQuantity(String productId, int delta) {
    final List<CartItem> updatedItems = List.from(state.items);
    final int index = updatedItems.indexWhere((item) => item.product.id == productId);

    if (index != -1) {
      final int newQuantity = updatedItems[index].quantity + delta;
      if (newQuantity > 0) {
        updatedItems[index] = updatedItems[index].copyWith(quantity: newQuantity);
        emit(CartLoaded(items: updatedItems));
      } else {
        removeFromCart(productId);
      }
    }
  }

  void clearCart() {
    emit(const CartLoaded(items: []));
  }
}
