import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:lofi_tatar_hack/domain/culture_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lofi_tatar_hack/domain/storage.dart';
import 'package:lofi_tatar_hack/presentation/screens/easter_egg_info_screen.dart';
import 'package:lofi_tatar_hack/presentation/widgets/custom_appbar.dart';
import 'package:lofi_tatar_hack/presentation/widgets/custom_bottom_nav_bar.dart';

import '../widgets/culture_container.dart';

class CultureScreen extends StatelessWidget {
  const CultureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar.getCustomAppbar(context),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SafeArea(
        child: _CultureScreenBody(),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}

class _CultureScreenBody extends StatefulWidget {
  @override
  State<_CultureScreenBody> createState() => _CultureScreenBodyState();
}

class _CultureScreenBodyState extends State<_CultureScreenBody> {
  final Storage storage = Storage();

  final List<CultureModel> cultureModelList = CultureModel.getAllCulture();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('season_easter_eggs')
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.only(
                  left: 14.w,
                  right: 14.w,
                  bottom: 12.h,
                ),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () async {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => EasterEggInfoScreen(
                          animationImage:
                              snapshot.data!.docs[index].get('animation_image'),
                          longDescription: snapshot.data!.docs[index]
                              .get('long_description'),
                          realImage:
                              snapshot.data!.docs[index].get('real_image'),
                          name: snapshot.data!.docs[index].get('name'),
                          description:
                              snapshot.data!.docs[index].get('description'),
                        ),
                      ));
                    },
                    child: CultureContainer(
                      image: snapshot.data!.docs[index].get('real_image'),
                      name: snapshot.data!.docs[index].get('name'),
                      description:
                          snapshot.data!.docs[index].get('description'),
                    ),
                  );
                },
              );
            },
          ),
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('always_easter_eggs')
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.only(
                  left: 14.w,
                  right: 14.w,
                  bottom: 12.h,
                ),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () async {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => EasterEggInfoScreen(
                          animationImage:
                              snapshot.data!.docs[index].get('animation_image'),
                          longDescription: snapshot.data!.docs[index]
                              .get('long_description'),
                          realImage:
                              snapshot.data!.docs[index].get('real_image'),
                          name: snapshot.data!.docs[index].get('name'),
                          description:
                              snapshot.data!.docs[index].get('description'),
                        ),
                      ));
                    },
                    child: CultureContainer(
                      image: snapshot.data!.docs[index].get('real_image'),
                      name: snapshot.data!.docs[index].get('name'),
                      description:
                          snapshot.data!.docs[index].get('description'),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
