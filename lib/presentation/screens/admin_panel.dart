import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminPanel extends StatelessWidget {
  const AdminPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SafeArea(
        child: _AdminPanel(),
      ),
    );
  }
}

class _AdminPanel extends StatelessWidget {
  final TextEditingController _youTubeEditingController =
      TextEditingController();
  final TextEditingController _rutubeEditingController =
      TextEditingController();
  final TextEditingController _vkEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          _buildForm(
            'YouTube URL',
            context,
            _youTubeEditingController,
          ),
          SizedBox(
            height: 10.h,
          ),
          _buildForm(
            'Rutube URL',
            context,
            _rutubeEditingController,
          ),
          SizedBox(
            height: 10.h,
          ),
          _buildForm(
            'VK URL',
            context,
            _vkEditingController,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection('streaming')
                        .doc('vk')
                        .update({'link': _vkEditingController.text});
                    FirebaseFirestore.instance
                        .collection('streaming')
                        .doc('rutube')
                        .update({'link': _rutubeEditingController.text});

                    FirebaseFirestore.instance
                        .collection('streaming')
                        .doc('youtube')
                        .update({'link': _youTubeEditingController.text});
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.r))),
                    minimumSize: Size(60, 40),
                  ),
                  child: const Text(
                    'Создать стримы',
                  ),
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

  _buildForm(
      String hintText, BuildContext context, TextEditingController controller) {
    return Form(
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.name,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          fillColor: Theme.of(context).primaryColor,
          filled: true,
          isDense: true,
          contentPadding: EdgeInsets.symmetric(
            vertical: 14.w,
            horizontal: 14.w,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.white,
            fontSize: 17.sp,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.r),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 3.w,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.r),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 3.w,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.r),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 3.w,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.r),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 3.w,
            ),
          ),
        ),
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 17.sp,
          color: Colors.white,
        ),
        textInputAction: TextInputAction.done,
      ),
    );
  }
}
