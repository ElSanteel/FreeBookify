import 'package:book_store_app/Features/Home/presentation/views/widgets/books_details_sections.dart';
import 'package:book_store_app/Features/Home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:book_store_app/Features/Home/presentation/views/widgets/similar_books_section.dart';
import 'package:book_store_app/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth! * 0.05,
              vertical: SizeConfig.screenHeight! * 0.03,
            ),
            child: const Column(
              children: [
                CustomBookDetailsAppBar(),
                BookDetailsSection(),
                Expanded(
                  child: SizedBox(
                    height: 30,
                  ),
                ),
                SimilarBooksSection(),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
