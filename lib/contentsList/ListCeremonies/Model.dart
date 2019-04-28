class ListCeremoniesModel {
  
  Map<String, List<CeremonyItem>> _dictCeremoniesAlphabetic = {};

  ListCeremoniesModel.fromJson(Map<String, dynamic> parsedJson) {
    for (var key in parsedJson.keys) {
      var lstData = parsedJson[key];
      List<CeremonyItem> listObj = [];
      for (var data in lstData) {
        listObj.add(CeremonyItem.fromJson(data));
      }
      _dictCeremoniesAlphabetic[key] = listObj;
    }
  }

  Map<String, List<CeremonyItem>> get dictCeremoniesAlphabetic => _dictCeremoniesAlphabetic;
  
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