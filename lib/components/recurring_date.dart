import 'package:flutter/material.dart';
import 'package:organizer/providers/creator/date_selection_provider.dart';
import 'package:provider/provider.dart';

class RecurringDateButtonWidget extends StatefulWidget {
  const RecurringDateButtonWidget({Key? key}) : super(key: key);

  @override
  _RecurringDateButtonWidgetState createState() =>
      _RecurringDateButtonWidgetState();
}

class _RecurringDateButtonWidgetState extends State<RecurringDateButtonWidget> {
  bool _isChecked3 = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<DateSelectionModel>(
      builder: (BuildContext context, model, Widget? child) => Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Text(
              'You’ll be able to set a schedule for your recurring event in the next step. Event details and ticket types will apply to all instances',
              style: TextStyle(fontSize: 18, fontFamily: "Poppins"),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              title: const Text(
                  'Display end date. \n The end time of your event will be displayed to attendees.',
                  style: TextStyle(fontSize: 16, fontFamily: "Poppins")),
              leading: Checkbox(
                value: model.isChecked3,
                onChanged: (value) {
                  setState(() {
                    // _isChecked3 = value!;
                    model.isChecked3 = value!;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
