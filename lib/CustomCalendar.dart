import 'package:afghancanadian/app_colors.dart';
import 'package:afghancanadian/widgets/custom_app_bar.dart';
import 'package:afghancanadian/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({Key? key}) : super(key: key);

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  // Fixed to February 2026 as per SVG
  final int _highlightedDay = 6; // Day 6 highlighted in SVG

  // February 2026 data - exactly as shown in SVG
  // Month starts on Sunday (1 under Sunday column)
  final List<List<int?>> _weeks = [
    [null, null, null, null, null, null, 1],    // Week 1: Sun(1)
    [2, 3, 4, 5, 6, 7, 8],                       // Week 2: Mon(2) to Sun(8)
    [9, 10, 11, 12, 13, 14, 15],                  // Week 3: Mon(9) to Sun(15)
    [16, 17, 18, 19, 20, 21, 22],                  // Week 4: Mon(16) to Sun(22)
    [23, 24, 25, 26, 27, 28, null],                // Week 5: Mon(23) to Sat(28)
  ];

  final List<String> _weekDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      appBar: CustomAppBar(
        drawer: CustomDrawer(),
      ),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: Center(
          child: Container(
            width: width * 0.95,
            padding: EdgeInsets.all(width * 0.04),
            decoration: BoxDecoration(
              color: Colors.green[800],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Month and Year - exactly as SVG: "# 6 February 2026"
                Text(
                  '6 February 2026',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: width * 0.055,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: height * 0.02),

                // Days of week header - exactly as SVG: "Mon   Tue   Wed   Thu   Fri   Sat   Sun"
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _weekDays.map((day) =>
                      Container(
                        width: (width * 0.75) / 7,
                        alignment: Alignment.center,
                        child: Text(
                          day,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.03,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                  ).toList(),
                ),

                SizedBox(height: height * 0.015),

                // Calendar grid - exactly as SVG layout
                Column(
                  children: _weeks.map((week) =>
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: week.map((day) {
                            // Check if this is day 6 (highlighted in SVG)
                            bool isHighlighted = day == _highlightedDay;

                            return Container(
                              width: (width * 0.75) / 7,
                              height: (width * 0.75) / 7 * 0.9,
                              margin: const EdgeInsets.symmetric(horizontal: 1),
                              decoration: BoxDecoration(
                                color: day != null
                                    ? (isHighlighted ? AppColors.accentGreen : AppColors.textMuted)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              alignment: Alignment.center,
                              child: day != null
                                  ? Text(
                                day.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                                  : null,
                            );
                          }).toList(),
                        ),
                      ),
                  ).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}