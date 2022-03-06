import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shamo/models/massage_model.dart';
import 'package:shamo/models/products_model.dart';
import 'package:shamo/models/user_model.dart';

class MassageService {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Stream<List<MassageModel>> getMassageByUserId({int? userId}) {
    try {
      return firebaseFirestore
          .collection('massage')
          .where('userId', isEqualTo: userId)
          .snapshots()
          .map((QuerySnapshot list) {
        var result = list.docs.map<MassageModel>((DocumentSnapshot m) {
          return MassageModel.fromJson(m.data() as Map<String, dynamic>);
        }).toList();

        result.sort(
          (MassageModel a, MassageModel b) =>
              a.createdAt!.compareTo(b.createdAt!),
        );

        return result;
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> addMassage(
      {User? user,
      bool? isFromUser,
      String? massage,
      Products? products}) async {
    try {
      firebaseFirestore.collection('massage').add({
        'userId': user?.id,
        'userName': user?.name,
        'userImage': user?.profilePhotoUrl,
        'isFromUser': isFromUser,
        'massage': massage,
        'product':
            products is UninitializedProductModel ? {} : products?.toJson(),
        'createdAt': DateTime.now().toString(),
        'updatedAt': DateTime.now().toString(),
      }).then((value) => print('pesan berhasil dikirim'));
    } catch (e) {
      throw Exception('Gagal mengirim pesan');
    }
  }
}
