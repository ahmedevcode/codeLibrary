import 'package:codelibrary/config/routes/app_routes.dart';
import 'package:codelibrary/core/utils/app_assets.dart';
import 'package:codelibrary/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..forward();
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    // Optionally, navigate to another screen after some time
    navigateToHome();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: FadeTransition(
      opacity: _animation,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          AppAssets.logo,
          width: 250.w,
          height: 250.h,
        ),
        SizedBox(
          height: 20.h,
        ),
        const CircularProgressIndicator(
          color: AppColors.yellow,
        ),
      ]),
    )));
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      return Navigator.pushReplacementNamed(context, Routes.homeView);
    });
  }
}
