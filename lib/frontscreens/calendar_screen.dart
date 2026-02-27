import 'package:afghancanadian/widgets/app_colors.dart';
import 'package:afghancanadian/widgets/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/app_routes.dart';
import '../widgets/bottom_nav_screen.dart';
import '../controllers/calendar_controller.dart';

class CalendarScreen extends GetView<CalendarController> {
  const CalendarScreen({super.key});

  Widget _eventCard({required String title, required String subtitle, Color? backgroundColor, required double widthScale, required double heightScale, required bool isTablet}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 18 * heightScale, horizontal: 16 * widthScale),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.eventCardBackground,
        borderRadius: BorderRadius.circular(16 * widthScale),
        border: Border.all(color: AppColors.mediumGreen),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: isTablet ? 24 : (20 * widthScale),
              fontWeight: FontWeight.bold,
              color: AppColors.darkGreen,
            ),
          ),
          SizedBox(height: 6 * heightScale),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isTablet ? 17 : (15 * widthScale),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scales = ResponsiveHelper.getScales(context);
    final widthScale = scales.widthScale;
    final heightScale = scales.heightScale;
    final isTablet = ResponsiveHelper.isTablet(context);

    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      drawerEnableOpenDragGesture: false,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16 * widthScale),
          child: Column(
            children: [
              SizedBox(height: 8 * heightScale),

              Text(
                'CALENDER',
                style: TextStyle(
                  fontSize: isTablet ? 28 : (24 * widthScale),
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkGreen,
                  letterSpacing: 1,
                ),
              ),

              SizedBox(height: 16 * heightScale),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16 * widthScale),
                decoration: BoxDecoration(
                  color: AppColors.darkGreen,
                  borderRadius: BorderRadius.circular(20 * widthScale),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => controller.changeMonth(-1),
                          icon: const Icon(Icons.arrow_back,
                              color: Colors.white),
                        ),
                        Obx(() => Text(
                          '${controller.getMonthName(controller.focusedDate.value.month)} ${controller.focusedDate.value.year}',
                          style: TextStyle(
                            color: AppColors.navSelected,
                            fontSize: isTablet ? 24 : (20 * widthScale),
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                        IconButton(
                          onPressed: () => controller.changeMonth(1),
                          icon: const Icon(Icons.arrow_forward,
                              color: Colors.white),
                        ),
                      ],
                    ),

                    SizedBox(height: 12 * heightScale),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: controller.weekDays
                          .map(
                            (d) => Expanded(
                          child: Center(
                            child: Text(
                              d,
                              style: TextStyle(
                                color: AppColors.textLightMuted,
                                fontSize: isTablet ? 14 : (12 * widthScale),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      )
                          .toList(),
                    ),

                    SizedBox(height: 10 * heightScale),

                    Obx(() {
                      final days = controller.generateCalendarDays(controller.focusedDate.value);
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: days.length,
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 7,
                          mainAxisSpacing: 8 * heightScale,
                          crossAxisSpacing: 8 * widthScale,
                          childAspectRatio: 1,
                        ),
                        itemBuilder: (context, index) {
                          final date = days[index];
                          final isSelected = controller.selectedDate.value != null &&
                              date != null &&
                              controller.isSameDay(date, controller.selectedDate.value!);

                          return GestureDetector(
                            onTap: date == null
                                ? null
                                : () {
                              controller.selectDate(date);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: date == null
                                    ? Colors.transparent
                                    : isSelected
                                    ? AppColors.accentGreen
                                    : AppColors.mediumGreen,
                                borderRadius: BorderRadius.circular(8 * widthScale),
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
                      );
                    }),
                  ],
                ),
              ),

              SizedBox(height: 24 * heightScale),

              Text(
                'EVENTS',
                style: TextStyle(
                  fontSize: isTablet ? 26 : (22 * widthScale),
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkGreen,
                ),
              ),

              SizedBox(height: 12 * heightScale),

              _eventCard(
                title: 'Ramadan',
                subtitle: 'March 1 @ 5:23 am - March 23 @ 6:20 pm',
                widthScale: widthScale,
                heightScale: heightScale,
                isTablet: isTablet,
              ),
              SizedBox(height: 12 * heightScale),
              _eventCard(
                title: 'Ramadan',
                subtitle: 'March 25 @ 5:23 am - March 30 @ 6:20 pm',
                backgroundColor: AppColors.background,
                widthScale: widthScale,
                heightScale: heightScale,
                isTablet: isTablet,
              ),
              SizedBox(height: 12 * heightScale),
              _eventCard(
                title: 'Ramadan',
                subtitle: 'March 25 @ 5:23 am - March 30 @ 6:20 pm',
                backgroundColor: AppColors.background,
                widthScale: widthScale,
                heightScale: heightScale,
                isTablet: isTablet,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05 > 60 ? 60 : MediaQuery.of(context).size.height * 0.05)
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        selectedIndex: 1, // Calendar
        onIndexChanged: controller.onBottomNavChanged,
        scales: scales,
      ),
    );
  }
}