import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/status.dart';
import '../bloc/task_bloc.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state.status == LoadingStatus.pure) {
            context.read<TaskBloc>().add(LoadingTask());
          } else if (state.status == LoadingStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status == LoadingStatus.loadedWithFailure) {
            return const Center(
              child: Text("error"),
            );
          }
          return ListView.builder(
              itemCount: state.tasklist.length,
              itemBuilder: (_, index) {
                return Text(state.tasklist[index].title);
              });
        },
      ),
    );
  }
}
