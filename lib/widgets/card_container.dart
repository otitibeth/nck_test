import 'package:flutter/material.dart';

class CardContainer extends StatefulWidget {
  const CardContainer({Key? key}) : super(key: key);

  @override
  State<CardContainer> createState() => _CardContainerState();
}

class _CardContainerState extends State<CardContainer> {
  bool choose1 = true;
  bool choose2 = false;

  void onClickCard1() {
    setState(() {
      choose1 = true;
      choose2 = false;
    });
  }

  void onClickCard2() {
    setState(() {
      choose1 = false;
      choose2 = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select card',
            style: TextStyle(color: Colors.grey.shade700, fontSize: 15),
          ),
          Cards(
            asset: 'assets/mastercard.jpg',
            onPressed: () {
              onClickCard1();
            },
            icon: choose1
                ? const Icon(
                    Icons.radio_button_on,
                    color: Colors.green,
                  )
                : const Icon(
                    Icons.radio_button_off,
                    color: Colors.grey,
                  ),
          ),
          Cards(
            asset: 'assets/visa.png',
            onPressed: () {
              onClickCard2();
            },
            icon: choose2
                ? const Icon(
                    Icons.radio_button_on,
                    color: Colors.green,
                  )
                : const Icon(
                    Icons.radio_button_off,
                    color: Colors.grey,
                  ),
          ),
          const SizedBox(
            height: 4,
          ),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add, size: 17),
            label: const Text('Add new card'),
          ),
        ],
      ),
    );
  }
}

class Cards extends StatelessWidget {
  const Cards(
      {Key? key,
      required this.asset,
      required this.icon,
      required this.onPressed})
      : super(key: key);
  final String asset;
  final VoidCallback onPressed;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7),
      child: Container(
        width: double.infinity,
        height: 62,
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
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Image.asset(
                  asset,
                  height: 30,
                  width: 30,
                  fit: BoxFit.cover,
                ),
              ),
              const Spacer(),
              const Text('**** **** 5163',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(width: 30),
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
