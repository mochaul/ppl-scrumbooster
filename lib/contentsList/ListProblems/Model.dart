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
  int _phase;

  ProblemItem.fromJson(Map<String, dynamic> parsedJson) {
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