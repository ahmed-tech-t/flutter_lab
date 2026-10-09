import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_spacing.dart';
import 'package:flutter_application_1/feature/todo/data/repositories/todo_repository_impl.dart';
import 'package:flutter_application_1/feature/todo/ui/add_task/bloc/add_task_cubit.dart';
import 'package:flutter_application_1/feature/todo/ui/add_task/bloc/add_task_state.dart';
import 'package:flutter_application_1/feature/todo/ui/add_task/widgets/priority_selector_widget.dart';
import 'package:flutter_application_1/screens/common/widget_preview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  Future<void> _pickDate(BuildContext context, AddTaskCubit cubit, DateTime currentDate) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),
    );
    if (picked != null) {
      cubit.updateDate(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddTaskCubit>();

    return BlocConsumer<AddTaskCubit, AddTaskState>(
      listenWhen: (previous, current) => previous.submissionStatus != current.submissionStatus,
      listener: (context, state) {
        if (state.submissionStatus == TaskSubmissionStatus.success) {
          Get.back(result: true);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Task added successfully!'),
              backgroundColor: Colors.green,
            ),
          );
        } else if (state.submissionStatus == TaskSubmissionStatus.failure && state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage!),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state.submissionStatus == TaskSubmissionStatus.loading;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Add New Task'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            padding: AppSpacing.screenPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppSpacing.lg),

                // Title Input
                Text(
                  'Task Title',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: AppSpacing.xs),
                TextFormField(
                  initialValue: state.title,
                  onChanged: cubit.updateTitle,
                  enabled: !isLoading,
                  decoration: InputDecoration(
                    hintText: 'e.g. Complete Flutter lab',
                    filled: true,
                    fillColor: Colors.white.withAlpha(20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppSpacing.md),
                    ),
                  ),
                ),

                const SizedBox(height: AppSpacing.lg),

                // Description Input
                Text(
                  'Description',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: AppSpacing.xs),
                TextFormField(
                  initialValue: state.body,
                  onChanged: cubit.updateBody,
                  enabled: !isLoading,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Add details about this task...',
                    filled: true,
                    fillColor: Colors.white.withAlpha(20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppSpacing.md),
                    ),
                  ),
                ),

                const SizedBox(height: AppSpacing.lg),

                // Priority Selector
                Text(
                  'Priority',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: AppSpacing.sm),
                PrioritySelectorWidget(
                  selectedStatus: state.status,
                  onStatusSelected: cubit.updateStatus,
                ),

                const SizedBox(height: AppSpacing.lg),

                // Due Date Tile
                Text(
                  'Due Date',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: AppSpacing.xs),
                InkWell(
                  onTap: isLoading ? null : () => _pickDate(context, cubit, state.date),
                  borderRadius: BorderRadius.circular(AppSpacing.md),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.md),
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(20),
                      borderRadius: BorderRadius.circular(AppSpacing.md),
                      border: Border.all(color: Colors.grey.shade400, width: 0.8),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_today, size: 20),
                        const SizedBox(width: AppSpacing.md),
                        Text(
                          DateFormat('dd/MM/yyyy').format(state.date),
                          style: const TextStyle(fontSize: 16),
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: AppSpacing.xxl),

                // Submit Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : cubit.submitTask,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSpacing.md),
                      ),
                    ),
                    child: isLoading
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(strokeWidth: 2.5),
                          )
                        : const Text(
                            'Save Task',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                  ),
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
      title: 'Add Task Screen Preview',
      child: BlocProvider(
        create: (context) => AddTaskCubit(TodoRepositoryImpl()),
        child: const AddTaskScreen(),
      ),
    ),
  );
}
