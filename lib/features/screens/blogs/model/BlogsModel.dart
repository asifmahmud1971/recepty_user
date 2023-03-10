class BlogsModel {
  BlogsModel({
      this.blogs,});

  BlogsModel.fromJson(dynamic json) {
    if (json['blogs'] != null) {
      blogs = [];
      json['blogs'].forEach((v) {
        blogs?.add(Blogs.fromJson(v));
      });
    }
  }
  List<Blogs>? blogs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (blogs != null) {
      map['blogs'] = blogs?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Blogs {
  Blogs({
      this.id,
      this.name,
      this.image,
      this.description,
      this.status,
      this.createdAt,
      this.updatedAt,});

  Blogs.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = "https://jahodiss-recepty.com/storage/app/public/${json['image']}";
    description = json['description'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? name;
  String? image;
  String? description;
  int? status;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    map['description'] = description;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}