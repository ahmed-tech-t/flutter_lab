import 'package:flutter/material.dart';

import 'package:flutter_application_1/feature/todo/data/repositories/todo_repository_impl.dart';
import 'package:flutter_application_1/feature/todo/ui/bloc/todo_list_bloc.dart';
import 'package:flutter_application_1/feature/todo/ui/widgets/todo_item_widget.dart';
import 'package:flutter_application_1/screens/common/widget_preview.dart';
import 'package:flutter_application_1/screens/navigation/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/route_manager.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Tasks'), centerTitle: true),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          Get.toNamed(AppRoutes.NEW_TASK);
        },
        icon: const Icon(Icons.add, color: Colors.white),
        label: Text(
          'Add Task',
          style: TextStyle(
            fontSize: 16,
            color: context
                .theme
                .colorScheme
                .onSurface, // Use the onSurface color from the theme
          ),
        ),
      ),
      body: BlocBuilder<TodoListBloc, TodoListState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is Error) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          if (state is Success) {
            if (state.items.isEmpty) {
              return Center(
                child: Text(
                  'No tasks yet! Add one below.',
                  style: TextStyle(
                    fontSize: 16,
                    color: context.theme.colorScheme.onSurface,
                  ),
                ),
              );
            }

            return ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                final todo = state.items[index];
                return TodoItemWidget(
                  todo: todo,
                  onTap: () {
                    // Navigate or select task
                  },
                );
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

// --- PREVIEW ---
void main() {
  runApp(
    WidgetPreview(
      title: 'TodoListScreen Preview',
      child: BlocProvider(
        create: (context) => TodoListBloc(TodoRepositoryImpl()),
        child: const TodoListScreen(),
      ),
    ),
  );
}
