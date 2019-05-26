class ListProblemsModel {

  Map<String, List<ProblemItem>> _dictProblemsAlphabetic = {};

  ListProblemsModel.fromJson(Map<String, dynamic> parsedJson) {
    for (var key in parsedJson.keys) {
      var lstData = parsedJson[key];
      List<ProblemItem> listObj = [];
      for (var data in lstData) {
        listObj.add(ProblemItem.fromJson(data));
      }
      _dictProblemsAlphabetic[key] = listObj;
    }
  }

  Map<String, List<ProblemItem>> get dictProblemsAlphabetic => _dictProblemsAlphabetic;

}

class ProblemItem {
  int _id;
  String _title;
  String _detail;
  String _image;
  List<dynamic> _canBeSolvedBy;

  ProblemItem.fromJson(Map<String, dynamic> parsedJson) {
    _id = parsedJson['id'];
    _title = parsedJson['title'];
    _detail = parsedJson['detail'];
    _image = parsedJson['image'];
    _canBeSolvedBy = parsedJson['can_be_solved_by'];
  }

  int get id => _id;
  String get title => _title;
  String get detail => _detail;
  String get image => _image;
  List<dynamic> get canBeSolvedBy => _canBeSolvedBy;
}