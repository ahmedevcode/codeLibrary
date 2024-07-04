import 'package:codelibrary/config/routes/app_routes.dart';
import 'package:codelibrary/core/utils/app_assets.dart';
import 'package:codelibrary/core/utils/app_colors.dart';
import 'package:codelibrary/core/utils/app_strings.dart';
import 'package:codelibrary/core/utils/app_styles.dart';
import 'package:codelibrary/features/home/data/models/book_model/book_model.dart';
import 'package:codelibrary/features/home/presentation/views/widgets/book_rating.dart';
import 'package:codelibrary/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({Key? key, required this.book}) : super(key: key);

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(8.0),
        onTap: () {
          Navigator.pushNamed(context, Routes.detailsView, arguments: book);
        },
        child: SizedBox(
          height: 150.h,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: CustomBookImage(
                  image: book.volumeInfo!.imageLinks?.thumbnail ??
                      'http://ecx.images-amazon.com/images/I/51vZFp-ETML.jpg',
                  borderRadius: 8.0,
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        book.volumeInfo!.title ?? 'Title Not Found',
                        style: AppStyles.textStyle20.copyWith(
                          fontFamily: AppAssets.fontGtSectraFine,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        book.volumeInfo!.authors!.join(' - '),
                        style: AppStyles.textStyle14.copyWith(
                          color: AppColors.grey,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStings.free,
                            style: AppStyles.textStyle20
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          BookRating(
                            rating: book.volumeInfo!.averageRating ?? 0,
                            count: book.volumeInfo!.ratingsCount ?? 0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
