class CategoriesModel {
  bool? status;
  CategoriesModelData? data;
  CategoriesModel.fromJson({required Map<String, dynamic> json}) {
    status = json['status'];
    data = json['data'] != null
        ? CategoriesModelData.fromJson(json: json['data'])
        : null;
  }
}

class CategoriesModelData {
  int? currentPage;
  List<CategoryModel> categories = [];
  CategoriesModelData.fromJson({required Map<String, dynamic> json}) {
    currentPage = json['current_page'];
    json['data'].forEach((element) {
      categories.add(CategoryModel.fromJson(json: element));
    });
  }
}

class CategoryModel {
  int? id;
  String? name;
  String? image;

  CategoryModel.fromJson({required Map<String, dynamic> json}) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
