class ListCeremoniesModel {
  List<List<dynamic>> _listCeremoniesAlphabetic;

  ListCeremoniesModel.fromJson(Map<String, dynamic> parsedJson) {
    for (var alphabet in parsedJson.keys) {
      _listCeremoniesAlphabetic.add(parsedJson[alphabet]);
    }
  }

  List<dynamic> get listCeremoniesAlphabetic => _listCeremoniesAlphabetic;
}

class CeremonyAlphabet {
  int _id;
  String _title;
  String _detail;
  String _image;
  int _phase;

  CeremonyAlphabet.fromJson(Map<String, dynamic> parsedJson) {
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