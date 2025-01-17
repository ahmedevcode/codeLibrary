import 'package:codelibrary/config/routes/app_routes.dart';
import 'package:codelibrary/core/shimmer/shimmer_similar_books_list_view.dart';
import 'package:codelibrary/core/widgets/custom_error_widget.dart';
import 'package:codelibrary/features/home/presentation/cubits/similar_books_cubit/similar_books_cubit.dart';
import 'package:codelibrary/features/home/presentation/cubits/similar_books_cubit/similar_books_state.dart';
import 'package:codelibrary/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccessState) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 90.h,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: state.books.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, Routes.detailsView,
                            arguments: state.books[index]);
                      },
                      borderRadius: BorderRadius.circular(8.0),
                      child: AspectRatio(
                          aspectRatio: 2.7 / 4,
                          child: CustomBookImage(
                            borderRadius: 8.0,
                            image: state.books[index].volumeInfo!.imageLinks
                                    ?.thumbnail ??
                                'http://ecx.images-amazon.com/images/I/51vZFp-ETML.jpg',
                          )),
                    ),
                    separatorBuilder: (context, index) => SizedBox(width: 10.w),
                  ),
                ),
              ],
            ),
          );
        } else if (state is SimilarBooksFailureState) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const ShimmerSimilarBooksListView();
        }
      },
    );
  }
}
