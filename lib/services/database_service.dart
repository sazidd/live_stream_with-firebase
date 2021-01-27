import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:live_stream_with_firebase/models/url_model.dart';

class DatabaseService {
  CollectionReference _products =
      FirebaseFirestore.instance.collection('products');

  // Future<void> addProduct({
  //   ProductModel product,
  //   String imageUrl,
  //   String title,
  //   String price,
  //   String description,
  // }) {
  //   return _products
  //       .doc(product.productId)
  //       .set(
  //         ProductModel(
  //           imageUrl: imageUrl,
  //           title: title,
  //           price: price,
  //           description: description,
  //         ).toMap(),
  //       )
  //       .then((value) => print("Product Added"))
  //       .catchError((error) => print("Failed to add product: $error"));
  // }

  Stream<List<UrlModel>> fetchProducts() {
    return _products.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => UrlModel.fromMap(doc.data())).toList());
  }
}
