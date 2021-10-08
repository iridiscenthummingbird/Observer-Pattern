void main() {
  News magazine = News();
  Subscriber ivan = Subscriber();
  Subscriber eric = Subscriber();
  magazine.register(ivan);
  magazine.register(eric);
  magazine.setNews("Wow");
  magazine.unregister(ivan);
  magazine.setNews("Second news");
}

class News {
  String? _news;
  List<Subscriber>? _subs;

  News({String news = ''}) {
    _news = news;
    _subs = [];
  }
  setNews(String text) {
    _news = text;
    notifyAll();
  }

  notifyAll() {
    for (Subscriber sub in _subs!) {
      sub.inform(this);
    }
  }

  register(Subscriber sub) {
    _subs!.add(sub);
  }

  unregister(Subscriber sub) {
    _subs!.removeWhere((element) => element == sub);
  }
}

class Subscriber {
  inform(News message) {
    print('Subsriber has been informed about: ${message._news}.');
  }
}
