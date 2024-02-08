import 'package:book_store_app/constants.dart';
import 'package:book_store_app/core/utils/assets.dart';
import 'package:book_store_app/core/utils/routes.dart';
import 'package:book_store_app/core/utils/shared_preference_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AssetsData.logo,
            height: 70,
          ),
          IconButton(
              onPressed: () {
                // GoRouter.of(context).push(AppRouter.kSearchView);
                SharedPreferenceHelper.removeData(key: userTokenKey);
                SharedPreferenceHelper.removeData(key: userNameTokenKey);

                GoRouter.of(context).push(AppRouter.kLoginView);
              },
              icon: const Icon(
                // FontAwesomeIcons.magnifyingGlass,
                Icons.logout,
                size: 30,
              ))
        ],
      ),
    );
  }
}
