import 'package:codelibrary/features/home/data/models/book_model/book_model.dart';
import 'package:codelibrary/features/home/presentation/views/widgets/books_detail_section.dart';
import 'package:codelibrary/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({Key? key, required this.book}) : super(key: key);
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.22),
                  child: AspectRatio(
                    aspectRatio: 2.7 / 4,
                    child: Hero(
                      tag: 'book-image-${book.id}',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          book.volumeInfo!.imageLinks?.thumbnail ??
                              'http://ecx.images-amazon.com/images/I/51vZFp-ETML.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              BookDetailsSection(book: book),
              const SizedBox(height: 20.0),
              const Text(
                'Similar Books',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              const SimilarBooksListView(),
            ],
          ),
        ),
      ),
    );
  }
}
