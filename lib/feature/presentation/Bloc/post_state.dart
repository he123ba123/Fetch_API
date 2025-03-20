import 'package:fetch_api/feature/data/model/post_model.dart';
import 'package:equatable/equatable.dart';

sealed class PostStateBloc extends Equatable {
  @override
  List<Object?> get props => [];
}

class PostInitialBloc extends PostStateBloc {}

class PostLoadingBloc extends PostStateBloc {}

class PostSuccessBloc extends PostStateBloc {
  // returen list of posts as a post model type
  final List<PostModel> posts;
  PostSuccessBloc({required this.posts});
  @override
  List<Object?> get props => [posts];
}

class PostErrorBloc extends PostStateBloc {
  final String errorMessage;
  PostErrorBloc({required this.errorMessage});
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