import 'package:flutter/material.dart';
import 'package:todo/core/enums/task.dart';

import 'tabs_filters.dart';
import 'tabs_list_data.dart';

const List<TaskStatus> _tabs = [
  TaskStatus.pending,
  TaskStatus.completed,
];

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: DefaultTabController(
          length: _tabs.length + 1,
          child: const Column(
            children: [
              TabsFilter(tabs: _tabs),
              TabsListData(),
            ],
          ),
        ),
      ),
    );
  }
}
