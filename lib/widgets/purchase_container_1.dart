import 'package:flutter/material.dart';
import 'package:nck_test_app/models/order_model.dart';
import 'package:nck_test_app/utils/colors.dart';
import 'package:nck_test_app/widgets/dropdown_widget.dart';
import 'package:provider/provider.dart';

class PurchaseContaine1 extends StatefulWidget {
  const PurchaseContaine1({
    Key? key,
    required this.handleSwapCylinder,
    // required this.index,
    required this.orders,
  }) : super(key: key);
  final List orders;
  // final int index;
  final handleSwapCylinder;
  // final orders;

  @override
  State<PurchaseContaine1> createState() => _PurchaseContaine1State();
}

class _PurchaseContaine1State extends State<PurchaseContaine1> {
  final GlobalKey<FormState> _form = GlobalKey();
  String dropdownValue = '00';
  bool choice1 = false;
  bool choice2 = false;
  var initValues = {
    'cylinderType': '',
    'orderNumber': 0,
    'cylinderWeight': '',
    'number': '',
  };
  var num = 0;

  // int orderNumber() {
  //   for (int i = num; i < 5; i++) {
  //     print(num);
  //   }
  //   return num;
  // }

  void onChoose1() {
    setState(() {
      choice1 = !choice1;
      choice2 = false;

      // initValues = {
      //   'cylinderType': 'Swap Cylinder',
      //   'orderNumber': num++,
      //   'cylinderWeight': '',
      //   'number': '',
      // };
    });
  }

  void onChoose2() {
    setState(() {
      choice1 = false;
      choice2 = !choice2;
    });
  }

  void saveOrder() {
    // Provider.of<Orders>(context, listen: false).addOrder(order);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade300,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 0,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'order ${widget.orders.length + 1}',
                style: TextStyle(color: greyColor),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.keyboard_arrow_up,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          orderContainer(
            asset: 'assets/cylinder1.png',
            icon: choice1
                ? const Icon(Icons.radio_button_on, color: Colors.white)
                : const Icon(Icons.radio_button_off, color: Colors.grey),
            onPressed: () {
              onChoose1();
              widget.handleSwapCylinder('Swap Cylinder');
            },
            text: Text(
              'Swap Cylinder',
              style: choice1
                  ? const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    )
                  : const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
            ),
            containerColor: choice1 ? Colors.green : Colors.white,
          ),
          orderContainer(
            asset: 'assets/cylinder2.png',
            icon: choice2
                ? const Icon(Icons.radio_button_on, color: Colors.white)
                : const Icon(Icons.radio_button_off, color: Colors.grey),
            onPressed: () {
              onChoose2();
              widget.handleSwapCylinder('New Cylinder');
            },
            text: Text(
              'New Cylinder',
              style: choice2
                  ? const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    )
                  : const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
            ),
            containerColor: choice2 ? Colors.green : Colors.white,
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 7),
            child: Row(
              children: [
                DropdownWidget(
                    text: 'Cylinder Weight',
                    handleSwapCylinder: widget.handleSwapCylinder),
                const Spacer(),
                DropdownWidget(
                    text: 'Number',
                    handleSwapCylinder: widget.handleSwapCylinder),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class orderContainer extends StatelessWidget {
  const orderContainer({
    Key? key,
    required this.asset,
    required this.icon,
    required this.onPressed,
    required this.text,
    required this.containerColor,
  }) : super(key: key);
  final String asset;
  final Text text;
  final Icon icon;
  final VoidCallback onPressed;
  final Color containerColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7, bottom: 5),
      child: Container(
        width: double.infinity,
        height: 62,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: containerColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15)
              .copyWith(right: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  color: Colors.green,
                ),
                child: Image.asset(
                  asset,
                  height: 30,
                  width: 30,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 30),
              text,
              const Spacer(),
              IconButton(
                onPressed: onPressed,
                icon: icon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
