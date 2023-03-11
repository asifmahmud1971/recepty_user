class RecipeListModel {
  RecipeListModel({
      this.tutorials,});

  RecipeListModel.fromJson(dynamic json) {
    if (json['tutorials'] != null) {
      tutorials = [];
      json['tutorials'].forEach((v) {
        tutorials?.add(Tutorials.fromJson(v));
      });
    }
  }
  List<Tutorials>? tutorials;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
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
      this.description, 
      this.video, 
      this.ingredients, 
      this.isPremium, 
      this.videoLength,
      this.status,
      this.calorie,
    this.isBookmarked,
    this.createdAt,
      this.updatedAt, 
      this.tutorialImages,});

  Tutorials.fromJson(dynamic json) {
    id = json['id'];
    categoryId = json['category_id'];
    title = json['title'];
    description = json['description'];
    video = json['video'];
    videoLength = json['video_length']??"0";
    ingredients = json['ingredients'];
    calorie = json['calorie'];
    isPremium = json['is_premium'];
    status = json['status'];
    isBookmarked = json['is_bookmarked'];
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
  String? description;
  dynamic video;
  String? ingredients;
  String? videoLength;
  String? calorie;
  int? isPremium;
  int? status;
  String? createdAt;
  String? updatedAt;
  bool? isBookmarked;
  List<TutorialImages>? tutorialImages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['category_id'] = categoryId;
    map['title'] = title;
    map['description'] = description;
    map['video'] = video;
    map['video_length'] = videoLength;
    map['calorie'] = calorie;
    map['ingredients'] = ingredients;
    map['is_premium'] = isPremium;
    map['status'] = status;
    map['is_bookmarked'] = isBookmarked;
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