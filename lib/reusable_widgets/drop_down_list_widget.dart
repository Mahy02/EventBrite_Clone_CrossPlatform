import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../utils/build_drop_menu_items.dart';
import '../providers/common_providers/dropd_down_state_provider.dart';

/// A custom [DropDownListWidget]  that displays a dropdown list with provided [items]
///
/// The dropdown widget is built using [DropdownButtonFormField] and is wrapped in a [Consumer] widget that listens to changes in the [DropdownState] object.
///
/// The selected item is determined by the [selectedIndex] property of the [DropdownState] object.
///
/// The selected item is managed by a [DropdownState] instance.
///
/// The items in the dropdown list are generated from the `items` list provided to the widget.
///

class DropDownListWidget extends StatelessWidget {
  /// A list of items to be displayed in the dropdown list.
  final List<String> items;

  /// An optional icon to be displayed as a prefix in the input field.
  final Widget? prefixIcon;

  /// The currently selected item in the dropdown list.
  final String? selectedValue;

  ///For hint text"
  final String? hinttext;

  /// A callback function that will be called whenever the selected item changes.
  final void Function(String)? onChanged;

  /// Creates a new instance of [DropDownListWidget].
  /// The [items] parameter is required.
  const DropDownListWidget({
    Key? key,
    required this.items,
    this.prefixIcon,
     this.selectedValue,
    this.hinttext,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print(items);
    print('Selected value: $selectedValue');
    return Consumer<DropdownState>(
      builder: (BuildContext context, state, Widget? child) => Padding(
        padding: const EdgeInsets.all(11.0),
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 100, 117, 224),
                width: 2.0,
              ),
            ),
            prefixIcon: prefixIcon,
            hintText: hinttext,
          ),
          isExpanded: true,
          //value: items[state.selectedIndex],

          iconSize: 36,
          items: items.map(buildMenuItem).toList(),
          value: selectedValue ?? items[0],
          //onChanged: (value) => state.selectedIndex = items.indexOf(value!)),
          onChanged: (value) {
            print('Selected value: $value');

            int index = state.selectedIndex = items.indexOf(value!);
            print('Selected index: $index');
            int length = items.length;
            print('Selected index: $length');
            // onChanged!(value);
            onChanged?.call(value);
          },
        ),
      ),
    );
    // print(items);
    print('Selected value: $selectedValue');
  }
}
