import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../shared/models/product.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void loadProducts() async {
    emit(HomeLoading());
    try {
      // Mocking product fetch
      await Future.delayed(const Duration(seconds: 1));
      final products = [
        const Product(
          id: '1',
          name: 'Classic Burger',
          description: 'Juicy beef patty with fresh lettuce and tomato.',
          price: 8.99,
          imageUrl: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd',
          category: 'Burgers',
        ),
        const Product(
          id: '2',
          name: 'Margherita Pizza',
          description: 'Fresh mozzarella, basil and tomato sauce.',
          price: 12.99,
          imageUrl: 'https://images.unsplash.com/photo-1604382354936-07c5d9983bd3',
          category: 'Pizza',
        ),
        const Product(
          id: '3',
          name: 'Sushi Platter',
          description: 'Assorted fresh sushi rolls.',
          price: 24.99,
          imageUrl: 'https://images.unsplash.com/photo-1579871494447-9811cf80d66c',
          category: 'Japanese',
        ),
        const Product(
          id: '4',
          name: 'Chicken Caesar Salad',
          description: 'Crispy romaine lettuce, grilled chicken and dressing.',
          price: 10.99,
          imageUrl: 'https://images.unsplash.com/photo-1550304943-4f24f54ddde9',
          category: 'Salads',
        ),
      ];
      emit(HomeLoaded(products: products));
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }
}
