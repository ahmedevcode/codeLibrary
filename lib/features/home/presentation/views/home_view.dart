import 'package:codelibrary/config/icons/icons_broken.dart';
import 'package:codelibrary/config/routes/app_routes.dart';
import 'package:codelibrary/core/utils/app_colors.dart';
import 'package:codelibrary/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            const Text(
              'CodeLibrary',
              style: TextStyle(
                  color: AppColors.yellow,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal),
            ),
            const SizedBox(width: 8),
            Image.asset(
              'assets/images/logodesign.png', // Path to your image asset
              fit: BoxFit.contain,
              height: 32, // Adjust the height as needed
            ),
            // Space between the image and the text

            // Your text
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(IconBroken.Search),
            onPressed: () {
              Navigator.pushNamed(context, Routes.searchView);
            },
          ),
        ],
      ),
      body: const HomeViewBody(),
    );
  }
}
