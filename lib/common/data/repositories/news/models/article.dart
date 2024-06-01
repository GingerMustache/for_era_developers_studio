class Article {
  Article({
    required this.id,
    required this.title,
    required this.publicationDate,
    required this.imageUrl,
    required this.haveRead,
    this.description,
  });

  final String id;
  final String title;
  final DateTime publicationDate;
  final String imageUrl;
  bool haveRead;
  final String? description;
}
