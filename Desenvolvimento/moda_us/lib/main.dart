import 'package:flutter/material.dart';
import 'package:moda_us/models/user_manager.dart';
import 'package:moda_us/screens/base/base_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => UserManager(),
      child: MaterialApp(
        title: 'Moda Us',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 4, 125, 141),
          scaffoldBackgroundColor: const Color.fromARGB(255, 4, 125, 141),
          appBarTheme: const AppBarTheme(
            elevation: 0
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BaseScreen(),
      ),
    );
  }
}