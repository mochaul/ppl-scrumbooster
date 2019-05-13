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