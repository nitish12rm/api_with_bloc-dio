import 'dart:developer';

import 'package:api_with_bloc/data/model/postModel.dart';
import 'package:api_with_bloc/logic/cubits/post_cubits/post_cubit.dart';
import 'package:api_with_bloc/presentation/screen/homescreen.dart';
import 'package:api_with_bloc/repository/postRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  postRepository postrepository = postRepository();
  List<PostModel> postmodel = await postrepository.fetchPosts();
  log(postmodel.toString());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => postCubit(),
      child: MaterialApp(
        home: homeScreen(),
      ),
    );
  }
}
