import 'package:book_store_app/constants.dart';
import 'package:book_store_app/core/utils/routes.dart';
import 'package:book_store_app/core/utils/size_config.dart';
import 'package:book_store_app/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: SizeConfig.screenHeight! * 0.65,
          child: Stack(
            children: [
              Image.asset(
                "assets/images/welcome_image.png",
                fit: BoxFit.fill,
                width: SizeConfig.screenWidth! * 1,
                height: SizeConfig.screenHeight! * 0.6,
              ),
              Positioned(
                  top: 390,
                  left: 130,
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: SizeConfig.screenWidth! * 0.38,
                  ))
            ],
          ),
        ),
        const Text(
          "Read more and stress less with our online book shopping app. Shop from anywhere you are and discover titles that you love. Happy reading!",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, fontFamily: 'OpenSans'),
        ),
        const SizedBox(
          height: 70,
        ),
        // CustomElevatedButton(
        //   buttonContent: "Get Started",
        //   buttonBackGround: primaryColor,
        //   buttonContentColor: secondPrimaryColor,
        //   buttonFunction: () {
        //     Navigator.of(context).push(MaterialPageRoute(
        //       builder: (context) => const LoginView(),
        //     ));
        //   },
        //   width: SizeConfig.screenWidth! * 0.88,
        //   height: SizeConfig.screenHeight! * 0.08,
        // ),
        CustomButton(backgroundColor: kPrimaryColor,
        text: "Get Started",
        textColor: kSecondaryColor,
        width: SizeConfig.screenWidth! * 0.88,
        height: SizeConfig.screenHeight! * 0.08,
        onPressed: () {
          GoRouter.of(context).push(AppRouter.kLoginView);
        },

        ),
      ]),
    );
  }
}
