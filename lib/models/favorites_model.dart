import 'package:shop_app/models/prooduct_model.dart';

class FavoriteModel {
  bool? status;
  String? message;
  FavoriteData? data;
  FavoriteModel.fromJson({required Map<String, dynamic> json}) {
    status = json['status'];
    message = json['message'];
    data =
        json['data'] != null ? FavoriteData.fromJson(json: json['data']) : null;
  }
}

class FavoriteData {
  List<FavoritesList> data = [];
  FavoriteData.fromJson({required Map<String, dynamic> json}) {
    json['data'].forEach((element) {
      data.add(FavoritesList.fromJson(json: element));
    });
  }
}

class FavoritesList {
  int? id;
  Product? product;
  FavoritesList.fromJson({required json}) {
    id = json['id'];
    product = json['product'] != null
        ? Product.fromJson(json: json['product'])
        : null;
  }
}
