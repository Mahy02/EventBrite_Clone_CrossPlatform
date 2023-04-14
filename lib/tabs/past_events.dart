import 'package:flutter/material.dart';

class PastEventsTab extends StatelessWidget {
  const PastEventsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(flex:3),
        Container(
          width: 200.0,
          height: 200.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 2.0,
              color: Colors.grey,
            ),
          ),
          child: Icon(
            Icons.calendar_today,
            size: 100.0,
            color: Colors.grey,
          ),
        ),
        const Spacer(flex:1),
        Container(
            child: Center(
                child: Text('You don\'t have any Past events',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(236, 77, 77, 77))))),
        const Spacer(flex:3),
      ],
    );
  }
}
