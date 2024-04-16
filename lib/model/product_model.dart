class ProductModel {
  String? name;
  String? price;
  String? category;
  String? details;
  String? imageUrl;
  String? location;
  // String? ownerName;
  // String? ownerPhone;


  ProductModel({
    required this.name,
    required this.price,
    required this.category,
    required this.details,
    required this.imageUrl,
    required this.location,
    // required this.ownerName,
    // required this.ownerPhone
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json["name"],
      price: json["price"],
      category: json["category"],
      details: json["details"],
      imageUrl: json["imageUrl"],
      location: json["location"],
      // ownerName: json["ownerName"],
      // ownerPhone: json["ownerPhone"]
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "price": price,
      "category": category,
      "details": details,
      "imageUrl": imageUrl,
      "location": location,
      // "ownerName":ownerName,
      // "ownerPhone":ownerPhone,
    };
  }
}
