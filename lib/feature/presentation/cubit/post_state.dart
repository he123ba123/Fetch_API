import 'package:fetch_api/feature/data/model/post_model.dart';

abstract class PostState {}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostSuccess extends PostState {
  // returen list of posts as a post model type
  final List<PostModel> posts;
  PostSuccess({required this.posts});
}

class PostError extends PostState {
  final String errorMessage;
  PostError({required this.errorMessage});
}
