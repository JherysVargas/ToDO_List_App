import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';
import 'package:time_picker_spinner_pop_up/time_picker_spinner_pop_up.dart';
import 'package:todo/core/providers/tasks_cubit/tasks_cubit.dart';
import 'package:todo/domain/models/task/task.dart';
import 'package:todo/ui/widgets/activity_indicator.dart';
import 'package:todo/ui/widgets/custom_button.dart';
import 'package:todo/ui/widgets/text_form_input.dart';

const String patternDate = 'dd/MM/yyyy';

class FormCreateTask extends StatefulWidget {
  const FormCreateTask({super.key});

  @override
  State<FormCreateTask> createState() => _FormCreateTaskState();
}

class _FormCreateTaskState extends State<FormCreateTask> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _dateController;
  late final TimePickerSpinnerController _timePickerSpinnerController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _timePickerSpinnerController = TimePickerSpinnerController();
  }

  @override
  void dispose() {
    _dateController.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    _timePickerSpinnerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentDate = DateTime.now();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormInput(
            controller: _titleController,
            hintText: 'Título',
            textInputAction: TextInputAction.done,
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'El títutlo es obligatorio';
              }
              return null;
            },
          ),
          const SizedBox(height: 40),
          TextFormInput(
            controller: _descriptionController,
            hintText: 'Descripción',
            textInputAction: TextInputAction.done,
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'La descripción es obligatoria';
              }
              return null;
            },
          ),
          const SizedBox(height: 40),
          TimePickerSpinnerPopUp(
            controller: _timePickerSpinnerController,
            mode: CupertinoDatePickerMode.date,
            initTime: currentDate,
            minTime: currentDate,
            maxTime: _getMaxDate(),
            barrierColor: Colors.black12, //Barrier Color when pop up show
            minuteInterval: 1,
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
            cancelText: 'Cancel',
            confirmText: 'OK',
            pressType: PressType.singlePress,
            timeFormat: patternDate,
            timeWidgetBuilder: (time) {
              return GestureDetector(
                onTap: () {
                  _unFocus();
                  _timePickerSpinnerController.showMenu();
                },
                child: AbsorbPointer(
                  child: TextFormInput(
                    controller: _dateController,
                    hintText: 'Fecha',
                    textInputAction: TextInputAction.done,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'La descripción es obligatoria';
                      }
                      return null;
                    },
                  ),
                ),
              );
            },
            onChange: (dateTime) {
              _dateController.text = Jiffy.parseFromDateTime(dateTime)
                  .format(pattern: patternDate);
            },
          ),
          const SizedBox(height: 60),
          BlocSelector<TaskCubit, TasksState, TasksStatus>(
            selector: (state) => state.status,
            builder: (_, status) {
              if (status == TasksStatus.loading) {
                return const ActivityIndicator();
              }
              return _buildButton();
            },
          ),
        ],
      ),
    );
  }

  DateTime _getMaxDate() {
    final currentDate = DateTime.now();

    return Jiffy.parseFromDateTime(
      DateTime(currentDate.year, currentDate.month + 1, 0),
    ).add(months: 1).dateTime;
  }

  bool _enabledButton() {
    return _titleController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty &&
        _dateController.text.isNotEmpty;
  }

  Widget _buildButton() {
    return ListenableBuilder(
      listenable: Listenable.merge([
        _titleController,
        _descriptionController,
        _dateController,
      ]),
      builder: (_, __) {
        return CustomButtom(
          label: 'Guardar',
          onPressed: _enabledButton() ? _login : null,
        );
      },
    );
  }

  void _unFocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void _login() {
    _unFocus();
    if (_formKey.currentState!.validate()) {
      final task = TaskModel(
        title: _titleController.text,
        description: _descriptionController.text,
        date: Jiffy.parse(_dateController.text, pattern: patternDate).dateTime,
        createdAt: Timestamp.now().toDate(),
      );

      context.read<TaskCubit>().createTask(task);
    }
  }
}
