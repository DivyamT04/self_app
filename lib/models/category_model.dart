import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Categorym extends Equatable {
  final String name;
  final String imageUrl;

  const Categorym({
    required this.name,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [name, imageUrl];

  static Categorym fromSnapshot(DocumentSnapshot snap) {
    Categorym category =
        Categorym(name: snap['name'], imageUrl: snap['imageUrl']);
    return category;
  }

  static List<Categorym> categories = [
    Categorym(
        name: 'Soft Drink',
        imageUrl:
            'https://images.unsplash.com/photo-1625126590386-95ef31adb2cd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
    Categorym(
        name: 'Smoothies',
        imageUrl:
            'https://images.unsplash.com/photo-1506458961255-571f40df5aad?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
    Categorym(
        name: 'Water',
        imageUrl:
            'https://images.unsplash.com/photo-1548839140-29a749e1cf4d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1588&q=80')
  ];
}
