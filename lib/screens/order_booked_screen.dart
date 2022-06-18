import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nck_test_app/screens/home_screen.dart';
import 'package:nck_test_app/utils/colors.dart';
import 'package:nck_test_app/widgets/next_container.dart';

class OrderBookedScreen extends StatelessWidget {
  const OrderBookedScreen({Key? key}) : super(key: key);

  static const routeName = '/order-booked';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    const Icon(
                      Icons.circle_outlined,
                      color: whiteColor,
                      size: 78,
                    ),
                    const Icon(
                      Icons.done,
                      color: whiteColor,
                      size: 40,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Order booked',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                const Text(
                  'succesfully',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                NextContainer(
                  text: 'Home',
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        HomeScreen.routeName, (route) => false);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
