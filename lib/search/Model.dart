class SearchResultModel {
  List<dynamic> _ceremonies;
  List<dynamic> _problems;
  List<dynamic> _phases;

  SearchResultModel.fromJson(List<dynamic> parsedJson, String type) {
    if (type == "ceremonies") {
      _ceremonies = parsedJson;
    } else if (type == "problems") {
      _problems = parsedJson;
    } else {
      _phases = parsedJson;
    }
  }

  List<dynamic> get ceremonies => _ceremonies;
  List<dynamic> get problems => _problems;
  List<dynamic> get phases => _phases;
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
  List<dynamic> _canBeSolvedUsing;

  ProblemItem.fromJson(Map<String, dynamic> parsedJson) {
    _id = parsedJson['id'];
    _title = parsedJson['title'];
    _detail = parsedJson['detail'];
    _image = parsedJson['image'];
    _canBeSolvedUsing = parsedJson['can_be_solved_by'];
  }

  int get id => _id;
  String get title => _title;
  String get detail => _detail;
  String get image => _image;
  List<dynamic> get canBeSolvedUsing => _canBeSolvedUsing;
}

class PhaseItem {
  int _id;
  String _title;
  String _detail;
  String _image;

  PhaseItem.fromJson(Map<String, dynamic> parsedJson) {
    _id = parsedJson['id'];
    _title = parsedJson['title'];
    _detail = parsedJson['detail'];
    _image = parsedJson['image'];
  }

  int get id => _id;
  String get title => _title;
  String get detail => _detail;
  String get image => _image;
}