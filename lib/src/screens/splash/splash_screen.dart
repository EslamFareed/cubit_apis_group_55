import 'package:cubit_apis_group_55/core/utils/navigation_helper.dart';
import 'package:cubit_apis_group_55/src/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      NavigationHelper.goOff(context, const HomeScreen());
    });

    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.dashboard, size: 200),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
