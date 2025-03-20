import 'package:equatable/equatable.dart';
import 'package:fetch_api/feature/data/model/post_model.dart';

sealed class PostStateCubit extends Equatable {
  
  @override
  List<Object?> get props => [];
}

final class PostInitialcubit extends PostStateCubit {}

class PostLoadingCubit extends PostStateCubit {}

class PostSuccessCubit extends PostStateCubit {
  // returen list of posts as a post model type
  final List<PostModel> posts;
  PostSuccessCubit({required this.posts});

  @override
  List<Object?> get props => [posts];
}

class PostErrorcubit extends PostStateCubit {
  final String errorMessage;
  PostErrorcubit({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
