import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/pages/cart/main/cart_page.dart';
import 'package:shamo/pages/cart/main/checkout_page.dart';
import 'package:shamo/pages/cart/main/checkout_succsess_page.dart';
import 'package:shamo/pages/profiles/main/edit_profile_page.dart';
import 'package:shamo/pages/main_page.dart';
import 'package:shamo/pages/sign_in_pages.dart';
import 'package:shamo/pages/sign_up_page.dart';
import 'package:shamo/pages/splash_page.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/providers/cart_provider.dart';
import 'package:shamo/providers/page_provider.dart';
import 'package:shamo/providers/products_provider.dart';
import 'package:shamo/providers/transaction_provider.dart';
import 'package:shamo/providers/wishlist_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => WishlistProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => TransactionProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => PageProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => const MainPage(),
          '/edit-profile': (context) => const EditProfilePage(),
          '/cart-page': (context) => const CartPage(),
          '/checkout': (context) => const CheckoutPage(),
          '/checkout-success': (context) => const CheckoutSuccesss(),
        },
      ),
    );
  }
}
