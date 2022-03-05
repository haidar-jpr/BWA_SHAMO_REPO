import 'package:shamo/models/category_model.dart';
import 'package:shamo/models/gallery_model.dart';

class Products {
  late int? id;
  late String? name;
  late double? price;
  late String? description;
  late String? tags;
  late Category? category;
  late DateTime? createdAt;
  late DateTime? updatedAt;
  late List<Gallery>? galleries;

  Products({
    this.id,
    this.name,
    this.price,
    this.description,
    this.tags,
    this.category,
    this.createdAt,
    this.updatedAt,
    this.galleries,
  });

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = double.parse(json['price'].toString());
    description = json['description'];
    tags = json['tags'];
    category = Category.fromJson(json['category']);
    galleries = json['galleries']
        .map<Gallery>(
          (gallery) => Gallery.fromJson(gallery),
        )
        .toList();
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'tags': tags,
      'category': category?.toJson(),
      'galleries': galleries
          ?.map(
            (gallery) => gallery.toJson(),
          )
          .toList(),
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString(),
    };
  }
}

class UninitializedProductModel extends Products {}
