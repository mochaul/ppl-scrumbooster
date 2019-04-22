class ListProblemsModel {
  List<dynamic> _listProblemsAlphabetic;

  ListProblemsModel.fromJson(Map<String, dynamic> parsedJson) {
      for(var alphabets in parsedJson.keys){
        _listProblemsAlphabetic.add(parsedJson[alphabets]);
      }
  }

  List<dynamic> get listProblemsAplhabetic => _listProblemsAlphabetic;

}

class ProblemItem {
  int _id;
  String _title;
  String _detail;
  String _image;
  List<dynamic> _enhanced;

  ProblemItem.fromJson(Map<String, dynamic> parsedJson) {
    _id = parsedJson['id'];
    _title = parsedJson['title'];
    _detail = parsedJson['detail'];
    _image = parsedJson['image'];
    _enhanced = parsedJson['can_be_enchanced_by_using'];
  }

  int get id => _id;
  String get title => _title;
  String get detail => _detail;
  String get image => _image;
  List<dynamic> get enhanced => _enhanced;
}