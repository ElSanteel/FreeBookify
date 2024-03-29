// GoRouter confiquration
import 'package:book_store_app/Features/authentication/presentation/views/login_view.dart';
import 'package:book_store_app/Features/authentication/presentation/views/register_view.dart';
import 'package:book_store_app/Features/welcome/presentation/welcome_view.dart';
import 'package:book_store_app/core/models/book_model/book_model.dart';
import 'package:book_store_app/Features/home/data/repos/home_repo_implementation.dart';
import 'package:book_store_app/Features/home/presentation/manager/similiar_books_cubit/similar_books_cubit.dart';
import 'package:book_store_app/Features/home/presentation/views/book_details_view.dart';
import 'package:book_store_app/Features/home/presentation/views/home_view.dart';
import 'package:book_store_app/Features/splash/presentation/views/splash_view.dart';
import 'package:book_store_app/Features/search/presentation/views/search_view.dart';
import 'package:book_store_app/core/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kWelcomeView = '/welcomeView';
  static const kLoginView = '/loginView';
  static const kRegisterView = '/registerView';
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kWelcomeView,
        builder: (context, state) => const WelcomeView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kRegisterView,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              SimilarBooksCubit(getIt.get<HomeRepoImplementation>()),
          child: BookDetailsView(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
