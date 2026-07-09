import 'package:flutter/material.dart';

class UserProfileForm extends StatelessWidget {
  const UserProfileForm({super.key});

  final bool _obscurePassword = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsGeometry.all(20.0),
      child: Form(
        // key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Username Text Field
                Text("Username",
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  // controller: _emailController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    label: Text(
                      'Enter your username',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondaryFixedDim,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),

                //   Birth Date Text Field
                Text(
                  "Birth Date",
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  // controller: _emailController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    label: Text(
                      'yyyy/mm/dd',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondaryFixedDim,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                // CalendarDatePicker(
                //   initialDate: null,
                //   firstDate: DateTime(1900),
                //   lastDate: DateTime.now(),
                //   onDateChanged: (DateTime value) {},
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
