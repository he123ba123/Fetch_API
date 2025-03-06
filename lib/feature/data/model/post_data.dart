import 'package:dio/dio.dart';
import 'package:fetch_api/feature/data/model/post_model.dart';

class PostData {
  Dio dio = Dio();
  Future<List<PostModel>> getPostData() async {
    var response = await dio.get('https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == 200) {
      return (response.data as List).map((e) => PostModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load Post');
    }
  }
}
