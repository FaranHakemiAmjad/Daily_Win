import 'dart:io';

import 'package:daily_win/app/router/app_routes.dart';
import 'package:daily_win/features/profile_manager/presentation/providers/create_profile_provider.dart';
import 'package:daily_win/features/profile_manager/presentation/widgets/birth_date_picker.dart';
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

  // ValueNotifier to track gender selection locally and trigger rebuilds only for gender UI
  // late final ValueNotifier<Gender> _genderNotifier;
  late final ValueNotifier<DateTime> _birthDateNotifier = ValueNotifier(DateTime.now());

  @override
  void initState() {
    super.initState();
    // Initialize with form provider state or default to male
    // final initialGender = ref.read(userProfileProvider).gender ?? Gender.male;
    // _genderNotifier = ValueNotifier<Gender>(initialGender);
  }

  @override
  void dispose() {
    _dateController.dispose();
    // _genderNotifier.dispose();
    _birthDateNotifier.dispose();
    super.dispose();
  }

  Future<void> pickImage() async {
    final XFile? image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (image != null) {
      ref.read(userProfileProvider.notifier).setProfileImage(image);
      setState(() {
        _isImageUploaded = true;
      });
    }
  }

  Future<void> createProfile() async {
    if (!_formKey.currentState!.validate()) return;

    final formState = ref.read(userProfileProvider);
    // ref
    //     .read(userProfileProvider.notifier)
    //     .setBirthDate(
    //       DateFormat('yyyy/MM/dd').parse(_dateController.text.trim()),
    //     );

    final profileState = UserProfileState(
      username: formState.username,
      birthDate: formState.birthDate,
      gender: formState.gender,
      profileImage: formState.profileImage,
      biography: formState.biography,
    );

    await ref
        .read(createProfileProvider.notifier)
        .createProfile(profileState: profileState);
    final state = ref.read(createProfileProvider);
    state.whenOrNull(
      data: (profile) {
        if (profile != null && mounted) {
          context.push(AppRoutes.home);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Profile Created Successfully!")),
          );
        }
      },
      error: (error, stacktrace) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(error.toString())));
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    final formState = ref.watch(userProfileProvider);
    final profileState = ref.watch(createProfileProvider);
    final isLoading = profileState.isLoading;
    final gender = ref.watch(userProfileProvider.select((s) => s.gender));

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
        padding: const EdgeInsets.all(20.0),
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
                      // Profile Pic Field--------------------------------------
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: pickImage,
                            child: CircleAvatar(
                              radius: 65.0,
                              backgroundColor: Colors.grey.shade300,
                              backgroundImage:
                                  _isImageUploaded &&
                                      formState.profileImage != null
                                  ? FileImage(
                                      File(formState.profileImage!.path),
                                    )
                                  : null,
                              child: !_isImageUploaded
                                  ? const Icon(
                                      Icons.add_a_photo_outlined,
                                      color: Colors.black87,
                                    )
                                  : null,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),

                      // Username Text Field------------------------------------
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

                      // Birth Date Text Field----------------------------------
                      Text(
                        "Birth Date",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      ValueListenableBuilder(
                        valueListenable: _birthDateNotifier,
                        builder: (context, value, child) {
                          return BirthDatePicker();
                        }
                      ),
                      const SizedBox(height: 20.0),

                      // Gender Selection---------------------------------------
                      Text(
                        "Gender",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      RadioGroup<Gender>(
                            groupValue: gender,
                            onChanged: (Gender? value) {
                              if (value != null) {
                                ref
                                    .read(userProfileProvider.notifier)
                                    .setGender(value);
                              }
                            },
                            child: const Column(
                              children: [
                                RadioListTile<Gender>(
                                  value: Gender.male,
                                  title: Text('Male'),
                                ),
                                RadioListTile<Gender>(
                                  value: Gender.female,
                                  title: Text('Female'),
                                ),
                                RadioListTile<Gender>(
                                  value: Gender.nonBinary,
                                  title: Text('Non Binary'),
                                ),
                              ],
                            ),
                          ),
                      const SizedBox(height: 20.0),

                      // Bio Text Field-----------------------------------------
                      TextFormField(
                        onChanged: (value) {
                          ref
                              .read(userProfileProvider.notifier)
                              .setBiography(value);
                        },
                        minLines: 1,
                        maxLines: 4,
                        decoration: const InputDecoration(
                          label: Text("Bio (Optional)"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Submit Button----------------------------------------------------
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
