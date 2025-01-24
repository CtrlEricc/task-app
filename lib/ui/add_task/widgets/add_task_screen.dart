import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/domain/enums/task_type_enum.dart';
import 'package:task_app/ui/add_task/view_model/add_task_viewmodel.dart';
import 'package:task_app/ui/core/widgets/custom_dropdown_form_field.dart';
import 'package:task_app/ui/core/widgets/custom_elevated_button.dart';
import 'package:task_app/ui/core/widgets/custom_text_form_field.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final addTaskViewModel = context.watch<AddTaskViewmodel>();

    return Scaffold(
      backgroundColor: const Color(0xFFF9F5F4),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F5F4),
        title: const Text(
          'Adicionar tarefa',
          style: TextStyle(
            color: Color(0xff121212),
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
      ),
      body: ListenableBuilder(
        listenable: addTaskViewModel,
        builder: (_, __) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(right: 16, left: 16, top: 25),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: 25,
                  children: [
                    CustomTextFormField(
                      hintText: 'Ex.: Regar plantas',
                      controller: addTaskViewModel.nameTextController,
                      validator: addTaskViewModel.validateField,
                    ),
                    CustomDropdownFormField<String>(
                      hintText: 'Categoria',
                      value: addTaskViewModel.selectedTaskType,
                      validator: addTaskViewModel.validateField,
                      items: TaskTypeEnum.values
                          .map(
                            (e) => DropdownMenuItem(value: e.name, child: Text(e.name)),
                          )
                          .toList(),
                      onChanged: (newValue) {
                        setState(() {
                          addTaskViewModel.selectedTaskType = newValue;
                        });
                      },
                    ),
                    CustomElevatedButton(
                      label: 'Salvar tarefa',
                      isLoading: addTaskViewModel.isLoading,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          addTaskViewModel.addTask(context);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
