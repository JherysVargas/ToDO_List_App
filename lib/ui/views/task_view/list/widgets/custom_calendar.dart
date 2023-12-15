import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo/config/theme/colors_theme.dart';
import 'package:todo/core/providers/tasks_cubit/tasks_cubit.dart';

const double _kHeightItemCalendar = 62;

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({super.key});

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  CalendarFormat _calendarFormat = CalendarFormat.week;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocSelector<TaskCubit, TasksState, DateTime?>(
          selector: (state) {
            return state.selectedDate;
          },
          builder: (context, selectedDate) {
            return TableCalendar(
              rowHeight: _kHeightItemCalendar,
              focusedDay: selectedDate ?? DateTime.now(),
              firstDay: DateTime.now(),
              lastDay: _getMaxDate(),
              onPageChanged: (focusedDay) {
                context.read<TaskCubit>().changeMonth(focusedDay);
              },
              onFormatChanged: (format) =>
                  setState(() => _calendarFormat = format),
              calendarFormat: _calendarFormat,
              headerVisible: false,
              daysOfWeekVisible: false,
              availableCalendarFormats: const {
                CalendarFormat.month: 'Month',
                CalendarFormat.week: 'Week',
              },
              selectedDayPredicate: (day) {
                return isSameDay(selectedDate, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _calendarFormat = CalendarFormat.week;
                });
                context.read<TaskCubit>().selectedDate(selectedDay);
              },
              calendarBuilders: CalendarBuilders(
                todayBuilder: (context, day, focusedDay) {
                  return _buildItemCalendar(
                    date: day,
                    color: isSameDay(day, (selectedDate ?? focusedDay))
                        ? ColorsAppTheme.primary
                        : ColorsAppTheme.grey.shade300,
                  );
                },
                defaultBuilder: (context, day, focusedDay) {
                  return _buildItemCalendar(
                    date: day,
                  );
                },
                selectedBuilder: (context, day, focusedDay) {
                  return _buildItemCalendar(
                    date: day,
                    color: ColorsAppTheme.primary,
                  );
                },
                outsideBuilder: (context, day, focusedDay) {
                  return _buildDisabledItemCalendar(
                    date: day,
                  );
                },
                disabledBuilder: (context, day, focusedDay) {
                  return _buildDisabledItemCalendar(
                    date: day,
                  );
                },
              ),
            );
          },
        ),
        const SizedBox(height: 10),
        _buildSeparator()
      ],
    );
  }

  DateTime _getMaxDate() {
    final currentDate = DateTime.now();

    return Jiffy.parseFromDateTime(
      DateTime(currentDate.year, currentDate.month + 1, 0),
    ).add(months: 1).dateTime;
  }

  Widget _buildSeparator() {
    return SizedBox(
      height: 5,
      width: 30,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: ColorsAppTheme.content.shade100,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );
  }

  Widget _buildItemCalendar({
    required DateTime date,
    Color color = Colors.white,
    TextStyle? textStyle,
  }) {
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(5),
      height: _kHeightItemCalendar,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            Jiffy.parseFromDateTime(date).E,
            style: const TextStyle(
              fontSize: 12,
              color: ColorsAppTheme.content,
            ).merge(textStyle),
          ),
          Text(
            Jiffy.parseFromDateTime(date).date.toString(),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: ColorsAppTheme.content,
            ).merge(textStyle),
          ),
        ],
      ),
    );
  }

  Widget _buildDisabledItemCalendar({
    required DateTime date,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Jiffy.parseFromDateTime(date).E,
          style: TextStyle(
            fontSize: 12,
            color: ColorsAppTheme.content.shade100,
          ),
        ),
        Text(
          Jiffy.parseFromDateTime(date).date.toString(),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: ColorsAppTheme.content.shade100,
          ),
        ),
      ],
    );
  }
}
