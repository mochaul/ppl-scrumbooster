class ListProblemsModel {
  List<dynamic> _problems;

  ListProblemsModel.fromJson(Map<String, dynamic> parsedJson) {
      _problems = parsedJson['problems'];
  }

  List<dynamic> get problems => _problems;

}

class ProblemsItem {
  int _id;
  String _title;
  String _detail;
  String _image;
  List<dynamic> _enhanced;

  ProblemsItem.fromJson(Map<String, dynamic> parsedJson) {
    _id = parsedJson['id'];
    _title = parsedJson['title'];
    _detail = parsedJson['detail'];
    _image = parsedJson['image'];
    _enhanced = parsedJson['can_be_enchanced_by_using'];
  }

  int get id => _id;
  String get title => _title;
  String get detail => _detail;
  String get image => _image;
  List<dynamic> get enhanced => _enhanced;
}