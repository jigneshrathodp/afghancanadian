import 'package:flutter/material.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/custom_drawer.dart';
//CalendarScreen



class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() =>
      _PremiumCalendarScreenState();
}

class _PremiumCalendarScreenState extends State<CalendarScreen> {
  DateTime focusedDate = DateTime.now();
  DateTime? selectedDate;

  final List<String> weekDays = const [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun'
  ];

  List<DateTime?> _generateCalendarDays(DateTime date) {
    final firstDayOfMonth = DateTime(date.year, date.month, 1);
    final lastDayOfMonth = DateTime(date.year, date.month + 1, 0);

    int startWeekday = firstDayOfMonth.weekday; // Mon=1
    int totalDays = lastDayOfMonth.day;

    List<DateTime?> days = [];

    for (int i = 1; i < startWeekday; i++) {
      days.add(null);
    }

    for (int i = 1; i <= totalDays; i++) {
      days.add(DateTime(date.year, date.month, i));
    }

    while (days.length % 7 != 0) {
      days.add(null);
    }

    return days;
  }

  void _changeMonth(int delta) {
    setState(() {
      focusedDate = DateTime(focusedDate.year, focusedDate.month + delta);
    });
  }

  @override
  Widget build(BuildContext context) {
    final days = _generateCalendarDays(focusedDate);

    return Scaffold(
      appBar: CustomAppBar(
        drawer: CustomDrawer(),
      ),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 8),

              const Text(
                'CALENDER',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1B5E20),
                  letterSpacing: 1,
                ),
              ),

              const SizedBox(height: 16),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1B5E20),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => _changeMonth(-1),
                          icon: const Icon(Icons.arrow_back,
                              color: Colors.white),
                        ),
                        Text(
                          '${_monthName(focusedDate.month)} ${focusedDate.year}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () => _changeMonth(1),
                          icon: const Icon(Icons.arrow_forward,
                              color: Colors.white),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: weekDays
                          .map(
                            (d) => Expanded(
                          child: Center(
                            child: Text(
                              d,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      )
                          .toList(),
                    ),

                    const SizedBox(height: 10),

                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: days.length,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 7,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (context, index) {
                        final date = days[index];
                        final isSelected = selectedDate != null &&
                            date != null &&
                            _isSameDay(date, selectedDate!);

                        return GestureDetector(
                          onTap: date == null
                              ? null
                              : () {
                            setState(() {
                              selectedDate = date;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: date == null
                                  ? Colors.transparent
                                  : isSelected
                                  ? const Color(0xFF8BC34A)
                                  : const Color(0xFF2E7D32),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              date?.day.toString() ?? '',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                'EVENTS',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1B5E20),
                ),
              ),

              const SizedBox(height: 12),

              _eventCard(
                title: 'Ramadan',
                subtitle: 'March 1 @ 5:23 am - March 23 @ 6:20 pm',
              ),
              const SizedBox(height: 12),
              _eventCard(
                title: 'Ramadan',
                subtitle: 'March 25 @ 5:23 am - March 30 @ 6:20 pm',
                backgroundColor: Colors.white,
              ),
              const SizedBox(height: 12),
              _eventCard(
                title: 'Ramadan',
                subtitle: 'March 25 @ 5:23 am - March 30 @ 6:20 pm',
                backgroundColor: Colors.white,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05 > 60 ? 60 : MediaQuery.of(context).size.height * 0.05)
            ],
          ),
        ),
      ),
    );
  }

  Widget _eventCard({required String title, required String subtitle, Color? backgroundColor}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      decoration: BoxDecoration(
        color: backgroundColor ?? const Color(0xFFDDE5DE),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF2E7D32)),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1B5E20),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  String _monthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return months[month - 1];
  }
}
