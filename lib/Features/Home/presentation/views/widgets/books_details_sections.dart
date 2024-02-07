import 'package:book_store_app/Features/Home/presentation/views/widgets/book_rating.dart';
import 'package:book_store_app/Features/Home/presentation/views/widgets/books_action.dart';
import 'package:book_store_app/Features/Home/presentation/views/widgets/custom_book_image.dart';
import 'package:book_store_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 106),
          child: CustomBookImage(),
        ),
        const SizedBox(height: 43),
        Text(
          "The Jungle Book",
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            "Rudyard Kipling",
            style: Styles.textStyle18.copyWith(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        const BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 25,
        ),
        const BooksAction(),
      ],
    );
  }
}