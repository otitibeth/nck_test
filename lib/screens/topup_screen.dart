import 'package:flutter/material.dart';
import 'package:nck_test_app/utils/colors.dart';
import 'package:nck_test_app/widgets/app_bar_widget.dart';
import 'package:nck_test_app/widgets/topup_container.dart';

class TopupScreen extends StatelessWidget {
  const TopupScreen({Key? key}) : super(key: key);

  static const routeName = '/topup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBarWidget(
                    title: 'Top up',
                    text: 'Select retailer you wish to purchase from',
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TopupContainer(
                    asset: 'assets/oando.jpg',
                    text: 'Oando Petrol Station',
                    color: Colors.grey.shade800,
                  ),
                  TopupContainer(
                    asset: 'assets/total.jpg',
                    text: 'Total Retail',
                    color: Theme.of(context).primaryColor,
                  ),
                  TopupContainer(
                    asset: 'assets/enyo.png',
                    text: 'Enyo Retail',
                    color: Colors.grey.shade800,
                  ),
                  TopupContainer(
                    asset: 'assets/ap.jpg',
                    text: 'Ap Gas Station',
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
