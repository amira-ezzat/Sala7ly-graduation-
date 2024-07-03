import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sala7ly/modules/screens/order_parts/modelParts.dart';

class PartsBloc extends Cubit<List<Parts>> {
  PartsBloc() : super([]);

  void fetchProducts() {
    FirebaseFirestore.instance.collection('parts').snapshots().listen((snapshot) {
      try {
        final products = snapshot.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          return Parts(
            id: doc.id,
            total: data['total'] ?? 0, // Ensure default value if not present or type mismatch
            quantity: data['quantity'] ?? 0, // Ensure default value if not present or type mismatch
            imageUrl: data['imageUrl'] ?? '', // Ensure default value if not present or type mismatch
            price: data['price'] ?? 0, // Ensure default value if not present or type mismatch
            name: data['name'] ?? '', // Ensure default value if not present or type mismatch
          );
        }).toList();
        emit(products);
      } catch (e) {
        // Handle error
        print('Error fetching Parts: $e');
      }
    });
  }

  void updateProductQuantity(String partsId, int newQuantity) {
    FirebaseFirestore.instance.collection('parts').doc(partsId).update({
      'quantity': newQuantity,
    });
  }
}
