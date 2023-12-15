import 'package:flutter/material.dart';
import 'package:todo/config/theme/colors_theme.dart';
import 'package:todo/core/enums/task.dart';
import 'package:todo/core/helpers/task_status_extension.dart';

class TabsFilter extends StatelessWidget {
  const TabsFilter({super.key, required this.tabs});

  final List<TaskStatus> tabs;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
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
      tabs: [
        const Tab(text: 'Todas'),
        ...List.generate(
          tabs.length,
          (index) => Tab(text: tabs[index].label),
        )
      ],
    );
  }
}
