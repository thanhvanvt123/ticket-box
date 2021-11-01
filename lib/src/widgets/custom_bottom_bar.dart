import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ticket_box/src/common/themes.dart';
import 'package:ticket_box/src/routes/routes.dart';
import 'package:ticket_box/src/services/global_states/shared_states.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class CustomBottombarController extends GetxController {
  final SharedStates states = Get.find();
  Future<void> changeSelected(int index) async {
    Get.offAndToNamed(items[index].route);
    states.bottomBarSelectedIndex.value = index;
  }
}

class BottomItem extends SalomonBottomBarItem {
  final String route;
  final String text;
  final Icon icon;

  BottomItem({
    required this.route,
    required this.text,
    required this.icon,
  }) : super(
    title: Text(text),
<<<<<<< HEAD
    icon: icon
=======
    icon: icon,
>>>>>>> vanlt
  );
}

final items = [
  BottomItem(
    text: 'Home',
    icon: Icon(Icons.home),
    route: Routes.home
  ),
  BottomItem(
<<<<<<< HEAD
    text: 'Accounts',
    icon: Icon(Icons.manage_accounts),
    route: Routes.home
=======
    text: 'Transactions',
    icon: Icon(Icons.local_attraction_rounded),
    route: Routes.transaction,
>>>>>>> vanlt
  ),
  
  BottomItem(
    text: 'Profile',
    icon: Icon(Icons.person),
    route: Routes.profile
  ),
];

class CustomBottombar extends GetView<CustomBottombarController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        decoration: BoxDecoration(
<<<<<<< HEAD
          color: Colors.white,
          //border: Border.all(color: Colors.grey.shade300),
=======
          color: float_element_color,
          border: Border.all(color: float_element_color),
>>>>>>> vanlt
          boxShadow: [
            BoxShadow(
              color: secondary_color,
              blurRadius: 4.0,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: SalomonBottomBar(
<<<<<<< HEAD
          // selectedColorOpacity: 0.8,
          selectedItemColor: accent_green,
          unselectedItemColor: Colors.black54,
=======
          selectedItemColor: accent_green,
          unselectedItemColor: secondary_color,
>>>>>>> vanlt
          currentIndex: controller.states.bottomBarSelectedIndex.value,
          onTap: (i) => controller.changeSelected(i),
          items: items,
        ),
      );
    });
  }
}
