import 'package:afghancanadian/widgets/custom_app_bar.dart';
import 'package:afghancanadian/newcustomdrawer.dart';
import 'package:afghancanadian/widgets/responsive_helper.dart';
import 'package:afghancanadian/widgets/app_routes.dart';
import 'package:afghancanadian/new_bottomNavScreen.dart';
import 'package:get/get.dart';
import '../controllers/payment_controller.dart';

import 'package:flutter/material.dart';

class ContactPaymentScreen extends StatelessWidget {
  const ContactPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PaymentController());
    final scales = ResponsiveHelper.getScales(context);
    final widthScale = scales.widthScale;
    final heightScale = scales.heightScale;

    Widget buildDropdown({
      required String? value,
      required String hint,
      required List<String> items,
      required ValueChanged<String?> onChanged,
      required double widthScale,
      required double heightScale,
    }) {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10 * widthScale,
          vertical: 4 * heightScale,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8 * widthScale),
        ),
        child: DropdownButtonHideUnderline(
          child: Obx(() => DropdownButton<String>(
            value: value,
            hint: Text(
              hint,
              style: TextStyle(
                fontSize: 13 * widthScale,
                color: Colors.grey.shade600,
              ),
            ),
            isExpanded: true,
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey.shade600,
              size: 20 * widthScale,
            ),
            style: TextStyle(
              fontSize: 13 * widthScale,
              color: Colors.black87,
            ),
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item == hint ? null : item,
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: 13 * widthScale,
                    color: Colors.black87,
                  ),
                ),
              );
            }).toList(),
            onChanged: onChanged,
          )),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      drawer: NewCustomDrawer(),
      drawerEnableOpenDragGesture: false,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 80 * heightScale),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12 * widthScale),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 12 * heightScale),

                // Manage Payment Header
                Container(
                  padding: EdgeInsets.symmetric(vertical: 14 * heightScale),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1B5E20),
                    borderRadius: BorderRadius.circular(12 * widthScale),
                  ),
                  child: Center(
                    child: Text(
                      'Manage Payment',
                      style: TextStyle(
                        fontSize: 18 * widthScale,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 16 * heightScale),

                // Filter Dropdowns Row
                Row(
                  children: [
                    Expanded(
                      child: Obx(() => buildDropdown(
                        value: controller.selectedMonth.value,
                        hint: 'Current Month',
                        items: controller.monthOptions,
                        onChanged: (value) {
                          controller.selectedMonth.value = value;
                        },
                        widthScale: widthScale,
                        heightScale: heightScale,
                      )),
                    ),
                    SizedBox(width: 12 * widthScale),
                    Expanded(
                      child: Obx(() => buildDropdown(
                        value: controller.selectedDateRange.value,
                        hint: 'Start - End Date',
                        items: const ['Start - End Date', 'Last 7 Days', 'Last 30 Days'],
                        onChanged: (value) {
                          controller.selectedDateRange.value = value;
                        },
                        widthScale: widthScale,
                        heightScale: heightScale,
                      )),
                    ),
                  ],
                ),

                SizedBox(height: 16 * heightScale),

                // Payment List Container
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(12 * widthScale),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    children: [
                      // Table Header
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8 * widthScale,
                          vertical: 10 * heightScale,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFD4E8D4),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12 * widthScale),
                            topRight: Radius.circular(12 * widthScale),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Date',
                                style: TextStyle(
                                  fontSize: 13 * widthScale,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF1B5E20),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                'ID',
                                style: TextStyle(
                                  fontSize: 13 * widthScale,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF1B5E20),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Rep Name',
                                style: TextStyle(
                                  fontSize: 13 * widthScale,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF1B5E20),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Action',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13 * widthScale,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF1B5E20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Payment List Items
                      ...List.generate(controller.payments.length, (index) {
                        final payment = controller.payments[index];
                        final isExpanded = controller.expandedItems.contains(index);
                        final hasDetails = payment['details'] != null;

                        return Column(
                          children: [
                            // Main Row
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8 * widthScale,
                                vertical: 8 * heightScale,
                              ),
                              decoration: BoxDecoration(
                                color: index % 2 == 0 ? Colors.white : const Color(0xFFFAFAFA),
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey.shade200,
                                    width: 0.5,
                                  ),
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Date Column
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          onTap: hasDetails
                                              ? () {
                                                  controller.toggleExpandedItem(index);
                                                }
                                              : null,
                                          child: Container(
                                            width: 18 * widthScale,
                                            height: 18 * widthScale,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: hasDetails
                                                    ? const Color(0xFF1B5E20)
                                                    : Colors.grey.shade400,
                                                width: 1.5,
                                              ),
                                            ),
                                            child: Center(
                                              child: Icon(
                                                isExpanded
                                                    ? Icons.remove
                                                    : Icons.add,
                                                size: 12 * widthScale,
                                                color: hasDetails
                                                    ? const Color(0xFF1B5E20)
                                                    : Colors.grey.shade400,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 4 * widthScale),
                                        Expanded(
                                          child: Text(
                                            payment['date'].toString(),
                                            style: TextStyle(
                                              fontSize: 11 * widthScale,
                                              color: Colors.black87,
                                              height: 1.3,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // ID Column
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      payment['id'].toString(),
                                      style: TextStyle(
                                        fontSize: 12 * widthScale,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                  // Rep Name Column
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      payment['repName'].toString(),
                                      style: TextStyle(
                                        fontSize: 11 * widthScale,
                                        color: Colors.black87,
                                        height: 1.3,
                                      ),
                                    ),
                                  ),
                                  // Action Column
                                  Expanded(
                                    flex: 2,
                                    child: Center(
                                      child: GestureDetector(
                                        onTap: () {
                                          // Copy action
                                        },
                                        child: Icon(
                                          Icons.content_copy,
                                          size: 18 * widthScale,
                                          color: const Color(0xFF1B5E20),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Expanded Details
                            if (isExpanded && hasDetails)
                              Container(
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(
                                  horizontal: 8 * widthScale,
                                  vertical: 6 * heightScale,
                                ),
                                padding: EdgeInsets.all(10 * widthScale),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8 * widthScale),
                                  border: Border.all(color: Colors.grey.shade300),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Details Row
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Details',
                                          style: TextStyle(
                                            fontSize: 12 * widthScale,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF1B5E20),
                                          ),
                                        ),
                                        SizedBox(width: 8 * widthScale),
                                        Expanded(
                                          child: Text(
                                            ': ${payment['details']?.toString() ?? ''}',
                                            style: TextStyle(
                                              fontSize: 12 * widthScale,
                                              color: Colors.black87,
                                              height: 1.3,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 6 * heightScale),
                                    // Amount Row
                                    if (payment['amount'] != null)
                                      Row(
                                        children: [
                                          Text(
                                            'Amt.(\$)',
                                            style: TextStyle(
                                              fontSize: 12 * widthScale,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xFF1B5E20),
                                            ),
                                          ),
                                          SizedBox(width: 8 * widthScale),
                                          Text(
                                            ': ${payment['amount']?.toString() ?? ''}',
                                            style: TextStyle(
                                              fontSize: 12 * widthScale,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ],
                                      ),
                                    SizedBox(height: 6 * heightScale),
                                    // Status Row
                                    Row(
                                      children: [
                                        Text(
                                          'Status',
                                          style: TextStyle(
                                            fontSize: 12 * widthScale,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF1B5E20),
                                          ),
                                        ),
                                        SizedBox(width: 8 * widthScale),
                                        Text(
                                          ': ${payment['status']?.toString() ?? ''}',
                                          style: TextStyle(
                                            fontSize: 12 * widthScale,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        );
                      }),
                    ],
                  ),
                ),

                SizedBox(height: 16 * heightScale),

                // Showing entries text
                Center(
                  child: Text(
                    'Showing 1 to 10 of 19 entries',
                    style: TextStyle(
                      fontSize: 13 * widthScale,
                      color: const Color(0xFF1B5E20),
                    ),
                  ),
                ),

                SizedBox(height: 12 * heightScale),

                // Load More Button
                Center(
                  child: GestureDetector(
                    onTap: () {
                      // Load more action
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 40 * widthScale,
                        vertical: 12 * heightScale,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1B5E20),
                        borderRadius: BorderRadius.circular(24 * widthScale),
                      ),
                      child: Text(
                        'Load More',
                        style: TextStyle(
                          fontSize: 15 * widthScale,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20 * heightScale),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: NewCustomBottomBar(
        selectedIndex: -1, // No selection for payment screen
        onIndexChanged: (index) {
          switch (index) {
            case 0:
              Get.toNamed(AppRoutes.dashboard);
              break;
            case 1:
              Get.toNamed(AppRoutes.contactMembership);
              break;
            case 2:
              Get.toNamed(AppRoutes.home);
              break;
            case 3:
              Get.toNamed(AppRoutes.contactInvoice);
              break;
            case 4:
              Get.toNamed(AppRoutes.contact);
              break;
            case 5:
              Get.toNamed(AppRoutes.contactDonation);
              break;
          }
        },
        scales: scales,
      ),
    );
  }
}