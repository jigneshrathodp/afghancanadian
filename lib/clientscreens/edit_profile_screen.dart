import 'package:afghancanadian/widgets/app_colors.dart';
import 'package:afghancanadian/widgets/custom_app_bar.dart';
import 'package:afghancanadian/newcustomdrawer.dart';
import 'package:afghancanadian/widgets/responsive_helper.dart';
import 'package:afghancanadian/widgets/app_routes.dart';
import 'package:afghancanadian/new_bottomNavScreen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Create reactive variables for state management
    final expandedSections = <String, bool>{
      'Applicant Info': true,
      'Address': false,
      'Spouse Info': false,
      'Child Info': false,
    }.obs;

    final expandedChildren = <int, bool>{0: true}.obs;
    final childCount = 1.obs;

    // Applicant controllers
    final firstNameController = Get.put(TextEditingController(), tag: 'profile_firstName');
    final middleNameController = Get.put(TextEditingController(), tag: 'profile_middleName');
    final lastNameController = Get.put(TextEditingController(), tag: 'profile_lastName');
    final emailController = Get.put(TextEditingController(), tag: 'profile_email');
    final mobileController = Get.put(TextEditingController(), tag: 'profile_mobile');
    final homePhoneController = Get.put(TextEditingController(), tag: 'profile_homePhone');
    final dobController = Get.put(TextEditingController(), tag: 'profile_dob');
    final referenceIdController = Get.put(TextEditingController(), tag: 'profile_referenceId');
    final selectedGender = ''.obs;

    // Address controllers
    final streetController = Get.put(TextEditingController(), tag: 'profile_street');
    final zipController = Get.put(TextEditingController(), tag: 'profile_zip');
    final countryController = Get.put(TextEditingController(), tag: 'profile_country');
    final stateController = Get.put(TextEditingController(), tag: 'profile_state');
    final cityController = Get.put(TextEditingController(), tag: 'profile_city');

    // Spouse controllers
    final spouseFirstNameController = Get.put(TextEditingController(), tag: 'profile_spouse_firstName');
    final spouseMiddleNameController = Get.put(TextEditingController(), tag: 'profile_spouse_middleName');
    final spouseCountryController = Get.put(TextEditingController(), tag: 'profile_spouse_country');
    final spouseLastNameController = Get.put(TextEditingController(), tag: 'profile_spouse_lastName');
    final spouseEmailController = Get.put(TextEditingController(), tag: 'profile_spouse_email');
    final spouseMobileController = Get.put(TextEditingController(), tag: 'profile_spouse_mobile');
    final spouseHomePhoneController = Get.put(TextEditingController(), tag: 'profile_spouse_homePhone');
    final spouseDobController = Get.put(TextEditingController(), tag: 'profile_spouse_dob');
    final selectedSpouseStatus = ''.obs;

    // Child data
    final childrenData = <Map<String, dynamic>>[
      {
        'firstName': Get.put(TextEditingController(), tag: 'child_0_firstName'),
        'middleName': Get.put(TextEditingController(), tag: 'child_0_middleName'),
        'country': Get.put(TextEditingController(), tag: 'child_0_country'),
        'lastName': Get.put(TextEditingController(), tag: 'child_0_lastName'),
        'email': Get.put(TextEditingController(), tag: 'child_0_email'),
        'mobile': Get.put(TextEditingController(), tag: 'child_0_mobile'),
        'homePhone': Get.put(TextEditingController(), tag: 'child_0_homePhone'),
        'dob': Get.put(TextEditingController(), tag: 'child_0_dob'),
        'status': ''.obs,
      }
    ].obs;

    final scales = ResponsiveHelper.getScales(context);
    final widthScale = scales.widthScale;
    final heightScale = scales.heightScale;

    // Common widgets
    Widget buildSectionHeader(String title) {
      return GestureDetector(
        onTap: () {
          expandedSections[title] = !(expandedSections[title] ?? false);
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.primaryDark,
            borderRadius: BorderRadius.circular(12 * widthScale),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 16 * widthScale,
            vertical: 14 * heightScale,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16 * widthScale,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Obx(() => Icon(
                (expandedSections[title] ?? false)
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: Colors.white,
              )),
            ],
          ),
        ),
      );
    }

    Widget buildTextField(
        String label,
        TextEditingController controller,
        {
          TextInputType keyboardType = TextInputType.text,
        }) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 13 * widthScale,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 6 * heightScale),
          TextField(
            controller: controller,
            keyboardType: keyboardType,
            style: TextStyle(color: Colors.black, fontSize: 14 * widthScale),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Enter $label',
              hintStyle: TextStyle(
                color: Colors.grey[500],
                fontSize: 14 * widthScale,
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12 * widthScale,
                vertical: 12 * heightScale,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8 * widthScale),
                borderSide: BorderSide(color: Colors.grey[400]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8 * widthScale),
                borderSide: BorderSide(color: Colors.grey[400]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8 * widthScale),
                borderSide: BorderSide(color: AppColors.primaryDark, width: 1.5),
              ),
            ),
          ),
        ],
      );
    }

    Widget buildDropdownField(
        String label,
        String value,
        List<String> items,
        Function(String?) onChanged,
        ) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 13 * widthScale,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 6 * heightScale),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8 * widthScale),
              border: Border.all(color: Colors.grey[400]!),
            ),
            padding: EdgeInsets.symmetric(horizontal: 12 * widthScale),
            child: DropdownButtonHideUnderline(
              child: Obx(() => DropdownButton<String>(
                value: value.isEmpty ? null : value,
                hint: Text('Select $label'),
                isExpanded: true,
                dropdownColor: Colors.white,
                items: items
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: onChanged,
              )),
            ),
          ),
        ],
      );
    }

    // Sections
    Widget buildApplicantInfoSection() {
      return Column(
        children: [
          buildSectionHeader('Applicant Info'),
          Obx(() => (expandedSections['Applicant Info'] ?? false) ? Column(
            children: [
              SizedBox(height: 16 * heightScale),
              buildTextField(
                  'First Name', firstNameController),
              SizedBox(height: 12 * heightScale),
              buildTextField(
                  'Middle Name', middleNameController),
              SizedBox(height: 12 * heightScale),
              buildTextField(
                  'Last Name', lastNameController),
              SizedBox(height: 12 * heightScale),
              buildTextField('Email', emailController,
                  keyboardType: TextInputType.emailAddress),
              SizedBox(height: 12 * heightScale),
              buildTextField('Mobile', mobileController,
                  keyboardType: TextInputType.phone),
              SizedBox(height: 12 * heightScale),
              buildTextField('Home Phone', homePhoneController,
                  keyboardType: TextInputType.phone),
              SizedBox(height: 12 * heightScale),
              buildTextField('YY-MM-DD', dobController),
              SizedBox(height: 12 * heightScale),
              buildTextField('Reference ID', referenceIdController),
              SizedBox(height: 12 * heightScale),
              buildDropdownField(
                'Select Gender',
                selectedGender.value,
                ['Male', 'Female', 'Other'],
                    (v) => selectedGender.value = v ?? '',
              ),
            ],
          ) : const SizedBox()),
          SizedBox(height: 16 * heightScale),
        ],
      );
    }

    Widget buildAddressSection() {
      return Column(
        children: [
          buildSectionHeader('Address'),
          Obx(() => (expandedSections['Address'] ?? false) ? Column(
            children: [
              SizedBox(height: 16 * heightScale),
              buildTextField('Street', streetController),
              SizedBox(height: 12 * heightScale),
              buildTextField('Zip / Postal Code', zipController),
              SizedBox(height: 12 * heightScale),
              buildTextField('Country', countryController),
              SizedBox(height: 12 * heightScale),
              buildTextField('State / Province', stateController),
              SizedBox(height: 12 * heightScale),
              buildTextField('City', cityController),
            ],
          ) : const SizedBox()),
          SizedBox(height: 16 * heightScale),
        ],
      );
    }

    Widget buildSpouseInfoSection() {
      return Column(
        children: [
          buildSectionHeader('Spouse Info'),
          Obx(() => (expandedSections['Spouse Info'] ?? false) ? Column(
            children: [
              SizedBox(height: 16 * heightScale),
              buildTextField('First Name', spouseFirstNameController),
              SizedBox(height: 12 * heightScale),
              buildTextField('Middle Name', spouseMiddleNameController),
              SizedBox(height: 12 * heightScale),
              buildTextField('Country', spouseCountryController),
              SizedBox(height: 12 * heightScale),
              buildTextField('Last Name', spouseLastNameController),
              SizedBox(height: 12 * heightScale),
              buildTextField('Email', spouseEmailController,
                  keyboardType: TextInputType.emailAddress),
              SizedBox(height: 12 * heightScale),
              buildTextField('Mobile', spouseMobileController,
                  keyboardType: TextInputType.phone),
              SizedBox(height: 12 * heightScale),
              buildTextField(
                  'Home Phone', spouseHomePhoneController,
                  keyboardType: TextInputType.phone),
              SizedBox(height: 12 * heightScale),
              buildTextField('YY-MM-DD', spouseDobController),
              SizedBox(height: 12 * heightScale),
              buildDropdownField(
                'Select Status',
                selectedSpouseStatus.value,
                ['Active', 'Inactive'],
                    (v) => selectedSpouseStatus.value = v ?? '',
              ),
            ],
          ) : const SizedBox()),
          SizedBox(height: 16 * heightScale),
        ],
      );
    }

    Widget buildChildSection(int index) {
      final childData = childrenData[index];

      return Column(
        children: [
          GestureDetector(
            onTap: () =>
                expandedChildren[index] = !(expandedChildren[index] ?? false),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primaryDark,
                borderRadius: BorderRadius.circular(12 * widthScale),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16 * widthScale, vertical: 12 * heightScale),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Child ${index + 1}',
                      style: TextStyle(color: Colors.white)),
                  Row(
                    children: [
                      Obx(() => (childCount.value > 1)
                          ? GestureDetector(
                        onTap: () {
                          // Dispose controllers
                          Get.find<TextEditingController>(tag: 'child_${index}_firstName').dispose();
                          Get.find<TextEditingController>(tag: 'child_${index}_middleName').dispose();
                          Get.find<TextEditingController>(tag: 'child_${index}_country').dispose();
                          Get.find<TextEditingController>(tag: 'child_${index}_lastName').dispose();
                          Get.find<TextEditingController>(tag: 'child_${index}_email').dispose();
                          Get.find<TextEditingController>(tag: 'child_${index}_mobile').dispose();
                          Get.find<TextEditingController>(tag: 'child_${index}_homePhone').dispose();
                          Get.find<TextEditingController>(tag: 'child_${index}_dob').dispose();

                          childrenData.removeAt(index);
                          expandedChildren.remove(index);
                          for (int i = index; i < childCount.value - 1; i++) {
                            expandedChildren[i] = expandedChildren[i + 1] ?? false;
                          }
                          expandedChildren.remove(childCount.value - 1);
                          childCount.value--;
                        },
                        child: Container(
                          padding: EdgeInsets.all(4 * widthScale),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(4 * widthScale),
                          ),
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 18 * widthScale,
                          ),
                        ),
                      ) : const SizedBox()),
                      SizedBox(width: 8 * widthScale),
                      Obx(() => Icon(
                        (expandedChildren[index] ?? false)
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: Colors.white,
                      )),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Obx(() => (expandedChildren[index] ?? false) ? Column(
            children: [
              SizedBox(height: 12 * heightScale),
              buildTextField('First Name', childData['firstName']),
              SizedBox(height: 10 * heightScale),
              buildTextField('Middle Name', childData['middleName']),
              SizedBox(height: 10 * heightScale),
              buildTextField('Country', childData['country']),
              SizedBox(height: 10 * heightScale),
              buildTextField('Last Name', childData['lastName']),
              SizedBox(height: 10 * heightScale),
              buildTextField('Email', childData['email'],
                  keyboardType: TextInputType.emailAddress),
              SizedBox(height: 10 * heightScale),
              buildTextField('Mobile', childData['mobile'],
                  keyboardType: TextInputType.phone),
              SizedBox(height: 10 * heightScale),
              buildTextField('Home Phone', childData['homePhone'],
                  keyboardType: TextInputType.phone),
              SizedBox(height: 10 * heightScale),
              buildTextField('YY-MM-DD', childData['dob']),
              SizedBox(height: 10 * heightScale),
              buildDropdownField(
                'Status',
                childData['status'].value,
                ['Active', 'Inactive'],
                    (v) => childData['status'].value = v ?? '',
              ),
            ],
          ) : const SizedBox()),
          SizedBox(height: 12 * heightScale),
        ],
      );
    }

    Widget buildChildInfoSection() {
      return Column(
        children: [
          buildSectionHeader('Child Info'),
          Obx(() => (expandedSections['Child Info'] ?? false) ? Column(
            children: [
              SizedBox(height: 16 * heightScale),
              Obx(() => ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: childCount.value,
                itemBuilder: (context, index) => buildChildSection(index),
              )),
              SizedBox(height: 16 * heightScale),
              ElevatedButton.icon(
                onPressed: () {
                  final newIndex = childCount.value;
                  childrenData.add({
                    'firstName': Get.put(TextEditingController(), tag: 'child_${newIndex}_firstName'),
                    'middleName': Get.put(TextEditingController(), tag: 'child_${newIndex}_middleName'),
                    'country': Get.put(TextEditingController(), tag: 'child_${newIndex}_country'),
                    'lastName': Get.put(TextEditingController(), tag: 'child_${newIndex}_lastName'),
                    'email': Get.put(TextEditingController(), tag: 'child_${newIndex}_email'),
                    'mobile': Get.put(TextEditingController(), tag: 'child_${newIndex}_mobile'),
                    'homePhone': Get.put(TextEditingController(), tag: 'child_${newIndex}_homePhone'),
                    'dob': Get.put(TextEditingController(), tag: 'child_${newIndex}_dob'),
                    'status': ''.obs,
                  });
                  expandedChildren[newIndex] = true;
                  childCount.value++;
                },
                icon: Icon(Icons.add, color: Colors.white),
                label: Text(
                  'Add Child',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14 * widthScale,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryDark,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20 * widthScale,
                    vertical: 12 * heightScale,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8 * widthScale),
                  ),
                ),
              ),
            ],
          ) : const SizedBox()),
          SizedBox(height: 16 * heightScale),
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      drawer: NewCustomDrawer(),
      drawerEnableOpenDragGesture: false,

      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 20 * widthScale,
            vertical: 20 * heightScale,
          ),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Edit Profile',
                  style: TextStyle(
                    fontSize: 20 * widthScale,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryDark,
                  ),
                ),
              ),
              SizedBox(height: 24 * heightScale),

              buildApplicantInfoSection(),
              buildAddressSection(),
              buildSpouseInfoSection(),
              buildChildInfoSection(),

              SizedBox(height: 24 * heightScale),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle submit action
                    Get.snackbar(
                      'Success',
                      'Profile updated successfully!',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: AppColors.primaryDark,
                      colorText: Colors.white,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryDark,
                    padding: EdgeInsets.symmetric(vertical: 16 * heightScale),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12 * widthScale),
                    ),
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16 * widthScale,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20 * heightScale),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NewCustomBottomBar(
        selectedIndex: -1, // No selection for edit profile screen
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