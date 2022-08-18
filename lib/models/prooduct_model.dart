class Product {
  int? id;
  String? image;
  double? price;
  double? oldPrice;
  double? discount;
  String? name;
  bool? isFavorite;
  Product.fromJson({required Map<String, dynamic> json}) {
    id = json['id'];
    image = json['image'];
    price = json['price'].toDouble();
    oldPrice = json['old_price'].toDouble();
    discount = json['discount'].toDouble();
    name = json['name'];
    isFavorite = json['in_favorites'] ?? true;
  }
}
