import 'package:achref_siaha/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final Rx<Users> _user = Users(
    id: '124',
    creditPoints: 100,
    name: 'John',
    lastName: 'Doe',
    email: 'john.doe@example.com',
    phoneNumber: '+1234567890',
    role: 'user',
    favoriteItemIds: [""]
  ).obs;

  final RxBool isLoading = false.obs;

  Users get user => _user.value;
  set user(Users value) => _user.value = value;

  void addFavoriteItem(String itemId) {
    _user.update((user) {
      user?.favoriteItemIds.add(itemId);
    });
    updateUser(_user.value); // Update the user in Firestore
  }

  void removeFavoriteItem(String itemId) {
    _user.update((user) {
      user?.favoriteItemIds.remove(itemId);
    });
    updateUser(_user.value); // Update the user in Firestore
  }

  bool isFavoriteItem(String itemId) {
    return _user.value.favoriteItemIds.contains(itemId);
  }

  // Firestore methods
  Future<void> addUser(Users user) async {
    final userCollection = FirebaseFirestore.instance.collection('users');
    user.id = userCollection.doc().id; // Assign a new document ID to the user
    user.createdAt = DateTime.now();
    user.updatedAt = DateTime.now();
    
    await userCollection.doc(user.id).set(user.toMap());
  }

  Future<void> deleteUser(String userId) async {
    final userCollection = FirebaseFirestore.instance.collection('users');
    await userCollection.doc(userId).delete();
  }

  Future<void> updateUser(Users user) async {
    final userCollection = FirebaseFirestore.instance.collection('users');
    user.updatedAt = DateTime.now();
    
    await userCollection.doc(user.id).update(user.toMap());
  }

  Future<void> fetchUser(String userId) async {
    final userCollection = FirebaseFirestore.instance.collection('users');
    final docSnapshot = await userCollection.doc(userId).get();

    if (docSnapshot.exists) {
      _user.value = Users.fromMap(docSnapshot.data()!);
    }
  }
}
