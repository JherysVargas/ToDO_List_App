import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/config/theme/colors_theme.dart';
import 'package:todo/core/enums/task.dart';
import 'package:todo/core/helpers/task_status_extension.dart';
import 'package:todo/core/providers/tasks_cubit/tasks_cubit.dart';

import 'stream_list_task.dart';

const List<TaskStatus> _tabs = [
  TaskStatus.pending,
  TaskStatus.completed,
];

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              isScrollable: true,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              dividerColor: Colors.transparent,
              labelColor: ColorsAppTheme.secondary,
              unselectedLabelColor: ColorsAppTheme.content.shade300,
              indicatorColor: Colors.transparent,
              labelPadding: const EdgeInsets.only(right: 20),
              tabAlignment: TabAlignment.start,
              indicator: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: ColorsAppTheme.secondary,
                    width: 2,
                  ),
                ),
              ),
              tabs: List.generate(
                _tabs.length,
                (index) => Tab(text: _tabs[index].label),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  StreamListTask(
                    stream: context.read<TaskCubit>().getTask(),
                  ),
                  StreamListTask(
                    stream: context.read<TaskCubit>().getTask(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
