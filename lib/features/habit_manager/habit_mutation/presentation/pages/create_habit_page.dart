import 'package:daily_win/features/habit_manager/habit_mutation/presentation/widgets/category_picker.dart';
import 'package:daily_win/features/habit_manager/habit_mutation/presentation/widgets/color_picker.dart';
import 'package:daily_win/features/habit_manager/habit_mutation/presentation/widgets/reminder.dart';
import 'package:daily_win/features/habit_manager/habit_mutation/presentation/widgets/target_initializer.dart';
import 'package:flutter/material.dart';

class CreateHabitPage extends StatefulWidget {
  const CreateHabitPage({super.key});

  @override
  State<CreateHabitPage> createState() => _CreateHabitPageState();
}

class _CreateHabitPageState extends State<CreateHabitPage> {
  final _formKey = GlobalKey<FormState>();
  final bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          'Create Custom Habit',
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Habit Name Text Field
                      Text(
                        "Name",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextFormField(initialValue: "", onChanged: (value) {}),
                      const SizedBox(height: 20.0),
                      // Color Picker
                      Text(
                        "Color",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ColorPicker(),
                      const SizedBox(height: 20.0),
                      CategoryPicker(),
                      const SizedBox(height: 20.0),
                      // Habit Target
                      Text(
                        "Target",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TargetInitializer(),
                      Text(
                        "Reminders",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Reminder(),
                      FilledButton(
                        onPressed: () {},
                        style: FilledButton.styleFrom(
                          fixedSize: Size(345.0, 36.0),
                          // padding: const EdgeInsets.symmetric(vertical: 8.0),
                          backgroundColor: Colors.white,
                        ),
                        child: const Text('Add Reminder', style: TextStyle(color: Colors.black),),
                      ),
                      TextFormField(
                        onChanged: (value) {},
                        minLines: 1,
                        maxLines: 4,
                        decoration: InputDecoration(
                          label: Text("Description (Optional)"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            FilledButton(
              onPressed: isLoading ? null : () {},
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }
}
