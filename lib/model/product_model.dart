class ProductModel {
  String? name;
  String? price;
  String? category;
  String? details;
  String? imageUrl;
  String? location;
  String? sellerId;
  String? sellerName;
  String? sellerImg;

  ProductModel(
      {required this.name,
      required this.price,
      required this.category,
      required this.details,
      required this.imageUrl,
      required this.location,
      required this.sellerId,
      required this.sellerName,
      required this.sellerImg});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        name: json["name"],
        price: json["price"],
        category: json["category"],
        details: json["details"],
        imageUrl: json["imageUrl"],
        location: json["location"],
        sellerId: json["sellerId"],
        sellerName: json["sellerName"],
        sellerImg: json["sellerImg"]);
  }
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "price": price,
      "category": category,
      "details": details,
      "imageUrl": imageUrl,
      "location": location,
      "sellerId": sellerId,
      "sellerName": sellerName,
      "sellerImg":sellerImg
    };
  }
}
