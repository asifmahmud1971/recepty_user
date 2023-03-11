class FileDataModel {
  List<FileData>? fileDataList = [];

  FileDataModel(this.fileDataList);
}

class FileData {
  String? path;
  String? type;

  FileData({this.path, this.type});
}
