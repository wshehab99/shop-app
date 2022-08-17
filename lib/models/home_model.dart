import 'package:shop_app/models/prooduct_model.dart';

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
