import 'package:flutter/material.dart';
import 'package:moda_us/models/admin_users_manager.dart';
import 'package:moda_us/models/cart_manager.dart';
import 'package:moda_us/models/home_manager.dart';
import 'package:moda_us/models/product.dart';
import 'package:moda_us/models/product_manager.dart';
import 'package:moda_us/models/user_manager.dart';
import 'package:moda_us/screens/base/base_screen.dart';
import 'package:moda_us/screens/cart/cart_screen.dart';
import 'package:moda_us/screens/edit_product/edit_product_screen.dart';
import 'package:moda_us/screens/login/login_screen.dart';
import 'package:moda_us/screens/product/product_screen.dart';
import 'package:moda_us/screens/signup/signup_screen.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => ProductManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => HomeManager(),
          lazy: false
        ),
        ChangeNotifierProxyProvider<UserManager, CartManager>(
          create: (_) => CartManager(),
          lazy: false,
          update: (_, userManager, cartManager) =>
            cartManager..updateUser(userManager),
        ),
        ChangeNotifierProxyProvider<UserManager, AdminUsersManager>(
          create: (_) => AdminUsersManager(),
          lazy: false,
          update: (_, userManager, adminUsersManager) =>
            adminUsersManager..updateUser(userManager),
        ),
      ],
      child: MaterialApp(
        title: 'Moda Us',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 12, 12, 12),
          scaffoldBackgroundColor: const Color.fromARGB(255, 12, 12, 12),
          appBarTheme: const AppBarTheme(
            elevation: 0
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/base',
        onGenerateRoute: (settings){
          switch(settings.name){
            case '/login':
              return MaterialPageRoute(
                  builder: (_) => LoginScreen()
              );
            case '/signup':
              return MaterialPageRoute(
                  builder: (_) => SignUpScreen()
              );
            case '/product':
              return MaterialPageRoute(
                  builder: (_) => ProductScreen(
                    settings.arguments as Product
                  )
              );
            case '/cart':
              return MaterialPageRoute(
                  builder: (_) => CartScreen()
              );
              case '/edit_product':
              return MaterialPageRoute(
                  builder: (_) => EditProductScreen(
                    settings.arguments as Product
                  )
              );  
            case '/base':
            default:
              return MaterialPageRoute(
                  builder: (_) => BaseScreen()
              );
          }
        },
      ),
    );
  }
}