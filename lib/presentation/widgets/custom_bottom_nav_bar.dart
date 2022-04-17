import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lofi_tatar_hack/presentation/screens/culture_screen.dart';
import 'package:lofi_tatar_hack/presentation/screens/links_screen.dart';
import 'package:lofi_tatar_hack/presentation/screens/shop_screen.dart';

class CustomBottomNavBar extends StatefulWidget {
  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const ShopScreen(),
              ),
            );
            break;
          case 1:
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const CultureScreen(),
              ),
            );
            break;
          case 2:
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const LinksScreen(),
              ),
            );
            break;
        }
      },
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xFF00231B),
      selectedFontSize: 11.sp,
      unselectedFontSize: 11.sp,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.white,
      currentIndex: _selectedPageIndex,
      items: [
        BottomNavigationBarItem(
          icon: bottomNavBarIcons(
            image: 'assets/images/shop_icon.png',
          ),
          label: 'Магазин',
        ),
        BottomNavigationBarItem(
          icon: bottomNavBarIcons(
            image: 'assets/images/culture_icon.png',
          ),
          label: 'Культура',
        ),
        BottomNavigationBarItem(
          icon: bottomNavBarIcons(
            image: 'assets/images/music_icon.png',
          ),
          label: 'Смотреть',
        ),
      ],
    );
  }
}

Widget bottomNavBarIcons({
  required String image,
}) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    width: 29.w,
    height: 29.h,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(image),
      ),
    ),
  );
}
