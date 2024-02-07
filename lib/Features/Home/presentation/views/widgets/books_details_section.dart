import 'package:book_store_app/Features/home/data/models/book_model/book_model.dart';
import 'package:book_store_app/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:book_store_app/Features/home/presentation/views/widgets/books_action.dart';
import 'package:book_store_app/Features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:book_store_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 106),
          child: CustomBookImage(
            imageUrl: book.volumeInfo.imageLinks?.thumbnail ?? '',
          ),
        ),
        const SizedBox(height: 43),
        Text(
          book.volumeInfo.title!,
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            book.volumeInfo.authors?[0] ?? '',
            style: Styles.textStyle18.copyWith(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        BookRating(
          rating: book.volumeInfo.averageRating ?? 0,
          count: book.volumeInfo.ratingsCount ?? 0,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 25,
        ),
         BooksAction(bookModel: book),
      ],
    );
  }
}
