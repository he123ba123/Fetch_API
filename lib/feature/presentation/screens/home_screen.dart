import 'package:fetch_api/feature/presentation/cubit/post_cubit.dart';
import 'package:fetch_api/feature/presentation/cubit/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostCubit()..fetchDataCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
        ),
        body: BlocConsumer<PostCubit, PostStateCubit>(
          listener: (BuildContext context, state) {
            if (state is PostErrorcubit) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }else if (state is PostSuccessCubit) { {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("The data is fetched")));
            }
          }},
          builder: (context, state) {
            if (state is PostLoadingCubit) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PostErrorcubit) {
              return Center(child: Text(state.errorMessage));
            } else if (state is PostSuccessCubit) {
              return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.posts[index].title),
                    subtitle: Text(state.posts[index].body),
                  );
                },
              );
            }
            return Container();
          },
        ),
        // floatingActionButton: FloatingActionButton(onPressed: () {
        //   context.read<PostCubit>().add(FetchDataEvent());
        // }),
      ),
    );
  }
}
