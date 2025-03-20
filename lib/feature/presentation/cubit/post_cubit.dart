import 'package:fetch_api/feature/data/model/post_data.dart';
import 'package:fetch_api/feature/data/model/post_model.dart';
import 'package:fetch_api/feature/presentation/cubit/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class PostCubit extends HydratedCubit<PostStateCubit> {
  PostCubit() : super(PostInitialcubit());

  Future fetchDataCubit() async {
    emit(PostLoadingCubit());
    try {
      var posts = await PostData().getPostData();
      emit(PostSuccessCubit(posts: posts));
    } catch (e) {
      emit(PostErrorcubit(errorMessage: e.toString()));
    }
  }

  // Convert JSON to List<PostModel> when restoring state
  @override
  PostStateCubit? fromJson(Map<String, dynamic> json) {
    if (json['posts'] == null) return null;
    return PostSuccessCubit(
        posts:
            (json['posts'] as List).map((e) => PostModel.fromJson(e)).toList());
  }

  // Convert List<PostModel> to JSON before saving state
  @override
  Map<String, dynamic>? toJson(PostStateCubit state) {
    if (state is PostSuccessCubit) {
      return {'posts': state.posts.map((post) => post.toJson()).toList()};
    } else {
      return null;
    }
  }
    // @override
  // List<PostModel>? fromJson(Map<String, dynamic> json) {
  //   return PostModel.listFromJson(json['posts'] as List<dynamic>);
  // }

  //-----------------------------------------------------------
  // @override
  // Map<String, dynamic>? toJson(List<PostModel> state) {
  //   return {'posts': PostModel.listToJson(state)};
  // }
}
