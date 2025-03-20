import 'package:fetch_api/feature/data/model/post_data.dart';
import 'package:fetch_api/feature/presentation/Bloc/post_event.dart';
import 'package:fetch_api/feature/presentation/Bloc/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvent, PostStateBloc> {
  PostBloc() : super(PostInitialBloc()) {
    on<FetchDataEvent>((event, emit) async {
      emit(PostLoadingBloc());
      try {
        var posts = await PostData().getPostData();
        emit(PostSuccessBloc(posts: posts));
      } catch (e) {
        emit(PostErrorBloc(errorMessage: e.toString()));
      }
    });
  }
}

//---------------------------------
// class PostCubit extends Bloc<PostEvent, PostState> {
//   PostCubit() : super(PostInitial());
//   Future fetchDataCubit() async {
//     emit(PostLoading());
//     try {
//       var posts = await PostData().getPostData();
//       emit(PostSuccess(posts: posts));
//     } catch (e) {
//       emit(PostError( errorMessage: e.toString()));
//     }
//   }
// }
