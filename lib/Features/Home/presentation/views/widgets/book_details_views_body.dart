import 'package:book_store_app/Features/home/data/models/book_model/book_model.dart';
import 'package:book_store_app/Features/home/presentation/views/widgets/books_details_section.dart';
import 'package:book_store_app/Features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:book_store_app/Features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:book_store_app/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;

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
            child: Column(
              children: [
                const CustomBookDetailsAppBar(),
                BookDetailsSection(book: bookModel),
                const Expanded(
                  child: SizedBox(
                    height: 30,
                  ),
                ),
                const SimilarBooksSection(),
                const SizedBox(
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
