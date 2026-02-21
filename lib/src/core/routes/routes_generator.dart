import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../src.dart';

class RoutesGenerator {
  const RoutesGenerator._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.kInitial:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );
      case Routes.kLogin:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: di<AuthCubit>(),
            child: const LoginScreen(),
          ),
          settings: settings,
        );
      case Routes.kHome:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => di<HomeCubit>()),
              BlocProvider.value(value: di<CartCubit>()),
              BlocProvider.value(value: di<AuthCubit>()),
            ],
            child: const HomeScreen(),
          ),
          settings: settings,
        );
      case Routes.kCart:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: di<CartCubit>(),
            child: const CartScreen(),
          ),
          settings: settings,
        );
      case Routes.kCheckout:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => di<CheckoutCubit>()),
              BlocProvider.value(value: di<CartCubit>()),
            ],
            child: const CheckoutScreen(),
          ),
          settings: settings,
        );
      case Routes.kOrderTracking:
        final orderId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => di<OrderCubit>(),
            child: OrderTrackingScreen(orderId: orderId),
          ),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Route not found')),
          ),
          settings: settings,
        );
    }
  }
}
