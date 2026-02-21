import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test_delivery_app/firebase_options.dart';
import 'package:test_delivery_app/src/src.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase (wrapped in try-catch in case options are not fully set up)
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) { 
    debugPrint('Firebase initialization failed: $e');
  }

  // Inject dependencies
  await injectDependencies();
  
  // Custom HTTP overrides for development
  HttpOverrides.global = MyHttpOverrides();

  runApp(const DeliveryApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
