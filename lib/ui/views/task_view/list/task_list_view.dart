import 'package:flutter/material.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:todo/config/theme/colors_theme.dart';

import 'widgets/custom_calendar.dart';
import 'widgets/sign_out_button.dart';
import 'widgets/task_list.dart';
import 'widgets/title_app_bar.dart';

class TaskListView extends StatefulWidget {
  const TaskListView({super.key});

  @override
  State<TaskListView> createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {
  final Duration animationDuration = const Duration(milliseconds: 300);

  final Duration delay = const Duration(milliseconds: 50);

  GlobalKey<RectGetterState> rectGetterKey = RectGetter.createGlobalKey();

  final ValueNotifier<Rect?> rect = ValueNotifier(null);

  void _onTap() async {
    rect.value = RectGetter.getRectFromKey(rectGetterKey);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      rect.value =
          rect.value?.inflate(1.3 * MediaQuery.of(context).size.longestSide);
      Future.delayed(animationDuration + delay, _goToNextPage);
    });
  }

  void _goToNextPage() {
    Navigator.of(context)
        .pushNamed('createTask')
        .then((_) => rect.value = null);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
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
            key: rectGetterKey,
            onPressed: _onTap,
            backgroundColor: ColorsAppTheme.primary,
            child: const Icon(Icons.add, color: ColorsAppTheme.content),
          ),
        ),
        _ripple(),
      ],
    );
  }

  Widget _ripple() {
    return ValueListenableBuilder(
      valueListenable: rect,
      builder: (context, Rect? rect, child) {
        if (rect == null) {
          return const SizedBox();
        }

        return AnimatedPositioned.fromRect(
          rect: rect,
          duration: animationDuration,
          child: child!,
        );
      },
      child: const DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ColorsAppTheme.primary,
        ),
      ),
    );
  }
}
