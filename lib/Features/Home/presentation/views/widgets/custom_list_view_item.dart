import 'package:book_store_app/core/utils/assets.dart';
import 'package:book_store_app/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth! * 0.30,
      child: AspectRatio(
        aspectRatio: 2.7 / 4,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.red,
              image: const DecorationImage(
                  fit: BoxFit.fill, image: AssetImage(AssetsData.testImage))),
        ),
      ),
    );
  }
}
