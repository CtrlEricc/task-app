import 'package:flutter/material.dart';
import 'package:task_app/ui/core/themes/colors.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final bool isCompleted;
  final Function(bool?) onToggleValue;
  final VoidCallback onDelete;
  const TaskTile({
    required this.title,
    required this.isCompleted,
    required this.onToggleValue,
    required this.onDelete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: Container(
        decoration: BoxDecoration(
          color: colorF3EFEE,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 12, top: 8, bottom: 8),
          child: Row(
            children: [
              Checkbox(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                side: BorderSide(color: color9F9F9F, width: 2),
                value: isCompleted,
                onChanged: onToggleValue,
              ),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: color121212,
                  ),
                ),
              ),
              IconButton(
                onPressed: onDelete,
                icon: Icon(
                  Icons.delete_outlined,
                  size: 22,
                  color: color8FACACAC,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
