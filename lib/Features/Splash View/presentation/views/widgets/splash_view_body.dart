import 'package:book_store_app/core/utils/assets.dart';
import 'package:book_store_app/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AssetsData.logo,
            width: SizeConfig.screenWidth! * 0.5,
          ),
          const SizedBox(height: 15),
          const Text(
            "Read Free Books",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
