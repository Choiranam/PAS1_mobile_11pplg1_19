import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg1_19/controllers/bottom_nav_controller.dart';
import 'package:pas1_mobile_11pplg1_19/pages/menus/custom_bottom_navigation_bar.dart';
import 'package:pas1_mobile_11pplg1_19/pages/menus/favorite.dart';
import 'package:pas1_mobile_11pplg1_19/pages/menus/home.dart';
import 'package:pas1_mobile_11pplg1_19/pages/menus/profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavController bottomNavController =
        Get.find<BottomNavController>();

    final List<Widget> menus = [Home(), Favorite(), Profile()];

    return Obx(() {
      return Scaffold(
        body: menus[bottomNavController.selectedIndex.value],
        bottomNavigationBar: CustomBottomNavigationBar(
          selectedIndex: bottomNavController.selectedIndex.value,
          onTap: bottomNavController.changeIndexMenu,
        ),
      );
    });
  }
}
