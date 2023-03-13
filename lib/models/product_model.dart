import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  const Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.isRecommended,
    required this.price,
    required this.isPopular,
  });

  @override
  List<Object?> get props =>
      [name, category, imageUrl, price, isRecommended, isPopular];

  static Product fromSnaphshot(DocumentSnapshot snap) {
    Product product = Product(
        name: snap['name'],
        category: snap['category'],
        imageUrl: snap['imageUrl'],
        isRecommended: snap['isRecommended'],
        price: snap['price'],
        isPopular: snap['isPopular']);
    return product;
  }

  static List<Product> products = [
    Product(
        name: 'Soft Drink1',
        category: 'Soft Drink',
        imageUrl:
            "https://images.unsplash.com/photo-1543253687-c931c8e01820?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80",
        isRecommended: true,
        price: 2.99,
        isPopular: false),
    Product(
        name: 'Soft Drink2',
        category: 'Soft Drink',
        imageUrl:
            "https://images.unsplash.com/photo-1581006852262-e4307cf6283a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
        isRecommended: false,
        price: 2.99,
        isPopular: true),
    Product(
        name: 'Soft Drink3',
        category: 'Soft Drink',
        imageUrl:
            "https://images.unsplash.com/photo-1610873167013-2dd675d30ef4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=564&q=80",
        isRecommended: true,
        price: 2.99,
        isPopular: true),
    Product(
        name: 'Soft Drink4',
        category: 'Soft Drink',
        imageUrl:
            "https://images.unsplash.com/photo-1610873167013-2dd675d30ef4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=564&q=80",
        isRecommended: true,
        price: 2.99,
        isPopular: true),
    Product(
        name: 'Soft Drink5',
        category: 'Soft Drink',
        imageUrl:
            "https://images.unsplash.com/photo-1610873167013-2dd675d30ef4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=564&q=80",
        isRecommended: true,
        price: 2.99,
        isPopular: true),
    Product(
        name: 'Smoothie1',
        category: 'Smoothies',
        imageUrl:
            "https://plus.unsplash.com/premium_photo-1675011400491-d94d368559fd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1129&q=80",
        isRecommended: true,
        price: 2.99,
        isPopular: false),
    Product(
        name: 'Smoothie2',
        category: 'Smoothies',
        imageUrl:
            "https://images.unsplash.com/photo-1575159249868-df58bf5e09ec?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
        isRecommended: false,
        price: 2.99,
        isPopular: false),
    Product(
        name: 'Smoothie3',
        category: 'Smoothies',
        imageUrl:
            "https://plus.unsplash.com/premium_photo-1675011400491-d94d368559fd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1129&q=80",
        isRecommended: true,
        price: 2.99,
        isPopular: false),
    Product(
        name: 'Smoothie4',
        category: 'Smoothies',
        imageUrl:
            "https://plus.unsplash.com/premium_photo-1675011400491-d94d368559fd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1129&q=80",
        isRecommended: true,
        price: 2.99,
        isPopular: false),
    Product(
        name: 'Smoothie5',
        category: 'Smoothies',
        imageUrl:
            "https://plus.unsplash.com/premium_photo-1675011400491-d94d368559fd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1129&q=80",
        isRecommended: true,
        price: 2.99,
        isPopular: false),
  ];
}
