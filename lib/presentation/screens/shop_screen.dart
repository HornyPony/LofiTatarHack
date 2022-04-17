import 'package:flutter/material.dart';
import 'package:lofi_tatar_hack/presentation/screens/particular_merch_screen.dart';
import 'package:lofi_tatar_hack/presentation/widgets/custom_appbar.dart';
import 'package:lofi_tatar_hack/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:lofi_tatar_hack/presentation/widgets/search_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/filter_btn_model.dart';
import '../../domain/merch_model.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar.getCustomAppbar(context),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SafeArea(
        child: _ShopScreenBody(),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}

class _ShopScreenBody extends StatefulWidget {
  @override
  State<_ShopScreenBody> createState() => _ShopScreenBodyState();
}

class _ShopScreenBodyState extends State<_ShopScreenBody> {
  String query = '';
  final List<Merch> tshirtsList = Merch.getAllTshirts();
  final List<Merch> cupsList = Merch.getAllCups();
  //final List<Merch> hoodiesList = Merch.getAllHoodies();
  List<FilterBtnModel> filterMerchBtns = FilterBtnModel.filterMerchBtns();
  int n = 0;

  List<Merch> allMerch = [];
  List<Merch> filteredMerch = [];

  @override
  void initState() {
    allMerch = tshirtsList + cupsList;
    filteredMerch.addAll(allMerch);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //_buildSearch(),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: filterMerchBtns
                .map((filter) => FilterChipBtn(
                      selectedBtn: filter,
                      onPressed: () {
                        setState(() {
                          filterMerchBtns = filterMerchBtns.map((otherFilter) {
                            return filter == otherFilter
                                ? otherFilter.copy(
                                    isSelected: !otherFilter.isSelected)
                                : otherFilter;
                          }).toList();

                          if (n == 0) {
                            filteredMerch = [];
                            n++;
                          }
                          switch (filter.btnText) {
                            case 'Футболки':
                              if (!filter.isSelected) {
                                filteredMerch.addAll(tshirtsList);
                              } else {
                                filteredMerch.removeWhere(
                                    (item) => item.type == 'Футболка');
                              }
                              break;
                            case 'Кружки':
                              if (!filter.isSelected) {
                                filteredMerch.addAll(cupsList);
                              } else {
                                filteredMerch.removeWhere(
                                    (item) => item.type == 'Кружка');
                              }
                              break;
                            /*case 'Толстовки':
                              if (!filter.isSelected) {
                                filteredMerch.addAll(hoodiesList);
                              } else {
                                filteredMerch.removeWhere(
                                    (item) => item.type == 'Толстовка');
                              }*/
                          }

                          if (n == 1 && filteredMerch.isEmpty) {
                            filteredMerch.addAll(allMerch);
                            n = 0;
                          }
                        });
                      },
                    ))
                .toList(),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 5,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 15.h,
              ),
              shrinkWrap: true,
              itemCount: filteredMerch.length,
              itemBuilder: (context, index) {
                return _MerchContainer(
                  description: filteredMerch[index].description,
                  structure: filteredMerch[index].structure,
                  image: filteredMerch[index].image,
                  name: filteredMerch[index].name,
                  price: filteredMerch[index].price,
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearch() {
    return SearchWidget(
      text: query,
      hintText: 'Поиск',
      onChanged: searchMerch,
    );
  }

  void searchMerch(String query) {
    final discoveredMerch = allMerch.where((merch) {
      final merchNameLow = merch.name.toLowerCase();
      final searchLower = query.toLowerCase();

      return (merchNameLow.contains(searchLower));
    }).toList();

    setState(() {
      this.query = query;
      filteredMerch = discoveredMerch;
    });
  }
}

class _MerchContainer extends StatelessWidget {
  final String image;
  final String name;
  final String description;
  final String structure;
  final int price;

  const _MerchContainer({
    Key? key,
    required this.description,
    required this.structure,
    required this.image,
    required this.name,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ParticularMerchScreen(
              structure: structure,
              image: image,
              description: description,
              name: name,
              price: price,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Theme.of(context).primaryColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 148.w,
                height: 142.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  image: DecorationImage(
                    image: AssetImage(
                      image,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 7.h,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Text(
                    '$price р.',
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FilterChipBtn extends StatelessWidget {
  final FilterBtnModel selectedBtn;
  final VoidCallback onPressed;

  final Color selectedBtnColor = const Color(0xFF00A944);
  final Color unselectedBtnColor = const Color(0xFF00816A);
  final Color textColor = const Color(0xFFD1D1D1);
  final Color chosenColor = const Color(0xFFFFFFFF);

  FilterChipBtn({
    Key? key,
    required this.onPressed,
    required this.selectedBtn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.w),
      padding: EdgeInsets.symmetric(
        vertical: 15.h,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          minimumSize: Size(
            65.w,
            34.h,
          ),
          primary:
              selectedBtn.isSelected ? selectedBtnColor : unselectedBtnColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          padding: EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 10.w,
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Text(
          selectedBtn.btnText,
          style: TextStyle(
            fontSize: 18.sp,
            color: selectedBtn.isSelected ? chosenColor : textColor,
          ),
        ),
      ),
    );
  }
}
