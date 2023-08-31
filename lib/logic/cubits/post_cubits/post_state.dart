import 'package:api_with_bloc/data/model/postModel.dart';

abstract class postState {}

class postLoadingState extends postState {}

class postLoadedState extends postState {
  //post load hone ke bad kuch data hoga.. toh usko yaha define karenge
  final List<PostModel> posts;
  postLoadedState(this.posts);
}

class postErrorState extends postState {
  final String error;
  postErrorState(this.error);
}
