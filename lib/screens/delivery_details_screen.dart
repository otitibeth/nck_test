import 'package:flutter/material.dart';
import 'package:nck_test_app/screens/checkout_screen.dart';
import 'package:nck_test_app/utils/colors.dart';
import 'package:nck_test_app/widgets/app_bar_widget.dart';
import 'package:nck_test_app/widgets/next_container.dart';

class DeliveryDetailsScreen extends StatefulWidget {
  const DeliveryDetailsScreen({Key? key}) : super(key: key);

  static const routeName = '/delivery-detail';

  @override
  State<DeliveryDetailsScreen> createState() => _DeliveryDetailsScreenState();
}

class _DeliveryDetailsScreenState extends State<DeliveryDetailsScreen> {
  bool chooseAdress1 = true;
  bool chooseAdress2 = false;

  void onAdress1() {
    setState(() {
      chooseAdress1 = true;
      chooseAdress2 = false;
    });
  }

  void onAdress2() {
    setState(() {
      chooseAdress1 = false;
      chooseAdress2 = true;
    });
  }

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
                  title: 'Delivery Address',
                  text: 'Select delivery address',
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                DeliveryContainer(
                  address: '32b Oxley Street, Ilaje, Lekki Lagos',
                  icon: chooseAdress1
                      ? const Icon(
                          Icons.radio_button_on_rounded,
                          color: Colors.green,
                        )
                      : const Icon(Icons.radio_button_off_rounded,
                          color: Colors.grey),
                  onPressed: () {
                    onAdress1();
                  },
                ),
                const SizedBox(
                  height: 6,
                ),
                DeliveryContainer(
                  address: '32b Oxley Street, Ilaje, Lekki Lagos',
                  icon: chooseAdress2
                      ? const Icon(
                          Icons.radio_button_on_rounded,
                          color: Colors.green,
                        )
                      : const Icon(Icons.radio_button_off_rounded,
                          color: Colors.grey),
                  onPressed: () {
                    onAdress2();
                  },
                ),
                const SizedBox(
                  height: 14,
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add, size: 17),
                  label: const Text('Add address'),
                ),
                const Spacer(),
                NextContainer(
                  text: 'Checkout',
                  onPressed: () {
                    Navigator.of(context).pushNamed(CheckoutScreen.routeName);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DeliveryContainer extends StatelessWidget {
  const DeliveryContainer(
      {Key? key,
      required this.address,
      required this.icon,
      required this.onPressed})
      : super(key: key);
  final String address;
  final Icon icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.shade200,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15)
              .copyWith(right: 3),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address,
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                  Text(
                    'Change',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  )
                ],
              ),
              const Spacer(),
              Expanded(
                child: IconButton(
                  onPressed: onPressed,
                  icon: icon,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
