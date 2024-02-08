import 'package:book_store_app/Features/authentication/presentation/manager/login_cubit.dart';
import 'package:book_store_app/Features/authentication/presentation/manager/register_cubit.dart';
import 'package:book_store_app/Features/home/data/repos/home_repo_implementation.dart';
import 'package:book_store_app/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:book_store_app/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:book_store_app/constants.dart';
import 'package:book_store_app/core/utils/dio_helper.dart';
import 'package:book_store_app/core/utils/routes.dart';
import 'package:book_store_app/core/utils/service_locator.dart';
import 'package:book_store_app/core/utils/shared_preference_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceHelper.init();
  DioHelper.init();
  setupServiceLocator();
  runApp(const BookStoreApp());
}

class BookStoreApp extends StatelessWidget {
  const BookStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

         BlocProvider(
          create: (BuildContext context) => LoginCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => RegisterCubit(),
        ),

        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            getIt.get<HomeRepoImplementation>(),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) =>
              NewestBooksCubit(getIt.get<HomeRepoImplementation>())
                ..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: ThemeData().copyWith(
            scaffoldBackgroundColor: kSecondaryColor,
            textTheme: GoogleFonts.montserratTextTheme()),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
