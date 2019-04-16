class ProductBacklogModel {
  List<dynamic> _ceremonies;
  List<dynamic> _problems;

  ProductBacklogModel.fromJson(Map<String, dynamic> parsedJson) {
    _ceremonies = parsedJson['ceremonies'];
    _problems = parsedJson['problems'];
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
  List<dynamic> _enhanced;

  CeremonyItem.fromJson(Map<String, dynamic> parsedJson) {
    _id = parsedJson['id'];
    _title = parsedJson['title'];
    _detail = parsedJson['detail'];
    _image = parsedJson['image'];
    _phase = parsedJson['phase'];
    _enhanced = parsedJson['can_be_enchanced_by_using'];
  }

  int get id => _id;
  String get title => _title;
  String get detail => _detail;
  String get image => _image;
  int get phase => _phase;
  List<dynamic> get enhanced => _enhanced;
}

class ProblemItem {
  int _id;
  String _title;
  String _detail;
  String _image;
  List<dynamic> _mayBeHappenAt;
  List<dynamic> _canBeSolvedUsing;

  ProblemItem.fromJson(Map<String, dynamic> parsedJson) {
    _id = parsedJson['id'];
    _title = parsedJson['title'];
    _detail = parsedJson['detail'];
    _image = parsedJson['image'];
    _mayBeHappenAt = parsedJson['may_be_happen_at'];
    _canBeSolvedUsing = parsedJson['can_be_solved_using'];
  }

  int get id => _id;
  String get title => _title;
  String get detail => _detail;
  String get image => _image;
  List<dynamic> get mayBeHappenAt => _mayBeHappenAt;
  List<dynamic> get canBeSolvedUsing => _canBeSolvedUsing;
}