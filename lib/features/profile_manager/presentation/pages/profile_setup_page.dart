import 'dart:io';

import 'package:daily_win/app/router/app_routes.dart';
import 'package:daily_win/features/profile_manager/presentation/providers/create_profile_provider.dart';
import 'package:daily_win/features/profile_manager/presentation/widgets/user_profile_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
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
  bool _isImageUploaded = false;
  final _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final formState = ref.watch(userProfileProvider);

    final profileState = ref.watch(createProfileProvider);

    final isLoading = profileState.isLoading;

    Future<void> pickImage() async {
      final XFile? image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      ref.read(userProfileProvider.notifier).setProfileImage(image!);
      setState(() {
        _isImageUploaded = true;
      });
    }

    Future<void> createProfile() async {

      if (!_formKey.currentState!.validate()) return;
      ref
          .read(userProfileProvider.notifier)
          .setBirthDate(DateFormat.yMd().parse(_dateController.text.trim()));
      final profileState = UserProfileState(username: formState.username, birthDate: formState.birthDate, gender: formState.gender, profileImage: formState.profileImage, biography: formState.biography);
      await ref.read(createProfileProvider.notifier).createProfile(profileState: profileState);
      final state = ref.read(createProfileProvider);
      state.whenOrNull(
        data: (profile) {
          if (profile != null && mounted) {
            context.push(AppRoutes.home);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Done")));
          }
        },
        error: (error, stacktrace) {

      }
      );
    }


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
                      // Profile Pic Field
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                              GestureDetector(
                                onTap: pickImage,
                                child: CircleAvatar(
                                  radius: 65.0,
                                  backgroundColor: Colors.grey.shade300,
                                  backgroundImage: _isImageUploaded ? FileImage(File(formState.profileImage!.path)) : null,
                                  child: !_isImageUploaded ? Icon(Icons.add_a_photo_outlined,color: Colors.black87,) : null,
                                ),
                              ),
                        ],
                      ),
                      const SizedBox(height: 20.0),

                      // Username Text Field
                      Text(
                        "Username",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextFormField(
                        initialValue: formState.username,
                        onChanged: (value) {
                          ref
                              .read(userProfileProvider.notifier)
                              .setUsername(value);
                        },
                        // controller: _emailController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          label: Text(
                            'Enter your username',
                            style: TextStyle(
                              color: Theme.of(
                                context,
                              ).colorScheme.secondaryFixedDim,
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
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextFormField(
                        controller: _dateController,
                        // onChanged: (value) {
                        //   ref
                        //       .read(userProfileProvider.notifier)
                        //       .setBirthDate(DateFormat.yMd().parse(value));
                        // },
                        // controller: _emailController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          label: Text(
                            'yyyy/mm/dd',
                            style: TextStyle(
                              color: Theme.of(
                                context,
                              ).colorScheme.secondaryFixedDim,
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
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      RadioGroup<Gender>(
                        groupValue: Gender.male,
                        onChanged: (value) {
                          ref
                              .read(userProfileProvider.notifier)
                              .setGender(value!);
                        },
                        child: Column(
                          children: [
                            RadioListTile(
                              value: Gender.male,
                              title: Text('Male'),
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
                      SizedBox(height: 20.0),

                      //   Bio Text Field
                      TextFormField(
                        onChanged: (value) {
                          ref
                              .read(userProfileProvider.notifier)
                              .setBiography(value);
                        },
                        minLines: 1,
                        maxLines: 4,
                        decoration: InputDecoration(
                          label: Text("Bio (Optional)"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            FilledButton(
              onPressed: isLoading ? null : createProfile,
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
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
