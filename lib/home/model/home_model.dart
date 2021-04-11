class HomeModel {
  static const int japaneseCuisinePrice = 210;
  static const int chineseCuisinePrice = 290;
  static const int westernCuisinePrice = 320;
  late bool isJapaneseCuisine = false;
  late bool isChineseCuisine = false;
  late bool isWesternCuisine = false;
  int _count = 0;
  String _content = "";

  String getContent() {
    return _content;
  }

  void addContent(int price) {
    String content;
    switch (price) {
      case japaneseCuisinePrice:
        content = '${_count + 1}. 三色刺身 \$$price';
        break;
      case chineseCuisinePrice:
        content = '${_count + 1}. 酸菜白肉鍋 \$$price';
        break;
      case westernCuisinePrice:
        content = '${_count + 1}. 法式鴨胸 \$$price';
        break;
      default:
        throw Exception('not defined');
    }
    _count++;
    if (_content == '') {
      _content = _content + content;
    } else {
      _content = _content + '\n' + content;
    }
  }

  void clear() {
    _count = 0;
    _content = "";
  }
}
