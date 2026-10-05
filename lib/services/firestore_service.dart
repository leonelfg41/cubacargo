import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveUser({
    required String uid,
    required Map<String, dynamic> data,
  }) async {
    await _firestore.collection('users').doc(uid).set(data, SetOptions(merge: true));
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUser(String uid) async {
    return _firestore.collection('users').doc(uid).get();
  }

  Future<void> saveLoad(Map<String, dynamic> data) async {
    final ref = _firestore.collection('loads').doc();
    await ref.set({
      ...data,
      'id': ref.id,
    });
  }

  Future<List<Map<String, dynamic>>> getLoads() async {
    final snapshot = await _firestore.collection('loads').get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }
}
