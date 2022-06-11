class Article {
  late String _title;
  late String body;
  int _code = 10;

  String get title => _title == null ? "" : _title.toUpperCase();

  set title(String value) {
    if (value.length > 10) throw "title must be less than 10 characters!";

    _title = value;
  }

  void message() => print("Article $_code");
}
