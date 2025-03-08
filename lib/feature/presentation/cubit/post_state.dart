import 'package:fetch_api/feature/data/model/post_model.dart';
import 'package:equatable/equatable.dart';

class PostState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostSuccess extends PostState {
  // returen list of posts as a post model type
  final List<PostModel> posts;
  PostSuccess({required this.posts});
  @override
  List<Object?> get props => [posts];
}

class PostError extends PostState {
  final String errorMessage;
  PostError({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}

//  Equatable : A package for value comparison 
//  https://pub.dev/packages/equatable
//  use in state files to improve code readability 
//  improve preformance
//  avoid unnecessary rebuilds
//  avoid memory leaks
//  avoid bugs
//  improve testability
//  simplify code
//  simplify debugging