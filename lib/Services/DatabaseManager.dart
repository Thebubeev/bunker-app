import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class DatabaseManager {
  final CollectionReference profileList =
      Firestore.instance.collection('profileInfo');

  Future<void> createUserData(
      String name,
      String gender,
      String profession,
      String phobia,
      String humanQuality,
      String health,
      String hobby,
      String additionalSkill,
      String baggage,
      String uid) async {
    return await profileList.document(uid).setData({
      'name': name,
      'gender': gender,
      'profession': profession,
      'phobia': phobia,
      'humanQuality': humanQuality,
      'health': health,
      'hobby': hobby,
      'additionalSkill': additionalSkill,
      'baggage': baggage
    });
  }

  Future updateUserList(
      String name,
      String gender,
      String profession,
      String phobia,
      String humanQuality,
      String health,
      String hobby,
      String additionalSkill,
      String baggage,
      String uid) async {
    return await profileList.document(uid).updateData({
      'name': name,
      'gender': gender,
      'profession': profession,
      'phobia': phobia,
      'humanQuality': humanQuality,
      'health': health,
      'hobby': hobby,
      'additionalSkill': additionalSkill,
      'baggage': baggage
    });
  }

  Future getUsersList() async {
    List itemsList = [];
    try {
      await profileList.getDocuments().then((querySnapshot) {
        querySnapshot.documents.forEach((element) {
          itemsList.add(element.data);
        });
      });
      return itemsList;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
