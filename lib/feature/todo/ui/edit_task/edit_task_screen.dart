import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_spacing.dart';
import 'package:flutter_application_1/feature/todo/data/repositories/todo_repository_impl.dart';
import 'package:flutter_application_1/feature/todo/domain/models/todo.dart';
import 'package:flutter_application_1/feature/todo/domain/models/todo_status.dart';
import 'package:flutter_application_1/feature/todo/ui/edit_task/bloc/edit_task_cubit.dart';
import 'package:flutter_application_1/feature/todo/ui/widgets/due_date_picker_tile.dart';
import 'package:flutter_application_1/feature/todo/ui/widgets/priority_selector_widget.dart';
import 'package:flutter_application_1/screens/common/app_snack_bar.dart';
import 'package:flutter_application_1/screens/common/custom_text_form_field.dart';
import 'package:flutter_application_1/screens/common/primary_action_button.dart';
import 'package:flutter_application_1/screens/common/section_header.dart';
import 'package:flutter_application_1/screens/common/widget_preview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class EditTaskScreen extends StatelessWidget {
  const EditTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<EditTaskCubit>();

    return BlocConsumer<EditTaskCubit, EditTaskState>(
      listenWhen: (previous, current) =>
          previous.submissionStatus != current.submissionStatus,
      listener: (context, state) {
        if (state.submissionStatus.isSuccess) {
          Get.back(result: state.updatedTodo);
          AppSnackBar.showSuccess(context, 'Task updated successfully!');
        } else if (state.submissionStatus.isFailure &&
            state.errorMessage != null) {
          AppSnackBar.showError(context, state.errorMessage!);
        }
      },
      builder: (context, state) {
        final isLoading = state.submissionStatus.isLoading;

        return Scaffold(
          appBar: AppBar(title: const Text('Edit Task'), centerTitle: true),
          body: SingleChildScrollView(
            padding: AppSpacing.screenPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppSpacing.lg),

                // Title Input
                CustomTextFormField(
                  label: 'Task Title',
                  initialValue: state.title,
                  onChanged: cubit.updateTitle,
                  enabled: !isLoading,
                  hintText: 'e.g. Complete Flutter lab',
                ),

                const SizedBox(height: AppSpacing.lg),

                // Description Input
                CustomTextFormField(
                  label: 'Description',
                  initialValue: state.body,
                  onChanged: cubit.updateBody,
                  enabled: !isLoading,
                  maxLines: 3,
                  hintText: 'Add details about this task...',
                ),

                const SizedBox(height: AppSpacing.lg),

                // Priority Selector
                const SectionHeader('Priority'),
                PrioritySelectorWidget(
                  selectedStatus: state.status,
                  onStatusSelected: cubit.updateStatus,
                ),

                const SizedBox(height: AppSpacing.lg),

                // Due Date Tile
                const SectionHeader('Due Date'),
                DueDatePickerTile(
                  selectedDate: state.date,
                  onDateChanged: cubit.updateDate,
                  enabled: !isLoading,
                ),

                const SizedBox(height: AppSpacing.xxl),

                // Submit Button
                PrimaryActionButton(
                  text: 'Save Changes',
                  isLoading: isLoading,
                  onPressed: cubit.saveChanges,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// --- PREVIEW ---
void main() {
  runApp(
    WidgetPreview(
      title: 'Edit Task Screen Preview',
      child: BlocProvider(
        create: (context) => EditTaskCubit(
          initialTodo: Todo(
            id: 1,
            title: 'Sample Task to Edit',
            body: 'Here is the description being modified.',
            status: Medium(),
            date: DateTime.now().add(const Duration(days: 2)),
          ),
          repository: TodoRepositoryImpl(),
        ),
        child: const EditTaskScreen(),
      ),
    ),
  );
}
