class SearchResultModel {
  List<dynamic> _ceremonies;
  List<dynamic> _problems;

  SearchResultModel.fromJson(List<dynamic> parsedJson, String type) {
    if (type == "ceremonies") {
      _ceremonies = parsedJson;
    } else {
      _problems = parsedJson;
    }
  }

  List<dynamic> get ceremonies => _ceremonies;
  List<dynamic> get problems => _problems;
}

class CeremonyItem {
  int _id;
  String _title;
  String _detail;
  String _image;
  int _phase;

  CeremonyItem.fromJson(Map<String, dynamic> parsedJson) {
    _id = parsedJson['id'];
    _title = parsedJson['title'];
    _detail = parsedJson['detail'];
    _image = parsedJson['image'];
    _phase = parsedJson['phase'];
  }

  int get id => _id;
  String get title => _title;
  String get detail => _detail;
  String get image => _image;
  int get phase => _phase;
}

class ProblemItem {
  int _id;
  String _title;
  String _detail;
  String _image;
  List<int> _mayBeHappenAt;

  ProblemItem.fromJson(Map<String, dynamic> parsedJson) {
    _id = parsedJson['id'];
    _title = parsedJson['title'];
    _detail = parsedJson['detail'];
    _image = parsedJson['image'];
    _mayBeHappenAt = parsedJson['may_be_happen_at'];
  }

  int get id => _id;
  String get title => _title;
  String get detail => _detail;
  String get image => _image;
  List<int> get mayBeHappenAt => _mayBeHappenAt;
}