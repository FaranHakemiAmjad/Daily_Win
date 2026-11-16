import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../providers/form_provider.dart';

class BirthDatePicker extends ConsumerStatefulWidget {
  const BirthDatePicker({super.key});

  @override
  ConsumerState<BirthDatePicker> createState() => _BirthDatePickerState();
}

class _BirthDatePickerState extends ConsumerState<BirthDatePicker> {

  String _formattedDate = DateFormat.yMMMd().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68.0,
      child: InkWell(
        splashColor: Colors.black,
        borderRadius: BorderRadius.circular(15.0),
        onTap: () async {
          final date = await showDatePicker(
            context: context,
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );
          if (date != null) {
            ref.read(userProfileProvider.notifier).setBirthDate(date);
            _formattedDate = DateFormat.yMMMd().format(date);
          }
        },
        child: Container(
          padding: EdgeInsetsGeometry.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            border: BoxBorder.all(color: Colors.black12),
            color: Colors.white,
          ),
          child: Row(
            spacing: 12.0,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [Icon(Icons.edit), Text(_formattedDate)],
          ),
        ),
      ),
    );
  }
}
