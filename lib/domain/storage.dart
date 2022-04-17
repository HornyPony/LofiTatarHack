import 'package:firebase_storage/firebase_storage.dart';

class Storage {
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  Future<String> downloadURL(String imageName) async {
    String downloadURL = await firebaseStorage
        .ref('animation_easter_egg_images/$imageName')
        .getDownloadURL();

    return downloadURL;
  }
}
