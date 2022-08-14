class HomeModel {
  bool? status;
  HomeModelData? data;
  HomeModel.fromJson({required Map<String, dynamic> json}) {
    status = json['true'];
    data = json['data'] != null
        ? HomeModelData.fromJson(json: json['data'])
        : null;
  }
}

class HomeModelData {
  List<Banner> banners = [];
  List<Product> products = [];
  HomeModelData.fromJson({required Map<String, dynamic> json}) {
    json['banners'].forEach((element) {
      banners.add(Banner.fromJson(json: element));
    });

    json['products'].forEach((element) {
      products.add(Product.fromJson(json: element));
    });
  }
}

class Banner {
  int? id;
  String? image;
  Banner.fromJson({required Map<String, dynamic> json}) {
    id = json['id'];
    image = json['image'];
  }
}

class Product {
  int? id;
  String? image;
  double? price;
  double? oldPrice;
  double? discount;
  String? name;
  Product.fromJson({required Map<String, dynamic> json}) {
    id = json['id'];
    image = json['image'];
    price = json['price'].toDouble();
    oldPrice = json['old_price'].toDouble();
    discount = json['discount'].toDouble();
    name = json['name'];
  }
}
