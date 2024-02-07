import 'package:book_store_app/Features/home/data/models/book_model/book_model.dart';
import 'package:book_store_app/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:book_store_app/Features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:book_store_app/constants.dart';
import 'package:book_store_app/core/utils/routes.dart';
import 'package:book_store_app/core/utils/size_config.dart';
import 'package:book_store_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: SizedBox(
          height: 150,
          child: Row(
            children: [
              CustomBookImage(
                  imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail??''),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: SizeConfig.screenWidth! * 0.5,
                      child: Text(
                        bookModel.volumeInfo.title!,
                        style: Styles.textStyle20,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(bookModel.volumeInfo.authors![0],
                        style: Styles.textStyle14),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        Text(
                          "Free",
                          style: Styles.textStyle20.copyWith(
                              fontFamily: kGtSectraFine,
                              fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        BookRating(
                          rating: bookModel.volumeInfo.averageRating ?? 0,
                          count: bookModel.volumeInfo.ratingsCount ?? 0,
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
