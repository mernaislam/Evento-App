import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evento_app/features/auth/data/model/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseManager
{
  static Future<bool> postUserToFirestore(String fullName, String email, String imageUrl) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    final user = Account(
      id: docUser.id,
      fullName: fullName,
      email: email,
      profileImage: imageUrl,
      events: [],
      favorites: [],
    );
    final json = user.toJson();
    await docUser.set(json);
    return true;
  }

  static Future<String> uploadImageToFirebase(File? imageFile) async {
    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
    final ref =
        FirebaseStorage.instance.ref().child('images').child(uniqueFileName);
    try {
      await ref.putFile(imageFile!);
      return await ref.getDownloadURL();
      // _postUserToFirestore();
    } catch (e) {
      // TODO
    }
    return '';
  }
}