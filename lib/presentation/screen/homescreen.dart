import 'package:api_with_bloc/logic/cubits/post_cubits/post_cubit.dart';
import 'package:api_with_bloc/logic/cubits/post_cubits/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/postModel.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Api Handling"),
      ),
      body: SafeArea(
          child: BlocConsumer<postCubit, postState>(listener: (context, state) {
        if (state is postErrorState) {
          SnackBar snackBar = SnackBar(
            content: Text(state.error),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }, builder: (context, state) {
        if (state is postLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is postLoadedState) {
          return buildPostListView(state.posts);
        }
        return Center(
          child: Text("an error occured!"),
        );
      })),
    );
  }

  Widget buildPostListView(List<PostModel> posts) {
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(child: Text("${index + 1}")),
            title: Text(posts[index].title.toString()),
            subtitle: Text(posts[index].body.toString()),
          );
        });
  }
}
