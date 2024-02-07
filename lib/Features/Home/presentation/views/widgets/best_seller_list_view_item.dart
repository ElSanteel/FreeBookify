import 'package:book_store_app/Features/Home/presentation/views/widgets/book_rating.dart';
import 'package:book_store_app/constants.dart';
import 'package:book_store_app/core/utils/assets.dart';
import 'package:book_store_app/core/utils/routes.dart';
import 'package:book_store_app/core/utils/size_config.dart';
import 'package:book_store_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key});

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
              AspectRatio(
                aspectRatio: 3 / 4,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.red,
                    image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(AssetsData.testImage),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: SizeConfig.screenWidth! * 0.5,
                      child: const Text(
                        "Harry Potter and the Goblet of Fire",
                        style: Styles.textStyle20,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    const Text("J.K. Rowling", style: Styles.textStyle14),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        Text(
                          "19.99 €",
                          style: Styles.textStyle20.copyWith(
                              fontFamily: kGtSectraFine,
                              fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        const BookRating()
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
