import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CultureContainer extends StatelessWidget {
  final String image;
  final String name;
  final String description;

  const CultureContainer(
      {required this.image, required this.name, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12.h),
      //height: 200.h,
      child: Padding(
        padding: EdgeInsets.only(bottom: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 116.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(
                  20.r,
                ),
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              description,
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
