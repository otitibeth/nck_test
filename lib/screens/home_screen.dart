import 'package:flutter/material.dart';
import 'package:nck_test_app/utils/colors.dart';
import 'package:nck_test_app/widgets/home_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          // alignment: Alignment.lerp(a, b, t),
          children: [
            const HomeContainer(),
            Positioned(
                top: h * 0.127,
                // bottom: h * 0.8,
                left: 0,
                right: 0,
                child: const CylinderContainer()),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle:
              TextStyle(color: Theme.of(context).primaryColor, fontSize: 10),
          unselectedLabelStyle:
              const TextStyle(color: Colors.black, fontSize: 10),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.credit_card_outlined,
              ),
              label: 'Card',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.auto_graph,
              ),
              label: 'Activity',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: 'Profile',
            ),
          ]),
    );
  }
}

class CylinderContainer extends StatelessWidget {
  const CylinderContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Container(
        // alignment: Alignment.center,
        width: double.infinity,
        height: h * 0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19),
          color: const Color.fromARGB(255, 252, 204, 48),
        ),
        padding:
            EdgeInsets.only(left: w * 0.06, right: w * 0.03, top: h * 0.02),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: w * 0.2,
                  height: h * 0.025,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.yellow.shade200,
                  ),
                  child: const Text(
                    'Cylinder ID: #942',
                    style: TextStyle(fontSize: 9),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: w * 0.01),
                  child: Row(
                    children: [
                      Text(
                        '25',
                        style: TextStyle(
                          color: whiteColor,
                          fontWeight: FontWeight.w700,
                          fontSize: h * 0.13,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: h * 0.08),
                        child: Text(
                          'Kg',
                          style: TextStyle(
                            color: whiteColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: w * 0.36,
                  height: h * 0.03,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.yellow.shade200,
                  ),
                  child: Text(
                    'Last purchase was 2 hours ago',
                    style: TextStyle(
                        fontSize: 9, color: Theme.of(context).primaryColor),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              width: w * 0.28,
              height: h * 0.28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19),
                // color: Colors.white,
              ),
              child: Image.asset('assets/cylinder.png'),
            ),
          ],
        ),
      ),
    );
  }
}
