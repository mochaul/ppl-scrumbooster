class ListCeremoniesModel {
  
  Map<String, List<ProblemItem>> _dictCeremoniesAlphabetic = {};

  ListCeremoniesModel.fromJson(Map<String, dynamic> parsedJson) {
    for (var key in parsedJson.keys) {
      var lstData = parsedJson[key];
      List<ProblemItem> listObj = [];
      for (var data in lstData) {
        listObj.add(ProblemItem.fromJson(data));
      }
      _dictCeremoniesAlphabetic[key] = listObj;
    }
  }

  Map<String, List<ProblemItem>> get dictCeremoniesAlphabetic => _dictCeremoniesAlphabetic;
  
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