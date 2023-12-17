import 'package:flutter/material.dart';
import 'package:todo/config/theme/colors_theme.dart';
import 'package:todo/core/enums/task.dart';
import 'package:todo/core/helpers/capitalize_string_extension.dart';
import 'package:todo/domain/models/task/task.dart';

class ItemTaskContent extends StatefulWidget {
  const ItemTaskContent({super.key, required this.task});

  final TaskModel task;

  @override
  State<ItemTaskContent> createState() => _ItemTaskContentState();
}

class _ItemTaskContentState extends State<ItemTaskContent> {
  final ValueNotifier<bool> _showTranslation = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(55, 0, 10, 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSubTitle(),
          const SizedBox(height: 16),
          _buildButtonTranslate(),
          const SizedBox(height: 8),
          _buildTranslation(),
        ],
      ),
    );
  }

  Widget _buildSubTitle() {
    return Text(
      widget.task.description.capitalize(),
      style: TextStyle(
        color: ColorsAppTheme.content.shade500,
      ),
    );
  }

  Widget _buildButtonTranslate() {
    return ValueListenableBuilder<bool>(
      valueListenable: _showTranslation,
      builder: (context, value, child) {
        return value ? _buildTextTranslation('Traducción') : child!;
      },
      child: InkWell(
        child: _buildTextTranslation('Ver traducción'),
        onTap: () {
          _showTranslation.value = !_showTranslation.value;
        },
      ),
    );
  }

  Widget _buildTextTranslation(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 13,
        color: ColorsAppTheme.secondary,
      ),
    );
  }

  Widget _buildTranslation() {
    return ValueListenableBuilder<bool>(
      valueListenable: _showTranslation,
      builder: (context, value, child) {
        return Visibility(
          visible: value,
          maintainAnimation: true,
          maintainState: true,
          child: child!,
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.task.translation.title.capitalize(),
            style: TextStyle(
              fontSize: 16,
              decoration: widget.task.status == TaskStatus.completed
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              color: widget.task.status == TaskStatus.completed
                  ? ColorsAppTheme.secondary
                  : ColorsAppTheme.content,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.task.translation.description.capitalize(),
            style: TextStyle(
              color: ColorsAppTheme.content.shade500,
            ),
          ),
        ],
      ),
    );
  }
}
