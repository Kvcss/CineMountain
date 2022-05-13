
import 'package:flutter/material.dart';

class DateSelector extends StatefulWidget {
  const DateSelector({Key? key}) : super(key: key);

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;

    return Expanded(
      flex : 13,
      child: Container(
        width: 100,
        padding: EdgeInsets.zero,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white
              ),
            )
          ],
        ),
      ),

    );
  }
}
