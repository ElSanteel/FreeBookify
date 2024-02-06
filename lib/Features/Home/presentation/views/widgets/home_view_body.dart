import 'package:book_store_app/Features/Home/presentation/views/widgets/custom_app_bar.dart';
import 'package:book_store_app/Features/Home/presentation/views/widgets/featured_list_view.dart';
import 'package:book_store_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          FeaturedBooksListView(),
          SizedBox(
            height: 16,
          ),
          Text("Best Seller", style: Styles.titleMedium)
        ],
      ),
    );
  }
}
