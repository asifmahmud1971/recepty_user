class RecipeDescModel {
  RecipeDescModel({
      this.tutorial,});

  RecipeDescModel.fromJson(dynamic json) {
    tutorial = json['tutorial'] != null ? Tutorial.fromJson(json['tutorial']) : null;
  }
  Tutorial? tutorial;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (tutorial != null) {
      map['tutorial'] = tutorial?.toJson();
    }
    return map;
  }

}

class Tutorial {
  Tutorial({
      this.id, 
      this.categoryId, 
      this.title, 
      this.description, 
      this.video, 
      this.ingredients, 
      this.isPremium, 
      this.status, 
      this.createdAt, 
      this.updatedAt, 
      this.videoLength,
    this.isBookmarked,
      this.tutorialSteps,
      this.tutorialImages,});

  Tutorial.fromJson(dynamic json) {
    id = json['id'];
    categoryId = json['category_id'];
    title = json['title'];
    description = json['description'];
    video =json['video']!=null? "https://jahodiss-recepty.com/storage/app/public/${json['video']}":null;
    if (json['ingredients'] != null) {
      ingredients = [];
      json['ingredients'].forEach((v) {
        ingredients?.add(Ingredients.fromJson(v));
      });
    }
    isPremium = json['is_premium'];
    videoLength = json['video_length']??"0";
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isBookmarked = json['is_bookmarked'];
    if (json['tutorial_steps'] != null) {
      tutorialSteps = [];
      json['tutorial_steps'].forEach((v) {
        tutorialSteps?.add(TutorialSteps.fromJson(v));
      });
    }
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
  List<Ingredients>? ingredients;
  int? isPremium;
  String? videoLength;
  int? status;
  String? createdAt;
  String? updatedAt;
  List<TutorialSteps>? tutorialSteps;
  bool? isBookmarked;
  List<TutorialImages>? tutorialImages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['category_id'] = categoryId;
    map['title'] = title;
    map['description'] = description;
    map['video'] = video;
    if (ingredients != null) {
      map['ingredients'] = ingredients?.map((v) => v.toJson()).toList();
    }
    map['is_premium'] = isPremium;
    map['video_length'] = videoLength;
    map['is_bookmarked'] = isBookmarked;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (tutorialSteps != null) {
      map['tutorial_steps'] = tutorialSteps?.map((v) => v.toJson()).toList();
    }
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

class TutorialSteps {
  TutorialSteps({
      this.id, 
      this.tutorialId, 
      this.name, 
      this.description, 
      this.createdAt, 
      this.updatedAt,});

  TutorialSteps.fromJson(dynamic json) {
    id = json['id'];
    tutorialId = json['tutorial_id'];
    name = json['name'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  int? tutorialId;
  String? name;
  String? description;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['tutorial_id'] = tutorialId;
    map['name'] = name;
    map['description'] = description;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

class Ingredients {
  Ingredients({
      this.id, 
      this.name, 
      this.image, 
      this.status, 
      this.createdAt, 
      this.updatedAt,});

  Ingredients.fromJson(dynamic json) {
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