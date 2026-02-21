import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:local_auth/local_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'src.dart';

final di = GetIt.instance;

Future<void> injectDependencies() async {
  // External
  di.registerLazySingleton(() => FirebaseAuth.instance);
  di.registerLazySingleton(() => GoogleSignIn(
    // serverClientId: '52400763251-vher3s21940d6tu1soupkllhcr3kucfs.apps.googleusercontent.com',
  ));
  di.registerLazySingleton(() => Dio());
  di.registerLazySingleton(() => Connectivity());
  di.registerLazySingleton(() => LocalAuthentication());
  di.registerLazySingleton(() => ImagePicker());

  // Data sources
  di.registerLazySingleton<HiveDb>(() => HiveDb());
  
  // Repositories
  di.registerLazySingleton<IAuthRepository>(
    () => AuthRepository(firebaseAuth: di(), googleSignIn: di()),
  );

  // Cubits - Using LazySingleton for Cart to persist data across screens
  di.registerLazySingleton(() => AuthCubit(authRepository: di()));
  di.registerFactory(() => HomeCubit());
  di.registerLazySingleton(() => CartCubit());
  di.registerFactory(() => CheckoutCubit());
  di.registerFactory(() => OrderCubit());
}
