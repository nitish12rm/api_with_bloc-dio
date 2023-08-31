//repository remote data ko fetch karta hai
import 'package:api_with_bloc/data/model/postModel.dart';
import 'package:api_with_bloc/repository/api/api.dart';
import 'package:dio/dio.dart';

class postRepository {
  API api = API();
  Future<List<PostModel>> fetchPosts() async {
    try {
      Response response = await api.sendRequest.get("/posts");
      //jo data aari h wo ek list hai so...
      List<dynamic> postMap = response.data;
      //ab hme har ek map ko post model me convert karna hai.
      return postMap.map((postmap) => PostModel.fromJson(postmap)).toList();
    } catch (ex) {
      throw ex;
    }
  }
}
