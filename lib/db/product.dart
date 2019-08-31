import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class ProductoService{
  Firestore _firestore = Firestore.instance;

  void createProducto(String name){
    var id = Uuid();
    String categoryId = id.v1();

    _firestore.collection('producto').document(categoryId).setData({'nombre': name});
  }
}