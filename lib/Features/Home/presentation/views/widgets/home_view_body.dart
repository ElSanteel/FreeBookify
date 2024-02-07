import 'package:book_store_app/Features/home/presentation/views/widgets/newest_books_list_view.dart';
import 'package:book_store_app/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:book_store_app/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:book_store_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: CustomAppBar(),
              ),
              FeaturedBooksListView(),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text("Best Seller", style: Styles.textStyle18),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: NewestBooksListView(),
          ),
        )
      ],
    );
  }
}
