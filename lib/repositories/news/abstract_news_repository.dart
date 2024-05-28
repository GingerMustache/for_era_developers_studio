abstract class AbstractNewsRepository {
  Future<List<Map<String, dynamic>>> getLatestArticles();
  Future<List<Map<String, dynamic>>> getFeaturedArticles();
  Future<dynamic> getArticle(String id);
}
