import 'package:book_store_app/Features/home/data/repos/home_repo_implementation.dart';
import 'package:book_store_app/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:book_store_app/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:book_store_app/constants.dart';
import 'package:book_store_app/core/utils/routes.dart';
import 'package:book_store_app/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
          create: (context) => FeaturedBooksCubit(
            getIt.get<HomeRepoImplementation>(),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) =>
              NewestBooksCubit(getIt.get<HomeRepoImplementation>()),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: ThemeData().copyWith(
            scaffoldBackgroundColor: kPrimaryColor,
            textTheme: GoogleFonts.montserratTextTheme()),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
