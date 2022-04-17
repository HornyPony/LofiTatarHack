import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppbar {
  static AppBar getCustomAppbar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      centerTitle: true,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Алтын',
            style: TextStyle(
              fontSize: 20.sp,
            ),
          ),
          SizedBox(
            width: 6.w,
          ),
          CircleAvatar(
            radius: 22.r,
            backgroundImage: const AssetImage(
              'assets/images/girl.png',
            ),
          ),
          SizedBox(
            width: 6.w,
          ),
          Text(
            'Кыз',
            style: TextStyle(
              fontSize: 20.sp,
            ),
          ),
        ],
      ),
    );
  }
}
