class SearchModel {
  bool? status;
  String? message;
  SearchData? data;
  SearchModel.fromJson({required Map<String, dynamic> json}) {
    status = json['status'];
    message = json['message'];
    data =
        json['data'] != null ? SearchData.fromJson(json: json['data']) : null;
  }
}

class SearchData {
  List<SearchProduct> data = [];
  SearchData.fromJson({required Map<String, dynamic> json}) {
    json['data'].forEach((element) {
      data.add(SearchProduct.fromJson(json: element));
    });
  }
}

class SearchProduct {
  int? id;
  String? image;
  double? price;
  double? oldPrice;
  double? discount;
  String? name;
  bool? isFavorites;
  SearchProduct.fromJson({required Map<String, dynamic> json}) {
    id = json['id'];
    image = json['image'];
    price = json['price'].toDouble();
    oldPrice = json['old_price'];
    discount = json['discount'];
    name = json['name'];
    isFavorites = json['in_favorites'];
  }
}
