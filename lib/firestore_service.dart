import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addWeatherReport({
    required String userId,
    required String city,
    required String reportText,
    DateTime? timestamp,
  }) async {
    await _firestore.collection('reports').add({
      'userId': userId,
      'city': city,
      'report': reportText,
      'timestamp': timestamp ?? DateTime.now(),
    });
  }

  Future<void> addCustomAlert({
    required String userId,
    required String type,
    required double threshold,
  }) async {
    await _firestore.collection('alerts').add({
      'userId': userId,
      'type': type, // e.g. "rain", "temperature"
      'threshold': threshold,
      'createdAt': DateTime.now(),
    });
  }
}
