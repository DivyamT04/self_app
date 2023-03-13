import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:self_app/models/category_model.dart';
import 'package:self_app/repositories/category/base_category_repository.dart';

class CategoryRepository extends BaseCategoryRepository{
  final FirebaseFirestore _firebaseFirestore;

  CategoryRepository({
   FirebaseFirestore? firebaseFirestore
}): _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;



  @override
  Stream<List<Categorym>> getAllCategories() {
    return _firebaseFirestore.collection('categories').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Categorym.fromSnapshot(doc)).toList();
    });
  }

}