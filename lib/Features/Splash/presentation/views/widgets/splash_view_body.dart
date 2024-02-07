import 'package:book_store_app/Features/Splash/presentation/views/widgets/sliding_text.dart';
import 'package:book_store_app/core/utils/assets.dart';
import 'package:book_store_app/core/utils/routes.dart';
import 'package:book_store_app/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AssetsData.logo,
            width: SizeConfig.screenWidth! * 0.5,
          ),
          const SizedBox(height: 10),
          SlidingText(slidingAnimation: slidingAnimation),
        ],
      ),
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 3), end: Offset.zero)
            .animate(animationController);

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        navigateToHome();
      }
    });
    animationController.forward();
  }

  void navigateToHome() {
  Future.delayed(const Duration(seconds: 2), (){
  GoRouter.of(context).push(AppRouter.kHomeView);
  });
  }
}
