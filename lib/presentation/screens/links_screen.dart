import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lofi_tatar_hack/presentation/screens/admin_panel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../widgets/custom_appbar.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LinksScreen extends StatelessWidget {
  const LinksScreen({Key? key}) : super(key: key);

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
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AdminPanel()));
            },
            child: Icon(Icons.settings),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SafeArea(
        child: _LinksScreenBody(),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}

class _LinksScreenBody extends StatefulWidget {
  @override
  State<_LinksScreenBody> createState() => _LinksScreenBodyState();
}

class _LinksScreenBodyState extends State<_LinksScreenBody> {
  String link = '';

  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: YoutubePlayerController.convertUrlToId(
        "https://www.youtube.com/watch?v=E_AxahMhkN8")!,
    params: const YoutubePlayerParams(
      mute: false,
      showFullscreenButton: false,
    ),
  );

  /*@override
  void initState() {
    link = FirebaseFirestore.instance
        .collection('streaming').get({link})


        super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          YoutubePlayerIFrame(
            controller: _controller,
          ),
          StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('streaming').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) return Text('Нет стримов');
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return _LinkContainer(
                    platform: snapshot.data!.docs[index].id,
                    isOnline: snapshot.data!.docs[index].get('link') != '',
                    link: snapshot.data!.docs[index].get('link'),
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}

class _LinkContainer extends StatelessWidget {
  final String platform;
  final bool isOnline;
  final String link;

  const _LinkContainer(
      {Key? key,
      required this.platform,
      required this.isOnline,
      required this.link})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (link != '') {
          if (Uri.parse(link).host == '') {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                content: const Text(
                    'Введена неправильная ссылка. Обратититесь к тех. поддержке')));
          }
          if (!await launch(link)) throw 'Could not launch $link';
        }
      },
      child: Container(
        height: 100,
        margin: EdgeInsets.only(
          top: 2.h,
        ),
        color: Theme.of(context).primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLinkIcon(platform),
                SizedBox(
                  height: 6.h,
                ),
                _buildIsOnline(),
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 50,
                ),
                Text(
                  'PLAY',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Container _buildLinkIcon(String platform) {
    return Container(
      width: 200.w,
      height: 40.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            _getPlatformImage(platform),
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Row _buildIsOnline() {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: isOnline ? Colors.green : Colors.red,
          radius: 5.r,
        ),
        SizedBox(
          width: 6.w,
        ),
        Text(
          isOnline ? 'Online' : 'Offline',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  String _getPlatformImage(String platform) {
    String image = 'assets/images/kul_sharif.png';
    switch (platform) {
      case 'youtube':
        image = 'assets/images/youtube.png';
        break;
      case 'vk':
        image = 'assets/images/vk.png';
        break;
      case 'rutube':
        image = 'assets/images/rutube.png';
        break;
    }
    return image;
  }
}
