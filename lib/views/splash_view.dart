import 'dart:async';

import 'package:ebooks/views/bottom_nav_bar_view.dart';
import 'package:ebooks/views/dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
   @override
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _checkLogin();
  }


  Future<void> _checkLogin() async {
    await Future.delayed(const Duration(seconds: 3)); // optional splash delay
   

  Get.offAll(BottomNavBarView());
  }

  @override
  void dispose() {
    _timer?.cancel(); // ✅ Cancel timer to avoid callback after dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 1.0,
            width: MediaQuery.of(context).size.width * 1.0,
            child: Image.asset(
              "assets/images/bg_image.PNG",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
        SvgPicture.asset("assets/svgs/app_icon.svg")
        ],
      ),
    );
  }
}
