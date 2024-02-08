import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  final String imageUrl;
  const CustomBookImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.5 / 4,
        child: FutureBuilder(
          future: precacheImage(NetworkImage(imageUrl), context),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Icon(Icons.error));
            } else {
              return Image.network(
                imageUrl,
                fit: BoxFit.fill,
              );
            }
          },
        ),
      ),
    );

    //   ClipRRect(
    //   borderRadius: BorderRadius.circular(16),
    //   child: AspectRatio(
    //     aspectRatio: 2.5 / 4,
    //     child: CachedNetworkImage(
    //       fit: BoxFit.fill,
    //       imageUrl: imageUrl,
    //       placeholder: (context, url) =>
    //           const Center(child: CircularProgressIndicator()),
    //       errorWidget: (context, url, error) => const Icon(Icons.error),
    //     ),
    //   ),
    // );
  }
}
