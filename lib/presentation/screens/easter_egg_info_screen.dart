import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:flutter/material.dart';
import 'package:lofi_tatar_hack/presentation/widgets/culture_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/custom_appbar.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class EasterEggInfoScreen extends StatelessWidget {
  final String realImage;
  final String animationImage;
  final String name;
  final String description;
  final String longDescription;

  const EasterEggInfoScreen(
      {Key? key,
      required this.realImage,
      required this.animationImage,
      required this.name,
      required this.description,
      required this.longDescription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar.getCustomAppbar(context),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SafeArea(
        child: _EasterEggScreenBody(
          realImage: realImage,
          animationImage: animationImage,
          name: name,
          description: description,
          longDescription: longDescription,
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}

class _EasterEggScreenBody extends StatelessWidget {
  final String realImage;
  final String animationImage;
  final String name;
  final String description;
  final String longDescription;

  const _EasterEggScreenBody(
      {Key? key,
      required this.realImage,
      required this.animationImage,
      required this.name,
      required this.description,
      required this.longDescription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        child: Column(
          children: [
            CultureContainer(
              image: realImage,
              name: name,
              description: description,
            ),
            DropCapText(
              longDescription,
              style: TextStyle(
                fontSize: 11.sp,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              dropCapPadding: EdgeInsets.only(right: 15.w),
              dropCap: DropCap(
                width: 100.w,
                height: 100.w,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    image: DecorationImage(
                      image: NetworkImage(
                        animationImage,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
          ],
        ),
      ),
    );
  }
}
