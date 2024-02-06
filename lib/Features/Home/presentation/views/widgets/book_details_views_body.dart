import 'package:book_store_app/Features/Home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:book_store_app/Features/Home/presentation/views/widgets/custom_book_image.dart';
import 'package:book_store_app/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth! * 0.05,
          vertical: SizeConfig.screenHeight! * 0.03),
      child: const Column(
        children: [
          CustomBookDetailsAppBar(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 106),
            child: CustomBookImage(),
          )
        ],
      ),
    );
  }
}
