import 'package:shamo/models/products_model.dart';

class MassageModel {
  String? massage;
  int? userId;
  String? userName;
  String? userImage;
  bool? isFromUser;
  Products? products;
  late DateTime? createdAt;
  late DateTime? updatedAt;

  MassageModel({
    this.massage,
    this.userId,
    this.userName,
    this.userImage,
    this.isFromUser,
    this.products,
    this.createdAt,
    this.updatedAt,
  });

  MassageModel.fromJson(Map<String, dynamic> json) {
    massage = json['massage'];
    userId = json['userId'];
    userName = json['userName'];
    userImage = json['userImage'];
    isFromUser = json['isFromUser'];
    products = json['product'].isEmpty
        ? UninitializedProductModel()
        : Products.fromJson(json['product']);
    createdAt = DateTime.parse(json['createdAt']);
    updatedAt = DateTime.parse(json['updatedAt']);
  }

  Map<String, dynamic> toJson(){
    return {
      'massage': massage,
      'userId': userId,
      'userName': userName,
      'userImage': userImage,
      'isFromUser': isFromUser,
      'products': products is UninitializedProductModel ? {} : products?.toJson(),
      'createdAt': createdAt.toString(),
      'updatedAt': updatedAt.toString(),
    };
  }
}
