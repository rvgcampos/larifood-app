import 'package:larifood_app/app/data/providers/api.dart';

class CommentApi extends Api {
  Future<dynamic> addComment(String id, Map<String, dynamic> map) async {
    var response = errorHandler(await post('/recipes/$id/comment', map));

    return response.body;
  }

  Future<dynamic> updateComment(
      String recipeId, String commentId, Map<String, dynamic> map) async {
    var response =
        errorHandler(await post('/recipes/$recipeId/comment/$commentId', map));

    return response.body;
  }

  Future<dynamic> deleteComment(
      String recipeId, String commentId) async {
    var response =
        errorHandler(await delete('/recipes/$recipeId/comment/$commentId'));

    return response.body;
  }

  Future<dynamic> likeComment(
      String recipeId, String commentId, Map<String, dynamic> map) async {
    var response = errorHandler(
        await post('/recipes/$recipeId/comment/$commentId/like', map));

    return response.body;
  }
}
