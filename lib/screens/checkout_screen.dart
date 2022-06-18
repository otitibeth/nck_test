import 'package:flutter/material.dart';
import 'package:nck_test_app/screens/delivery_details_screen.dart';
import 'package:nck_test_app/screens/payment_screen.dart';
import 'package:nck_test_app/widgets/app_bar_widget.dart';
import 'package:nck_test_app/widgets/checkout_container.dart';
import 'package:nck_test_app/widgets/next_container.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  static const routeName = '/checkout';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBarWidget(
                  title: 'Checkout',
                  text: 'Order summary',
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                const SizedBox(
                  height: 7,
                ),
                const CheckoutContainer(
                  order: 1,
                  amount: '1,200',
                  cylinder: 'Swap Cylinder',
                  size: 3.2,
                  qty: 1,
                ),
                const CheckoutContainer(
                  order: 2,
                  amount: '6,200',
                  cylinder: 'New Cylinder',
                  size: 6.5,
                  qty: 4,
                ),
                const SizedBox(
                  height: 16,
                ),
                const Divider(
                  thickness: 0.8,
                ),
                const SizedBox(
                  height: 2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ).copyWith(left: 25),
                  child: Row(
                    children: const [
                      Text(
                        'Total',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Spacer(),
                      Text(
                        'NGN 7,400',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, top: 20),
                  child: Text(
                    'Delivery address',
                    style: TextStyle(color: Colors.grey.shade700, fontSize: 15),
                  ),
                ),
                const CheckoutDeliveryContainer(
                    address: '32b Oxley Street, Ilaje, Lekki Lagos'),
                const Spacer(),
                NextContainer(
                    text: 'Payment',
                    onPressed: () {
                      Navigator.of(context).pushNamed(PaymentScreen.routeName);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
