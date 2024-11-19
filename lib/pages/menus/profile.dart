import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg1_19/components/reusable_profile.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Profile', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ReusableProfile(
        imageUrl: 'https://cdn.idntimes.com/content-images/community/2023/11/whatsapp-image-2023-11-18-at-22832-pm-770cbc2889bb4c14bf5042be7b505d5d-93212c139bcb97803a8be4e80918c21c.jpeg',
        name: 'Muhammad Choirul\'anam',
        description: 'Student at SMK Raden Umar Said Kudus\nAspiring Software Developer',
        onLogout: () {
          Get.offAllNamed('/login');
        },
      ),
    );
  }
}
