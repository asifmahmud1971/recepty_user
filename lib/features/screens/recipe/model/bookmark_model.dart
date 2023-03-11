class BookmarkModel {
  BookmarkModel({
      this.message, 
      this.bookmark,});

  BookmarkModel.fromJson(dynamic json) {
    message = json['message'];
    bookmark = json['bookmark'] != null ? Bookmark.fromJson(json['bookmark']) : null;
  }
  String? message;
  Bookmark? bookmark;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (bookmark != null) {
      map['bookmark'] = bookmark?.toJson();
    }
    return map;
  }

}

class Bookmark {
  Bookmark({
      this.tutorialId, 
      this.userId, 
      this.updatedAt, 
      this.createdAt, 
      this.id,});

  Bookmark.fromJson(dynamic json) {
    tutorialId = json['tutorial_id'];
    userId = json['user_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }
  String? tutorialId;
  int? userId;
  String? updatedAt;
  String? createdAt;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tutorial_id'] = tutorialId;
    map['user_id'] = userId;
    map['updated_at'] = updatedAt;
    map['created_at'] = createdAt;
    map['id'] = id;
    return map;
  }

}