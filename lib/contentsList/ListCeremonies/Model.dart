class ListCeremoniesModel {
  List<dynamic> _listCeremoniesAlphabetic;

  ListCeremoniesModel.fromJson(Map<String, dynamic> parsedJson) {
    for (var alphabets in parsedJson.keys) {
      _listCeremoniesAlphabetic.add(alphabets);
    }
  }

  List<dynamic> get listCeremoniesAlphabetic => _listCeremoniesAlphabetic;
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