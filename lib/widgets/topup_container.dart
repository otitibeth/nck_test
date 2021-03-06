import 'package:flutter/material.dart';
import 'package:nck_test_app/screens/purchase_order_screen.dart';
import 'package:nck_test_app/utils/colors.dart';

class TopupContainer extends StatelessWidget {
  const TopupContainer({
    Key? key,
    required this.asset,
    required this.text,
    required this.color,
  }) : super(key: key);
  final String asset;
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(PurchaseOrderScreen.routeName);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 7),
        child: Container(
          width: double.infinity,
          height: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: w * 0.05,
              // vertical: 15
            ).copyWith(right: w * 0.02),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.yellow),
                  child: Image.asset(
                    asset,
                    height: 37,
                    width: 37,
                    fit: BoxFit.cover,
                  ),
                ),
                // Spacer(),
                SizedBox(width: h * 0.045),
                Text(
                  text,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: whiteColor,
                      fontSize: 17),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
