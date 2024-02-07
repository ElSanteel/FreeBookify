import 'package:book_store_app/Features/home/presentation/manager/similiar_books_cubit/similar_books_cubit.dart';
import 'package:book_store_app/Features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:book_store_app/core/utils/size_config.dart';
import 'package:book_store_app/core/utils/widgets/custom_error_widget.dart';
import 'package:book_store_app/core/utils/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight! * 0.18,
      child: BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
        builder: (context, state) {
          if (state is SimilarBooksSuccess) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: CustomBookImage(
                    imageUrl:
                        'https://fastly.picsum.photos/id/915/200/300.jpg?hmac=dzVwmjYlIh3MdKz2l08oFpp1y3XxMyu_1vjGp5Dycd0',
                  ),
                );
              },
            );
          } else if (state is SimilarBooksFailure) {
            return CustomErrorWidget(errorMessage: state.errorMessage);
          } else {
            return const CustomLoadingIndicator();
          }
        },
      ),
    );
  }
}
