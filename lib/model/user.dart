import 'package:cloud_firestore/cloud_firestore.dart';


class Users {
  String id;
  int creditPoints;
  String name;
  String lastName;
  String email;
  String phoneNumber;
  String role;
  DateTime? createdAt;
  DateTime? updatedAt;
List<String> favoriteItemIds = List.from([]);
  Users({
    required this.id,
    required this.creditPoints,
    required this.name,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.role,
    this.createdAt,
    this.updatedAt,
    required this.favoriteItemIds 
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'creditPoints': creditPoints,
      'name': name,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'role': role,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
      'favoriteItemIds': favoriteItemIds,
    };
  }

  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(
      id: map['id'],
      creditPoints: map['creditPoints'],
      name: map['name'],
      lastName: map['lastName'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      role: map['role'],
      createdAt: map['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'])
          : null,
      updatedAt: map['updatedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['updatedAt'])
          : null,
      favoriteItemIds: List<String>.from(map['favoriteItemIds'] ?? []),
    );
 
  }
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
Future<void> modifyUser(Users user) async {
  final userCollection = FirebaseFirestore.instance.collection('users');
  user.updatedAt = DateTime.now();
  
  await userCollection.doc(user.id).update(user.toMap());
}

}