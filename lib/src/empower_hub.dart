import 'package:flutter/material.dart';
import 'src.dart';

class EmpowerHub extends StatelessWidget {
  const EmpowerHub({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        title: 'QuickDelivery',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          primaryColor: Colors.deepOrange,
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.grey[50],
          appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            centerTitle: true,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange,
              foregroundColor: Colors.white,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.kInitial,
        onGenerateRoute: RoutesGenerator.onGenerateRoute,
      ),
    );
  }
}
