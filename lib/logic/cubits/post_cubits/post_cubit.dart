import 'package:api_with_bloc/data/model/postModel.dart';
import 'package:api_with_bloc/logic/cubits/post_cubits/post_state.dart';
import 'package:api_with_bloc/repository/postRepository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class postCubit extends Cubit<postState> {
  postCubit() : super(postLoadingState()) {
    fetchPosts();
  }
  postRepository postrepository = postRepository();

  void fetchPosts() async {
    try {
      List<PostModel> posts = await postrepository.fetchPosts();
      emit(postLoadedState(posts));
    } on DioException catch (ex) {
      emit(postErrorState(ex.type.toString()));
    }
  }
}
