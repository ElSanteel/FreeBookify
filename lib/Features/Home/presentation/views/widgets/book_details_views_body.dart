import 'package:book_store_app/Features/Home/presentation/views/widgets/book_rating.dart';
import 'package:book_store_app/Features/Home/presentation/views/widgets/books_action.dart';
import 'package:book_store_app/Features/Home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:book_store_app/Features/Home/presentation/views/widgets/custom_book_image.dart';
import 'package:book_store_app/Features/Home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:book_store_app/core/utils/size_config.dart';
import 'package:book_store_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth! * 0.05,
          vertical: SizeConfig.screenHeight! * 0.03),
      child: Column(
        children: [
          const CustomBookDetailsAppBar(),
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
          const SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "You can also like",
              style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const SimilarBooksListView(),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}


