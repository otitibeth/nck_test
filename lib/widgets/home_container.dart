import 'package:flutter/material.dart';
import 'package:nck_test_app/screens/topup_screen.dart';
import 'package:nck_test_app/utils/colors.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.3,
            color: Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 44),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 46,
                    height: 46,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: whiteColor,
                    ),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage('assets/person.jpg'),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 11, left: 8),
                    child: Text(
                      'Paul N.',
                      style: TextStyle(
                          color: whiteColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    alignment: Alignment.center,
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: whiteColor,
                    ),
                    child: Stack(children: [
                      Icon(
                        Icons.notifications_outlined,
                        size: 25,
                        color: Theme.of(context).primaryColor,
                      ),
                      const Positioned(
                        top: 0,
                        bottom: 10,
                        left: 13,
                        right: 50,
                        child: Icon(
                          Icons.circle,
                          size: 9,
                          color: Colors.yellow,
                        ),
                      )
                    ]),
                  )
                ],
              ),
            ),
          ),
          Container(
            color: Colors.white,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.7,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20).copyWith(top: 110),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 11),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.circle,
                          size: 11,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Icon(
                          Icons.circle,
                          size: 11,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        subContainer(
                          text: 'Add Cylinder',
                          onPressed: () {},
                        ),
                        const Spacer(),
                        subContainer(
                          text: 'Top Up',
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(TopupScreen.routeName);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 17),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30)
                        .copyWith(bottom: 5),
                    child: Row(
                      children: [
                        const Text(
                          'Activity',
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                        const Spacer(),
                        Row(
                          children: const [
                            Text(
                              'View all',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 15,
                              color: Colors.green,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const ListContainer(
                    asset: 'assets/oando.jpg',
                    text: 'Swap Order',
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                  const ListContainer(
                    asset: 'assets/oando.jpg',
                    text: 'Swap Order',
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                  const ListContainer(
                    asset: 'assets/ap.jpg',
                    text: 'New Order',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class subContainer extends StatelessWidget {
  const subContainer({Key? key, required this.text, required this.onPressed})
      : super(key: key);
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: 163,
        height: 49,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).primaryColor,
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: whiteColor,
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class ListContainer extends StatelessWidget {
  const ListContainer({Key? key, required this.asset, required this.text})
      : super(key: key);
  final String asset;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 67,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Image.asset(
                asset,
                height: 37,
                width: 37,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: greyColor,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  '17 August 2021',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              '-₦ 4,500',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: greyColor,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
