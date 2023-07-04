class Article {
  String? bunny;

  Article(String bunny) {
    this.bunny = bunny;
  }

  Article.fromJson(Map json) {
    bunny = json["dizi_isim"];
  }
 
}