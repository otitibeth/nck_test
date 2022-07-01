import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nck_test_app/screens/delivery_details_screen.dart';
import 'package:nck_test_app/utils/colors.dart';
import 'package:nck_test_app/widgets/app_bar_widget.dart';
import 'package:nck_test_app/widgets/next_container.dart';
import 'package:nck_test_app/widgets/purchase_container.dart';
import 'package:nck_test_app/widgets/purchase_container_1.dart';

class PurchaseOrderScreen extends StatefulWidget {
  const PurchaseOrderScreen({Key? key}) : super(key: key);

  static const routeName = '/purchase-order';

  @override
  State<PurchaseOrderScreen> createState() => _PurchaseOrderScreenState();
}

class _PurchaseOrderScreenState extends State<PurchaseOrderScreen> {
  bool showContainer1 = true;
  bool showDropdown1 = false;
  bool showContainer2 = false;
  String cylinder = '';
  String weight = '';
  String number = '';
  int orderNumber = 0;

  bool showadded = false;

  void handleShowAdded() {
    setState(() {
      showadded = !showadded;
    });
  }

  Map<String, dynamic> toMap() {
    return {
      'orderNumber': orderNumber,
      'weight': weight,
      'number': number,
      'cylinderType': cylinder,
    };
  }

  // List<Widget> widgets = [];

  List orders = [];

  saveOrder() {
    // print(toMap());
    orders.add(toMap());
    print(orders);
  }

  handleSwapCylinder(value) {
    print(value);
    if (value == 'New Cylinder' || value == 'Swap Cylinder') {
      setState(() {
        cylinder = value;
      });
    }
    if (value == '00' || value == '01' || value == '02' || value == '03') {
      setState(() {
        weight = value;
      });
    }
    if (value == '00' || value == '01' || value == '02' || value == '03') {
      setState(() {
        number = value;
      });
    }
  }

  void onAddOrder() {
    setState(() {
      // widgets.add(
      //   PurchaseContaine(
      //     handleSwapCylinder: handleSwapCylinder,
      //     order: 2,
      //   ),
      // );
    });
  }

  // @override
  // void initState() {
  //   widgets = <Widget>[
  //     const SizedBox(
  //       height: 10,
  //     ),
  //     orders.map((e) =>
  //     PurchaseContaine(
  //       handleSwapCylinder: handleSwapCylinder,
  //       order: 1,
  //       orders: orders,
  //     ),).toList(),
  //     // PurchaseContaine(
  //     //   handleSwapCylinder: handleSwapCylinder,
  //     //   order: 1,
  //     //   orders: orders,
  //     // ),
  //   ];
  // }
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                ListView(
                  shrinkWrap: true,
                  // mainAxisSize: MainAxisSize.min,

                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppBarWidget(
                      title: 'Purchase Order',
                      text: 'Select your order preference',
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    orders.isNotEmpty
                        ? DropDownContainer(
                            handleShowAdded: handleShowAdded,
                            orders: orders,
                          )
                        : Container(),
                    const SizedBox(
                      height: 14,
                    ),
                    PurchaseContaine1(
                      orders: orders,
                      // index: index,
                      handleSwapCylinder: handleSwapCylinder,
                    ),
                    showadded
                        ? ConstrainedBox(
                            constraints: BoxConstraints(maxHeight: 1000),
                            child: ListView.builder(
                              controller: _scrollController,

                              // physics: ScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => PurchaseContaine(
                                index: index,
                                orders: orders,
                                handleSwapCylinder: handleSwapCylinder,
                              ),
                              itemCount: orders.length,
                            ),
                          )
                        : Container(),

                    // ...widgets,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            onAddOrder();
                            print(saveOrder());
                            setState(() {});
                          },
                          icon: const Icon(Icons.add, size: 17),
                          label: const Text('Add order'),
                        ),
                      ],
                    ),

                    // const Spacer(),
                    const SizedBox(
                      height: 30,
                    ),
                    NextContainer(
                        text: 'Continue',
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(DeliveryDetailsScreen.routeName);
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DropDownContainer extends StatelessWidget {
  const DropDownContainer(
      {Key? key, required this.handleShowAdded, required this.orders})
      : super(key: key);
  final handleShowAdded;
  final List orders;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 62,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade300,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 0,
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Order ${orders.length}',
            style: TextStyle(color: greyColor),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              handleShowAdded();
            },
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
