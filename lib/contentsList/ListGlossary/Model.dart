class ListGlossaryModel {

  Map<String, List<GlossaryItem>> _dictGlossaryAlphabetic = {};

  ListGlossaryModel.fromJson(Map<String, dynamic> parsedJson) {
    for (var key in parsedJson.keys) {
      var lstData = parsedJson[key];
      List<GlossaryItem> listObj = [];
      for (var data in lstData) {
        listObj.add(GlossaryItem.fromJson(data));
      }
      _dictGlossaryAlphabetic[key] = listObj;
    }
  }

  Map<String, List<GlossaryItem>> get dictGlossaryAlphabetic => _dictGlossaryAlphabetic;

}

class GlossaryItem {
  int _id;
  String _title;
  String _detail;
  String _image;
  int _phase;

  GlossaryItem.fromJson(Map<String, dynamic> parsedJson) {
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