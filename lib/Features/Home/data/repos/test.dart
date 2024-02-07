/*
import 'package:book_store_app/Features/home/data/models/book_model/book_model.dart';
import 'package:book_store_app/Features/home/data/repos/home_repo.dart';
import 'package:book_store_app/core/errors/failures.dart';
import 'package:book_store_app/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplementation extends HomeRepo {
  static const baseUrl = 'https://www.googleapis.com/books/v1';
  final ApiService apiService;

  HomeRepoImplementation(this.apiService);

  @override
  Future<Either<Failure, NewestBooks>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
        endPoint: '$baseUrl/volumes?Filtering=free-ebooks&orderBy=newest&q=subject:Programming',
      );
      List<BookModel> books = data['items'].map((item) => BookModel.fromJson(item)).toList();
      return right(NewestBooks(books));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, FeaturedBooks>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
        endPoint: '$baseUrl/volumes?Filtering=free-ebooks&q= computer science',
      );
      List<BookModel> books = data['items'].map((item) => BookModel.fromJson(item)).toList();
      return right(FeaturedBooks(books));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SimilarBooks>> fetchSimilarBooks({required String category}) async {
    try {
      var data = await apiService.get(
        endPoint: '$baseUrl/volumes?Filtering=free-ebooks&orderBy=relevance&q=subject:$category',
      );
      List<BookModel> books = data['items'].map((item) => BookModel.fromJson(item)).toList();
      return right(SimilarBooks(books));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}

class NewestBooks {
  final List<BookModel> books;

  NewestBooks(this.books);
}

class FeaturedBooks {
  final List<BookModel> books;

  FeaturedBooks(this.books);
}

class SimilarBooks {
  final List<BookModel> books;

  SimilarBooks(this.books);
}

*/