import 'dart:convert';

class Product{
  final String name;
  final String description;
  final double price;
  final double quantity;
  final String category;
  final List<String> images;
  String? id;
  Product({required this.name,required this.description,required this.price,required this.quantity,required this.category,
    required this.images, this.id});

  Map<String, dynamic> toMap() {
    return {
      "name": this.name,
      "description": this.description,
      "price": this.price,
      "quantity": this.quantity,
      "category": this.category,
      "images": this.images,
      "id": this.id,

    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map["name"] ?? '',
      description: map["description"] ?? '',
      price: map["price"]?.toDouble() ?? 0.0,
      quantity: map["quantity"]?.toDouble() ?? 0.0,
      category: map["category"] ?? '',
      images: List<String>.from(map["images"]),
      id: map["_id"],

    );
  }
  String toJson()=>json.encode(toMap());
  factory Product.fromJson(String source)=>Product.fromMap(json.decode(source));
//
}