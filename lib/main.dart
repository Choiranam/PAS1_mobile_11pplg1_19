import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg1_19/controllers/bottom_nav_controller.dart';
import 'package:pas1_mobile_11pplg1_19/pages/home_page.dart';
import 'package:pas1_mobile_11pplg1_19/views/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(BottomNavController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login App',
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/homepage', page: () => HomePage()),
      ],
    );
  }
}
