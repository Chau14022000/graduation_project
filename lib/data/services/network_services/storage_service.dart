import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  StorageService? firebaseService;

  final storageRef = FirebaseStorage.instance.ref();

  Future<String> upImage(String pathImage) async {
    final imagesRef = storageRef.child(pathImage);
    await imagesRef.putFile(
      File(pathImage),
    );
    return storageRef.child(pathImage).getDownloadURL();
  }
}
