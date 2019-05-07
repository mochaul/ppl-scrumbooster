class ProcessArea {
  int _id;
  String _title;
  int _relatedCeremony;

  ProcessArea.fromJson(Map<String, dynamic> parsedJson) {
    _id = parsedJson["id"];
    _title = parsedJson["title"];
    _relatedCeremony = parsedJson["related_ceremony"];
  }

  int get id => _id;
  String get title => _title;
  int get relatedCeremony => _relatedCeremony;
}

class CMMIPractices {
  int _id;
  String _title;
  String _strengthens;
  String _satisfy;
  String _demonstrated;
  int _processArea;

  CMMIPractices.fromJson(Map<String, dynamic> parsedJson) {
    _id = parsedJson['id'];
    _title = parsedJson['title'];
    _strengthens = parsedJson['strengthens'];
    _satisfy = parsedJson['satisfy'];
    _demonstrated = parsedJson['demonstrated'];
    _processArea = parsedJson['process_area'];
  }

  int get id => _id;
  String get title => _title;
  String get strengthens => _strengthens;
  String get satisfy => _satisfy;
  String get demonstrated => _demonstrated;
  int get processArea => _processArea;
}