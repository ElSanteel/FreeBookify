import 'package:book_store_app/Features/home/data/models/book_model/book_model.dart';
import 'package:book_store_app/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: CustomButton(
            text: "19.99€",
            backgroundColor: Colors.white,
            textColor: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
        ),
        Expanded(
          child: CustomButton(
            onPressed: () async {
              Uri uri = Uri.parse(bookModel.volumeInfo.previewLink!);

              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
              }
            },
            fontSize: 16,
            text: "Free preview",
            backgroundColor: const Color(0xffEF8262),
            textColor: Colors.white,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
          ),
        )
      ],
    );
  }
}
