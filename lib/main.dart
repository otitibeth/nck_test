import 'package:flutter/material.dart';
import 'package:nck_test_app/models/order_model.dart';
import 'package:nck_test_app/screens/checkout_screen.dart';
import 'package:nck_test_app/screens/delivery_details_screen.dart';
import 'package:nck_test_app/screens/home_screen.dart';
import 'package:nck_test_app/screens/order_booked_screen.dart';
import 'package:nck_test_app/screens/payment_screen.dart';
import 'package:nck_test_app/screens/purchase_order_screen.dart';
import 'package:nck_test_app/screens/topup_screen.dart';
import 'package:nck_test_app/utils/colors.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return ChangeNotifierProvider(
      create: (context) => Orders(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: primaryColor,
        ),
        home: const HomeScreen(),
        routes: {
          HomeScreen.routeName: (ctx) => const HomeScreen(),
          PaymentScreen.routeName: (ctx) => const PaymentScreen(),
          OrderBookedScreen.routeName: (ctx) => const OrderBookedScreen(),
          DeliveryDetailsScreen.routeName: (ctx) =>
              const DeliveryDetailsScreen(),
          TopupScreen.routeName: (ctx) => const TopupScreen(),
          PurchaseOrderScreen.routeName: (ctx) => const PurchaseOrderScreen(),
          CheckoutScreen.routeName: (ctx) => const CheckoutScreen(),
        },
      ),
    );
  }
}
