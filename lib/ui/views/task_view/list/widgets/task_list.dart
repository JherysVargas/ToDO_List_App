import 'package:flutter/material.dart';
import 'package:todo/config/theme/colors_theme.dart';
import 'package:todo/core/enums/task.dart';
import 'package:todo/domain/models/task/task.dart';

import 'item_task.dart';

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
    _tabController = TabController(length: 2, vsync: this);
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
              tabs: const [
                Tab(
                  text: 'Pendientes',
                ),
                Tab(
                  text: 'Completados',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.separated(
                    itemCount: 10,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 20,
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 20),
                    itemBuilder: (context, index) {
                      final task = TaskModel(
                        title: 'Title',
                        description: 'Description',
                        status: index.isEven
                            ? TaskStatus.completed
                            : TaskStatus.pending,
                      );

                      return ItemTask(task: task);
                    },
                  ),
                  ListView.separated(
                    itemCount: 10,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 20,
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 20),
                    itemBuilder: (context, index) {
                      final task = TaskModel(
                        title: 'Title',
                        description: 'Description',
                        status: index.isEven
                            ? TaskStatus.completed
                            : TaskStatus.pending,
                      );

                      return ItemTask(task: task);
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
