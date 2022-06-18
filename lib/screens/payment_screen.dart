import 'package:flutter/material.dart';
import 'package:nck_test_app/screens/order_booked_screen.dart';
import 'package:nck_test_app/widgets/app_bar_widget.dart';
import 'package:nck_test_app/widgets/card_container.dart';
import 'package:nck_test_app/widgets/next_container.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  static const routeName = '/payment';

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool selected = true;
  bool onSelected = false;

  void onClickWallet() {
    setState(() {
      selected = true;
      onSelected = false;
    });
  }

  void onClickCard() {
    setState(() {
      selected = false;
      onSelected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppBarWidget(
                title: 'Payment',
                text: 'Select payment method',
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 9),
                child: Container(
                  width: double.infinity,
                  height: 62,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.shade200,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 15)
                            .copyWith(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.money_rounded,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(width: 30),
                        Text('Wallet',
                            style: TextStyle(color: Colors.grey.shade700)),

                        const Spacer(),
                        const Text('NGN 22,000',
                            style: TextStyle(fontWeight: FontWeight.w600)),
                        // const SizedBox(width: 30),
                        IconButton(
                          onPressed: () {
                            onClickWallet();
                          },
                          icon: onSelected
                              ? const Icon(
                                  Icons.radio_button_off,
                                  color: Colors.grey,
                                )
                              : const Icon(
                                  Icons.radio_button_on,
                                  color: Colors.green,
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 9),
                child: Container(
                  width: double.infinity,
                  height: 62,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.shade200,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 15)
                            .copyWith(right: 11),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.credit_card_outlined,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(width: 30),
                        Text('Card',
                            style: TextStyle(color: Colors.grey.shade700)),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            onClickCard();
                          },
                          icon: selected
                              ? const Icon(
                                  Icons.radio_button_off,
                                  color: Colors.grey,
                                )
                              : const Icon(
                                  Icons.radio_button_on,
                                  color: Colors.green,
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 17),
              const Divider(
                color: Colors.grey,
              ),
              onSelected ? const CardContainer() : Container(),
              const Spacer(),
              NextContainer(
                text: 'Pay',
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      OrderBookedScreen.routeName, (route) => false);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
