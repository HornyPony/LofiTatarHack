import 'package:flutter/material.dart';
import 'package:lofi_tatar_hack/presentation/widgets/custom_appbar.dart';
import 'package:lofi_tatar_hack/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ParticularMerchScreen extends StatelessWidget {
  final String image;
  final String name;
  final String description;
  final String structure;
  final int price;
  const ParticularMerchScreen(
      {Key? key,
      required this.image,
      required this.name,
      required this.price,
      required this.description,
      required this.structure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar.getCustomAppbar(context),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SafeArea(
        child: _ParticularMerchScreenBody(
          price: price,
          image: image,
          name: name,
          description: description,
          structure: structure,
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}

class _ParticularMerchScreenBody extends StatefulWidget {
  final String image;
  final String name;
  final String description;
  final String structure;
  final int price;
  const _ParticularMerchScreenBody(
      {Key? key,
      required this.image,
      required this.name,
      required this.price,
      required this.description,
      required this.structure})
      : super(key: key);

  @override
  State<_ParticularMerchScreenBody> createState() =>
      _ParticularMerchScreenBodyState();
}

class _ParticularMerchScreenBodyState
    extends State<_ParticularMerchScreenBody> {
  int selectedSizeBtnId = 1;
  int selectedColorBtnId = 1;
  int amount = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildMerchImage(),
              SizedBox(
                width: 16.w,
              ),
              Container(
                height: 160.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    _buildSizeChangeBtns(),
                    _buildColorChangeBtns(),
                    _buildChangeAmount(),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25.h,
          ),
          Text(
            widget.description,
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            widget.structure,
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.r))),
                        minimumSize: Size(60, 40),
                      ),
                      child: const Text(
                        'Добавить в корзину',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildMerchImage() {
    return Container(
      width: 150.h,
      height: 150.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        image: DecorationImage(
          image: AssetImage(widget.image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  _buildSizeChangeBtns() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Размер',
          style: TextStyle(
            color: Colors.white,
            fontSize: 11.sp,
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizeBtn(
              text: 'XS',
              onPressed: () {
                setState(() {
                  selectedSizeBtnId = 1;
                });
              },
              isBtnSelected: selectedSizeBtnId == 1,
            ),
            sizeBtn(
              text: 'S',
              onPressed: () {
                setState(() {
                  selectedSizeBtnId = 2;
                });
              },
              isBtnSelected: selectedSizeBtnId == 2,
            ),
            sizeBtn(
              text: 'M',
              onPressed: () {
                setState(() {
                  selectedSizeBtnId = 3;
                });
              },
              isBtnSelected: selectedSizeBtnId == 3,
            ),
            sizeBtn(
              text: 'L',
              onPressed: () {
                setState(() {
                  selectedSizeBtnId = 4;
                });
              },
              isBtnSelected: selectedSizeBtnId == 4,
            ),
          ],
        )
      ],
    );
  }

  _buildColorChangeBtns() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Цвет',
          style: TextStyle(
            color: Colors.white,
            fontSize: 11.sp,
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            colorBtn(
              color: Colors.white,
              onPressed: () {
                setState(() {
                  selectedColorBtnId = 1;
                });
              },
              isBtnSelected: selectedColorBtnId == 1,
            ),
            colorBtn(
              color: Colors.black,
              onPressed: () {
                setState(() {
                  selectedColorBtnId = 2;
                });
              },
              isBtnSelected: selectedColorBtnId == 2,
            ),
            colorBtn(
              color: Colors.red,
              onPressed: () {
                setState(() {
                  selectedColorBtnId = 3;
                });
              },
              isBtnSelected: selectedColorBtnId == 3,
            ),
            colorBtn(
              color: Colors.yellow,
              onPressed: () {
                setState(() {
                  selectedColorBtnId = 4;
                });
              },
              isBtnSelected: selectedColorBtnId == 4,
            ),
          ],
        )
      ],
    );
  }

  Widget sizeBtn(
      {required String text,
      required VoidCallback onPressed,
      required bool isBtnSelected}) {
    return Container(
      margin: EdgeInsets.only(right: 10.w),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 9.sp,
            color:
                isBtnSelected ? Colors.white : Theme.of(context).primaryColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          primary:
              isBtnSelected ? Theme.of(context).primaryColor : Colors.white,
          padding: EdgeInsets.zero,
          minimumSize: Size(
            20.w,
            20.w,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.r),
          ),
        ),
      ),
    );
  }

  Widget colorBtn(
      {required Color color,
      required VoidCallback onPressed,
      required bool isBtnSelected}) {
    return Container(
      margin: EdgeInsets.only(right: 10.w),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Container(),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          primary: color,
          side: BorderSide(
            width: 1.5.w,
            color: isBtnSelected
                ? Theme.of(context).primaryColor
                : Colors.transparent,
          ),
          padding: EdgeInsets.zero,
          minimumSize: Size(
            20.w,
            20.w,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.r),
          ),
        ),
      ),
    );
  }

  _buildChangeAmount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  if (amount != 0) {
                    amount--;
                  }
                });
              },
              child: const Icon(
                Icons.remove,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 6.w,
            ),
            Text(
              '$amount',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              width: 6.w,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  amount++;
                });
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          '${widget.price * amount} Р',
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xFFA6F3C5)),
        ),
      ],
    );
  }
}
