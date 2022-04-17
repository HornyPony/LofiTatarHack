import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lofi_tatar_hack/presentation/screens/shop_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      builder: (_) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: const Color(0xFF00342B),
          ),
          fontFamily: 'Comfortaa',
          primaryColor: const Color(0xFF006654),
        ),
        home: const ShopScreen(),
      ),
    );
  }
}
