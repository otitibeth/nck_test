import 'package:flutter/material.dart';
import 'package:nck_test_app/utils/colors.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget(
      {Key? key,
      required this.title,
      required this.text,
      required this.onPressed})
      : super(key: key);
  final String title;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: onPressed,
                child: Container(
                  alignment: Alignment.center,
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black,
                      )),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 16,
                  ),
                ),
              ),
              const SizedBox(
                width: 23,
              ),
              Text(
                title,
                style: const TextStyle(
                    color: blackColor,
                    fontSize: 21,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5),
              ),
              const SizedBox(
                height: 28,
              ),
            ],
          ),
          const SizedBox(
            height: 28,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 3),
            child: Text(
              text,
              style: TextStyle(color: Colors.grey.shade700, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
