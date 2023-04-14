import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:organizer/providers/creator/basic_info_provider.dart';
import 'package:organizer/reusable_widgets/item_side_menu_widget_without_icon.dart';
import 'package:organizer/screens/creator/basic_info/basic_info.dart';
import 'package:organizer/screens/creator/basic_info/dashboard.dart';
import 'package:organizer/screens/creator/basic_info/manage_attendees.dart';
import 'package:organizer/screens/creator/basic_info/publish.dart';
import 'package:organizer/screens/creator/basic_info/tickets.dart';
import 'package:organizer/screens/creator/events_page/events.dart';
import 'package:provider/provider.dart';

import '../providers/creator/icon_state_provider.dart';
import '../reusable_widgets/item_side_menu_widget_with_icon.dart';
import '../utils/back_button_to_events.dart';

///This is a function to build the drawer for the side menu that exists inside [BasicInfo] page
///It helps navigate between these pages=> [BasicInfo], [Publish], [Tickets], [Dashboard], [ManageAttendees]
///We use  [IconSideMenuWidget] to represent each item in the sidemenu and also uses [ItemSideMenuWidget]
///The difference is that [ItemSideMenuWidget] doesnt have an icon beside it

Drawer buildDrawer(BuildContext context) {
  return Drawer(
    backgroundColor: const Color.fromARGB(222, 255, 255, 255),
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        backButtonToEvents(context),
        const Divider(
          color: Color.fromARGB(245, 220, 220, 220),
          thickness: 2,
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 70.0, left: 20),
          child: Consumer<BasicInfoFormDataProvider>(
              builder: (BuildContext context, data, Widget? child) {
            final formData = data.formData;

            final singleorRecurring = formData.singleOrRecurring;

            String formattedDateStart = '';

            String formattedStartTime = '';

            if (singleorRecurring == 'Single') {
              final eventStart = formData.eventStart!;
              final startTime = formData.startTime!;

              formattedDateStart = eventStart.toString().substring(0, 10);
              formattedDateStart =
                  DateFormat('E, d MMM yyyy').format(eventStart);
              formattedStartTime = DateFormat.jm()
                  .format(DateTime(1, 1, 1, startTime.hour, startTime.minute));
            }

            
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  //'Event Title',
                  formData.eventTitle!,
                  style: const TextStyle(
                      fontSize: 30,
                      fontFamily: "Poppins",
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  '$formattedDateStart   $formattedStartTime',
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: "Poppins",
                    color: Colors.black,
                  ),
                )
              ],
            );
          }),
        ),
        const SizedBox(
          height: 30,
        ),
        const Divider(
          color: Color.fromARGB(245, 220, 220, 220),
          thickness: 2,
          height: 20,
        ),
        const IconSideMenuWidget(
          itemNumber: '1',
          page: BasicInfo(),
          itemTitle: 'Basic Info',
        ),
        const IconSideMenuWidget(
          itemNumber: '2',
          page: Tickets(),
          itemTitle: 'Tickets',
        ),
        const IconSideMenuWidget(
          itemNumber: '3',
          page: Publish(),
          itemTitle: 'Publish',
        ),
        const Divider(
          color: Color.fromARGB(245, 220, 220, 220),
          thickness: 2,
          height: 20,
        ),
        const SizedBox(height: 20),
        const ItemSideMenuWidget(itemTitle: 'Dashboard', page: Dashboard()),
        const SizedBox(height: 40),
        const ItemSideMenuWidget(
            itemTitle: 'Manage Attendees', page: ManageAttendees()),
      ],
    ),
  );
}


