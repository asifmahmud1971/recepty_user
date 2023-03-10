class CategoryModel {
  CategoryModel({
    this.categories,
  });

  CategoryModel.fromJson(dynamic json) {
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(Categories.fromJson(v));
      });
    }
  }

  List<Categories>? categories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (categories != null) {
      map['categories'] = categories?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Categories {
  Categories({
    this.id,
    this.name,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  Categories.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = "https://jahodiss-recepty.com/storage/app/public/${json['image']}";
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  int? id;
  String? name;
  String? image;
  int? status;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
