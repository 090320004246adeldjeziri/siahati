import 'package:achref_siaha/model/accomondation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AccomondationController extends GetxController {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  var accommodationsx = <Accommodation>[].obs;
List<Accommodation> accommodations = [
  Accommodation(
    id: '1',
    title: 'Luxury Beach House',
    description: 'Beautiful beachfront property with stunning ocean views.',
    imageUrl: 'assets/images/a.png',
    rating: 4.8,
    price: 250.0,
    availableFrom: DateTime(2024, 6, 1),
    position: 1,
  ),
  Accommodation(
    id: '2',
    title: 'Mountain Cabin Retreat',
    description: 'Cozy cabin nestled in the mountains, perfect for a retreat.',
    imageUrl: 'assets/images/a.png',
    rating: 4.5,
    price: 150.0,
    availableFrom: DateTime(2024, 7, 1),
    position: 2,
  ),
  Accommodation(
    id: '3', 
    title: 'City Center Apartment', 
    description: 'Modern apartment located in the heart of the city.',
    imageUrl: 'assets/images/a.png',
    rating: 4.6,
    price: 180.0,
    availableFrom: DateTime(2024, 8, 1),
    position: 3,
  ),
].obs;
 

  @override
  void onInit() {
    super.onInit();
    _db.collection('accommodations').snapshots().listen((snapshot) {
      accommodationsx.value = snapshot.docs
          .map((doc) => Accommodation.fromFirestore(doc))
          .toList();
    });
  }

  Future<void> addAccommodation(Accommodation accommodation) async {
    await _db.collection('accommodations').add(accommodation.toFirestore());
  }

  Future<void> updateAccommodation(Accommodation accommodation) async {
    await _db
        .collection('accommodations')
        .doc(accommodation.id)
        .update(accommodation.toFirestore());
  }

  Future<void> deleteAccommodation(String id) async {
    await _db.collection('accommodations').doc(id).delete();
  }
}
