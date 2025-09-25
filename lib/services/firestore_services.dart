import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class FirestoreServices {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<void> addMethod(
    BuildContext context,
    var model,
    String collectionname,
  ) async {
    try {
      await _firebaseFirestore
          .collection(collectionname)
          .doc(model.id)
          .set(model.toJson());
    } catch (e) {
      if (kDebugMode) {
        print("Error while adding is ${e.toString()}");
      }
    }
  }
}
