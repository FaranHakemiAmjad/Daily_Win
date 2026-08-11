import 'package:daily_win/features/profile_manager/presentation/widgets/user_profile_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/user_profile_entity.dart';
import '../providers/form_provider.dart';

class ProfileSetupPage extends ConsumerStatefulWidget {
  const ProfileSetupPage({super.key});

  @override
  ConsumerState<ProfileSetupPage> createState() => _ProfileSetupPageState();
}

class _ProfileSetupPageState extends ConsumerState<ProfileSetupPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final profile = ref.watch(userProfileProvider);

    return Scaffold(
      resizeToAvoidBottomInset: true,

      appBar: AppBar(
        title: Text(
          'Create Account',
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
          children: [
      Container(
      padding: EdgeInsetsGeometry.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Pic Field
            // Username Text Field
            Text(
              "Username",
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            TextFormField(
              initialValue: profile.username,
              onChanged: (value) {
                ref.read(userProfileProvider.notifier).setUsername(value);
              },
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
              onChanged: (value) {
                ref
                    .read(userProfileProvider.notifier)
                    .setBirthDate(DateFormat.yMd().parse(value));
              },
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
                if (value == null || value.isEmpty) {
                  return 'Please enter your birth date';
                }

                final regex = RegExp(
                  r'^\d{4}/(0[1-9]|1[0-2])/(0[1-9]|[12]\d|3[01])$',
                );

                if (!regex.hasMatch(value)) {
                  return 'Use format yyyy/MM/dd';
                }

                try {
                  DateFormat('yyyy/MM/dd').parseStrict(value);
                } catch (_) {
                  return 'Invalid date';
                }

                return null;
              },
            ),
            const SizedBox(height: 20.0),

            //Gender Selection
            Text(
              "Gender",
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
            ),

            RadioGroup<Gender>(
              groupValue: profile.gender,
              onChanged: (value) {
                ref.read(userProfileProvider.notifier).setGender(value!);
              },
              child: Column(
                children: [
                  RadioListTile(
                      value: Gender.male,
                      title: Text('Male')
                  ),
                  RadioListTile(
                    value: Gender.female,
                    title: Text('Female'),
                  ),
                  RadioListTile(
                    value: Gender.nonBinary,
                    title: Text('Non Binary'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
          ],
      ),
    );
  }
}
