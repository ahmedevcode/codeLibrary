import 'package:codelibrary/core/utils/app_colors.dart';
import 'package:codelibrary/core/utils/app_strings.dart';
import 'package:codelibrary/features/home/presentation/views/widgets/newset_list_view.dart';
import 'package:codelibrary/features/home/presentation/views/widgets/featured_books_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FeaturedBooksListView(),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                AppStings.newsetBooks,
                style: TextStyle(
                    color: AppColors.yellow,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal),
              ),
            ),
            NewsetListView(),
          ],
        ),
      ),
    );
  }
}
