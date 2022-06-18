import 'package:flutter/material.dart';

class CheckoutContainer extends StatelessWidget {
  const CheckoutContainer({
    Key? key,
    required this.order,
    required this.amount,
    required this.cylinder,
    required this.size,
    required this.qty,
  }) : super(key: key);
  final int order;
  final String amount;
  final String cylinder;
  final num size;
  final int qty;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.shade200,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15)
              .copyWith(right: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order $order',
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        // color: whiteColor,
                        fontSize: 17),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    cylinder,
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                  const SizedBox(width: 15),
                  Row(
                    children: [
                      Text(
                        '${size}Kg',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.circle,
                        color: Colors.grey.shade600,
                        size: 7,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '$qty Qty',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Text(
                'NGN $amount',
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CheckoutDeliveryContainer extends StatelessWidget {
  const CheckoutDeliveryContainer({
    Key? key,
    required this.address,
  }) : super(key: key);
  final String address;

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
              // const Spacer(),
              // Expanded(
              //   child: IconButton(
              //     onPressed: onPressed,
              //     icon: icon,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
