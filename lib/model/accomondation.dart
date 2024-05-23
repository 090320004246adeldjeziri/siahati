import 'package:cloud_firestore/cloud_firestore.dart';

class Accommodation {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double rating;
  final double price;
  final DateTime availableFrom;
  final int position;

  Accommodation({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.price,
    required this.availableFrom,
    required this.position,
  });

  factory Accommodation.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Accommodation(
      id: doc.id,
      title: data['title'],
      description: data['description'],
      imageUrl: data['imageUrl'],
      rating: data['rating'],
      price: data['price'],
      availableFrom: (data['availableFrom'] as Timestamp).toDate(),
      position: data['position'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'rating': rating,
      'price': price,
      'availableFrom': availableFrom,
      'position': position,
    };
  }
}
