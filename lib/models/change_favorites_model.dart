import 'package:shop_app/models/prooduct_model.dart';

class ChangeFavoritesModel {
  bool? status;
  String? message;
  ChangeFavoritesModelData? data;
  ChangeFavoritesModel.fromJson({required Map<String, dynamic> json}) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null
        ? ChangeFavoritesModelData.fromJson(json: json['data'])
        : null;
  }
}

class ChangeFavoritesModelData {
  int? id;
  Product? product;
  ChangeFavoritesModelData.fromJson({required Map<String, dynamic> json}) {
    id = json['id'];

    product = json['product'] != null
        ? Product.fromJson(json: json['product'])
        : null;
    print(json['product'].keys);
  }
}
