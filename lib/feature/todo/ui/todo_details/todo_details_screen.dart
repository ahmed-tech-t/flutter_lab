import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_spacing.dart';
import 'package:flutter_application_1/feature/todo/data/repositories/todo_repository_impl.dart';
import 'package:flutter_application_1/feature/todo/domain/models/todo.dart';
import 'package:flutter_application_1/feature/todo/domain/models/todo_status.dart';
import 'package:flutter_application_1/feature/todo/ui/todo_details/bloc/todo_details_cubit.dart';
import 'package:flutter_application_1/feature/todo/ui/widgets/completed_badge.dart';
import 'package:flutter_application_1/feature/todo/ui/widgets/due_date_picker_tile.dart';
import 'package:flutter_application_1/feature/todo/ui/widgets/primary_action_button.dart';
import 'package:flutter_application_1/feature/todo/ui/widgets/section_header.dart';
import 'package:flutter_application_1/feature/todo/ui/widgets/status_widget.dart';
import 'package:flutter_application_1/feature/todo/ui/widgets/todo_decorations.dart';
import 'package:flutter_application_1/screens/common/app_snack_bar.dart';
import 'package:flutter_application_1/screens/common/widget_preview.dart';
import 'package:flutter_application_1/screens/navigation/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class TodoDetailsScreen extends StatelessWidget {
  const TodoDetailsScreen({super.key});

  Future<void> _confirmDelete(BuildContext context, TodoDetailsCubit cubit) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color.fromARGB(255, 26, 14, 74),
        title: const Text('Delete Task', style: TextStyle(color: Colors.white)),
        content: const Text(
          'Are you sure you want to delete this task? This action cannot be undone.',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel', style: TextStyle(color: Colors.white70)),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Delete', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      cubit.deleteTodo();
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TodoDetailsCubit>();

    return BlocConsumer<TodoDetailsCubit, TodoDetailsState>(
      listenWhen: (previous, current) =>
          previous.status != current.status || previous.isDeleted != current.isDeleted,
      listener: (context, state) {
        if (state.isDeleted) {
          AppSnackBar.showSuccess(context, state.successMessage ?? 'Task deleted successfully!');
          Get.back();
        } else if (state.status.isSuccess && state.successMessage != null) {
          AppSnackBar.showSuccess(context, state.successMessage!);
        } else if (state.status.isFailure && state.errorMessage != null) {
          AppSnackBar.showError(context, state.errorMessage!);
        }
      },
      builder: (context, state) {
        final todo = state.todo;
        final isComplete = todo.status.isComplete;
        final isLoading = state.status.isLoading;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Task Details'),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Get.back(),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.edit_outlined, color: Colors.blueAccent),
                tooltip: 'Edit Task',
                onPressed: isLoading
                    ? null
                    : () async {
                        final updated = await Get.toNamed(
                          AppRoutes.todoEdit(todo.id.toString()),
                          arguments: todo,
                        );
                        if (updated is Todo && context.mounted) {
                          cubit.updateTodoLocally(updated);
                        }
                      },
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                tooltip: 'Delete Task',
                onPressed: isLoading ? null : () => _confirmDelete(context, cubit),
              ),
            ],
            ),
            body: SingleChildScrollView(
              padding: AppSpacing.screenPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppSpacing.lg),

                  // Priority & Status Row
                  Row(
                    children: [
                      StatusWidget(status: todo.status),
                      const SizedBox(width: AppSpacing.sm),
                      if (isComplete) const CompletedBadge(),
                    ],
                  ),

                  const SizedBox(height: AppSpacing.lg),

                  // Task Title
                  Text(
                    todo.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          decoration: isComplete ? TextDecoration.lineThrough : null,
                        ),
                  ),

                  const SizedBox(height: AppSpacing.lg),

                  // Due Date Tile
                  DueDatePickerTile(
                    selectedDate: todo.date,
                    enabled: false,
                  ),

                  const SizedBox(height: AppSpacing.xl),

                  // Description Section
                  const SectionHeader('Description'),
                  Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(minHeight: 120),
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    decoration: TodoDecorations.cardDecoration(),
                    child: Text(
                      todo.body.isEmpty ? 'No description provided.' : todo.body,
                      style: TextStyle(
                        fontSize: 15,
                        color: todo.body.isEmpty ? Colors.white38 : Colors.white70,
                        height: 1.5,
                      ),
                    ),
                  ),

                  const SizedBox(height: AppSpacing.xxl),

                  // Toggle Complete Action Button
                  PrimaryActionButton(
                    text: isComplete ? 'Mark as Incomplete' : 'Mark as Completed',
                    icon: isComplete ? Icons.undo : Icons.check_circle_outline,
                    backgroundColor: isComplete ? Colors.grey.shade700 : Colors.blueAccent,
                    isLoading: isLoading,
                    onPressed: cubit.toggleCompletion,
                  ),
                ],
              ),
            ),
          );
        },
      );
  }
}

// Preview
void main() {
  final sampleTodo = Todo(
    id: 1,
    title: 'Complete Flutter Lab',
    body: 'Implement Clean Architecture, Cubit state management, and reusable dark theme UI components.',
    status: Medium(),
    date: DateTime.now(),
  );

  runApp(
    WidgetPreview(
      title: 'TodoDetailsScreen Preview',
      child: BlocProvider(
        create: (_) => TodoDetailsCubit(
          todo: sampleTodo,
          repository: TodoRepositoryImpl(),
        ),
        child: const TodoDetailsScreen(),
      ),
    ),
  );
}
