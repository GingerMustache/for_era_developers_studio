import 'package:mobx/mobx.dart';

class Article {
  static final Article _shared = Article._sharedInstance();
  Article._sharedInstance();
  factory Article() => _shared;

  final Observable<String> id = ''.obs();
  final Observable<String> title = ''.obs();
  final Observable<DateTime> publicationDate = Observable(DateTime.now());
  final Observable<String> imageUrl = ''.obs();
  final Observable<bool> readable = false.obs();
  final Observable<String?> description = Observable(null);
}
