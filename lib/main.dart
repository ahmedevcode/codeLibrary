import 'package:codelibrary/config/routes/app_routes.dart';
import 'package:codelibrary/config/themes/app_theme.dart';
import 'package:codelibrary/core/utils/app_colors.dart';
import 'package:codelibrary/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.background,
      systemNavigationBarColor: AppColors.background,
    ),
  );
  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return MaterialApp(
            title: 'Bookly',
            debugShowCheckedModeBanner: false,
            theme: appTheme(),
            onGenerateRoute: AppRoutes.generateRoute,
          );
        });
  }
}
