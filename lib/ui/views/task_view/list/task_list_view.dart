import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:todo/config/theme/colors_theme.dart';
import 'package:todo/ui/views/task_view/create/create_task_view.dart';

import 'widgets/custom_calendar.dart';
import 'widgets/sign_out_button.dart';
import 'widgets/task_list.dart';
import 'widgets/title_app_bar.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  void _onTap(BuildContext context) async {
    CupertinoScaffold.showCupertinoModalBottomSheet(
      context: context,
      builder: (context) => const CreateTaskView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const TitleAppBar(),
        centerTitle: false,
        actions: const [SignOutButton()],
        surfaceTintColor: Colors.transparent,
      ),
      body: const Padding(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            CustomCalendar(),
            SizedBox(height: 20),
            TaskList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onTap(context),
        backgroundColor: ColorsAppTheme.primary,
        child: const Icon(Icons.add, color: ColorsAppTheme.content),
      ),
    );
  }
}
