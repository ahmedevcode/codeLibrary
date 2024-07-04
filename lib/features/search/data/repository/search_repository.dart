import 'package:codelibrary/core/errors/failures.dart';
import 'package:codelibrary/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<BookModel>>> fetchSearchedBooks(
      {required String bookName});
}
