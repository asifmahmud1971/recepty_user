class HomeModel {
  HomeModel({
      this.blogs, 
      this.categories, 
      this.tutorials,});

  HomeModel.fromJson(dynamic json) {
    if (json['blogs'] != null) {
      blogs = [];
      json['blogs'].forEach((v) {
        blogs?.add(Blogs.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(Categories.fromJson(v));
      });
    }
    if (json['tutorials'] != null) {
      tutorials = [];
      json['tutorials'].forEach((v) {
        tutorials?.add(Tutorials.fromJson(v));
      });
    }
  }
  List<Blogs>? blogs;
  List<Categories>? categories;
  List<Tutorials>? tutorials;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (blogs != null) {
      map['blogs'] = blogs?.map((v) => v.toJson()).toList();
    }
    if (categories != null) {
      map['categories'] = categories?.map((v) => v.toJson()).toList();
    }
    if (tutorials != null) {
      map['tutorials'] = tutorials?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Tutorials {
  Tutorials({
      this.id, 
      this.categoryId, 
      this.title, 
      this.calorie, 
      this.description, 
      this.video, 
      this.videoLength, 
      this.ingredients, 
      this.isPremium, 
      this.status, 
      this.createdAt, 
      this.updatedAt, 
      this.tutorialImages,});

  Tutorials.fromJson(dynamic json) {
    id = json['id'];
    categoryId = json['category_id'];
    title = json['title'];
    calorie = json['calorie'];
    description = json['description'];
    video = json['video'];
    videoLength = json['video_length'];
    ingredients = json['ingredients'];
    isPremium = json['is_premium'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['tutorial_images'] != null) {
      tutorialImages = [];
      json['tutorial_images'].forEach((v) {
        tutorialImages?.add(TutorialImages.fromJson(v));
      });
    }
  }
  int? id;
  int? categoryId;
  String? title;
  String? calorie;
  String? description;
  dynamic video;
  dynamic videoLength;
  String? ingredients;
  int? isPremium;
  int? status;
  String? createdAt;
  String? updatedAt;
  List<TutorialImages>? tutorialImages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['category_id'] = categoryId;
    map['title'] = title;
    map['calorie'] = calorie;
    map['description'] = description;
    map['video'] = video;
    map['video_length'] = videoLength;
    map['ingredients'] = ingredients;
    map['is_premium'] = isPremium;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (tutorialImages != null) {
      map['tutorial_images'] = tutorialImages?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class TutorialImages {
  TutorialImages({
      this.id, 
      this.tutorialId, 
      this.image, 
      this.createdAt, 
      this.updatedAt,});

  TutorialImages.fromJson(dynamic json) {
    id = json['id'];
    tutorialId = json['tutorial_id'];
    image = "https://jahodiss-recepty.com/storage/app/public/${json['image']}";
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  int? tutorialId;
  String? image;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['tutorial_id'] = tutorialId;
    map['image'] = image;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
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
      this.updatedAt,});

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