import 'package:afghancanadian/widgets/app_colors.dart';
import 'package:afghancanadian/widgets/custom_app_bar.dart';
import 'package:afghancanadian/newcustomdrawer.dart';
import 'package:afghancanadian/widgets/responsive_helper.dart';
import 'package:afghancanadian/widgets/app_routes.dart';
import 'package:afghancanadian/new_bottomNavScreen.dart';

import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // ================= STATE =================

  Map<String, bool> expandedSections = {
    'Applicant Info': true,
    'Address': false,
    'Spouse Info': false,
    'Child Info': false,
  };

  Map<int, bool> expandedChildren = {0: true};
  int childCount = 1;

  // Applicant controllers
  final firstNameController = TextEditingController();
  final middleNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final homePhoneController = TextEditingController();
  final dobController = TextEditingController();
  final referenceIdController = TextEditingController();
  String selectedGender = '';

  // Address controllers
  final streetController = TextEditingController();
  final zipController = TextEditingController();
  final countryController = TextEditingController();
  final stateController = TextEditingController();
  final cityController = TextEditingController();

  // Spouse controllers
  final spouseFirstNameController = TextEditingController();
  final spouseMiddleNameController = TextEditingController();
  final spouseCountryController = TextEditingController();
  final spouseLastNameController = TextEditingController();
  final spouseEmailController = TextEditingController();
  final spouseMobileController = TextEditingController();
  final spouseHomePhoneController = TextEditingController();
  final spouseDobController = TextEditingController();
  String selectedSpouseStatus = '';

  // Child data
  List<Map<String, dynamic>> childrenData = [
    {
      'firstName': TextEditingController(),
      'middleName': TextEditingController(),
      'country': TextEditingController(),
      'lastName': TextEditingController(),
      'email': TextEditingController(),
      'mobile': TextEditingController(),
      'homePhone': TextEditingController(),
      'dob': TextEditingController(),
      'status': '',
    }
  ];

  // ================= DISPOSE =================

  @override
  void dispose() {
    firstNameController.dispose();
    middleNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    homePhoneController.dispose();
    dobController.dispose();
    referenceIdController.dispose();
    streetController.dispose();
    zipController.dispose();
    countryController.dispose();
    stateController.dispose();
    cityController.dispose();
    spouseFirstNameController.dispose();
    spouseMiddleNameController.dispose();
    spouseCountryController.dispose();
    spouseLastNameController.dispose();
    spouseEmailController.dispose();
    spouseMobileController.dispose();
    spouseHomePhoneController.dispose();
    spouseDobController.dispose();

    for (var child in childrenData) {
      child['firstName'].dispose();
      child['middleName'].dispose();
      child['country'].dispose();
      child['lastName'].dispose();
      child['email'].dispose();
      child['mobile'].dispose();
      child['homePhone'].dispose();
      child['dob'].dispose();
    }

    super.dispose();
  }

  // ================= COMMON WIDGETS =================

  Widget _buildSectionHeader(
      String title, double widthScale, double heightScale) {
    final isExpanded = expandedSections[title] ?? false;

    return GestureDetector(
      onTap: () {
        setState(() => expandedSections[title] = !isExpanded);
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
            Icon(
              isExpanded
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label,
      TextEditingController controller,
      double widthScale,
      double heightScale, {
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

  Widget _buildDropdownField(
      String label,
      String value,
      List<String> items,
      Function(String?) onChanged,
      double widthScale,
      double heightScale,
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
            child: DropdownButton<String>(
              value: value.isEmpty ? null : value,
              hint: Text('Select $label'),
              isExpanded: true,
              dropdownColor: Colors.white,
              items: items
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }

  // ================= SECTIONS =================

  Widget _buildApplicantInfoSection(
      double widthScale, double heightScale) {
    return Column(
      children: [
        _buildSectionHeader('Applicant Info', widthScale, heightScale),
        if (expandedSections['Applicant Info'] ?? false) ...[
          SizedBox(height: 16 * heightScale),
          _buildTextField(
              'First Name', firstNameController, widthScale, heightScale),
          SizedBox(height: 12 * heightScale),
          _buildTextField(
              'Middle Name', middleNameController, widthScale, heightScale),
          SizedBox(height: 12 * heightScale),
          _buildTextField(
              'Last Name', lastNameController, widthScale, heightScale),
          SizedBox(height: 12 * heightScale),
          _buildTextField('Email', emailController, widthScale, heightScale,
              keyboardType: TextInputType.emailAddress),
          SizedBox(height: 12 * heightScale),
          _buildTextField('Mobile', mobileController, widthScale, heightScale,
              keyboardType: TextInputType.phone),
          SizedBox(height: 12 * heightScale),
          _buildTextField('Home Phone', homePhoneController, widthScale,
              heightScale,
              keyboardType: TextInputType.phone),
          SizedBox(height: 12 * heightScale),
          _buildTextField('YY-MM-DD', dobController, widthScale, heightScale),
          SizedBox(height: 12 * heightScale),
          _buildTextField('Reference ID', referenceIdController, widthScale,
              heightScale),
          SizedBox(height: 12 * heightScale),
          _buildDropdownField(
            'Select Gender',
            selectedGender,
            ['Male', 'Female', 'Other'],
                (v) => setState(() => selectedGender = v ?? ''),
            widthScale,
            heightScale,
          ),
        ],
        SizedBox(height: 16 * heightScale),
      ],
    );
  }

  Widget _buildAddressSection(double w, double h) {
    return Column(
      children: [
        _buildSectionHeader('Address', w, h),
        if (expandedSections['Address'] ?? false) ...[
          SizedBox(height: 16 * h),
          _buildTextField('Street', streetController, w, h),
          SizedBox(height: 12 * h),
          _buildTextField('Zip / Postal Code', zipController, w, h),
          SizedBox(height: 12 * h),
          _buildTextField('Country', countryController, w, h),
          SizedBox(height: 12 * h),
          _buildTextField('State / Province', stateController, w, h),
          SizedBox(height: 12 * h),
          _buildTextField('City', cityController, w, h),
        ],
        SizedBox(height: 16 * h),
      ],
    );
  }

  Widget _buildSpouseInfoSection(double w, double h) {
    return Column(
      children: [
        _buildSectionHeader('Spouse Info', w, h),
        if (expandedSections['Spouse Info'] ?? false) ...[
          SizedBox(height: 16 * h),
          _buildTextField('First Name', spouseFirstNameController, w, h),
          SizedBox(height: 12 * h),
          _buildTextField('Middle Name', spouseMiddleNameController, w, h),
          SizedBox(height: 12 * h),
          _buildTextField('Country', spouseCountryController, w, h),
          SizedBox(height: 12 * h),
          _buildTextField('Last Name', spouseLastNameController, w, h),
          SizedBox(height: 12 * h),
          _buildTextField('Email', spouseEmailController, w, h,
              keyboardType: TextInputType.emailAddress),
          SizedBox(height: 12 * h),
          _buildTextField('Mobile', spouseMobileController, w, h,
              keyboardType: TextInputType.phone),
          SizedBox(height: 12 * h),
          _buildTextField(
              'Home Phone', spouseHomePhoneController, w, h,
              keyboardType: TextInputType.phone),
          SizedBox(height: 12 * h),
          _buildTextField('YY-MM-DD', spouseDobController, w, h),
          SizedBox(height: 12 * h),
          _buildDropdownField(
            'Select Status',
            selectedSpouseStatus,
            ['Active', 'Inactive'],
                (v) => setState(() => selectedSpouseStatus = v ?? ''),
            w,
            h,
          ),
        ],
        SizedBox(height: 16 * h),
      ],
    );
  }

  Widget _buildChildSection(int index, double w, double h) {
    final isExpanded = expandedChildren[index] ?? false;
    final childData = childrenData[index];

    return Column(
      children: [
        GestureDetector(
          onTap: () =>
              setState(() => expandedChildren[index] = !isExpanded),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.primaryDark,
              borderRadius: BorderRadius.circular(12 * w),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16 * w, vertical: 12 * h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Child ${index + 1}',
                    style: TextStyle(color: Colors.white)),
                Row(
                  children: [
                    if (childCount > 1)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            childData['firstName'].dispose();
                            childData['middleName'].dispose();
                            childData['country'].dispose();
                            childData['lastName'].dispose();
                            childData['email'].dispose();
                            childData['mobile'].dispose();
                            childData['homePhone'].dispose();
                            childData['dob'].dispose();
                            childrenData.removeAt(index);
                            expandedChildren.remove(index);
                            for (int i = index; i < childCount - 1; i++) {
                              expandedChildren[i] = expandedChildren[i + 1] ?? false;
                            }
                            expandedChildren.remove(childCount - 1);
                            childCount--;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(4 * w),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(4 * w),
                          ),
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 18 * w,
                          ),
                        ),
                      ),
                    SizedBox(width: 8 * w),
                    Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        if (isExpanded) ...[
          SizedBox(height: 12 * h),
          _buildTextField('First Name', childData['firstName'], w, h),
          SizedBox(height: 10 * h),
          _buildTextField('Middle Name', childData['middleName'], w, h),
          SizedBox(height: 10 * h),
          _buildTextField('Country', childData['country'], w, h),
          SizedBox(height: 10 * h),
          _buildTextField('Last Name', childData['lastName'], w, h),
          SizedBox(height: 10 * h),
          _buildTextField('Email', childData['email'], w, h,
              keyboardType: TextInputType.emailAddress),
          SizedBox(height: 10 * h),
          _buildTextField('Mobile', childData['mobile'], w, h,
              keyboardType: TextInputType.phone),
          SizedBox(height: 10 * h),
          _buildTextField('Home Phone', childData['homePhone'], w, h,
              keyboardType: TextInputType.phone),
          SizedBox(height: 10 * h),
          _buildTextField('YY-MM-DD', childData['dob'], w, h),
          SizedBox(height: 10 * h),
          _buildDropdownField(
            'Status',
            childData['status'],
            ['Active', 'Inactive'],
                (v) => setState(() => childData['status'] = v ?? ''),
            w,
            h,
          ),
        ],
        SizedBox(height: 12 * h),
      ],
    );
  }

  Widget _buildChildInfoSection(double w, double h) {
    return Column(
      children: [
        _buildSectionHeader('Child Info', w, h),
        if (expandedSections['Child Info'] ?? false) ...[
          SizedBox(height: 16 * h),
          ...List.generate(
              childCount, (index) => _buildChildSection(index, w, h)),
          SizedBox(height: 16 * h),
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                childrenData.add({
                  'firstName': TextEditingController(),
                  'middleName': TextEditingController(),
                  'country': TextEditingController(),
                  'lastName': TextEditingController(),
                  'email': TextEditingController(),
                  'mobile': TextEditingController(),
                  'homePhone': TextEditingController(),
                  'dob': TextEditingController(),
                  'status': '',
                });
                expandedChildren[childCount] = true;
                childCount++;
              });
            },
            icon: Icon(Icons.add, color: Colors.white),
            label: Text(
              'Add Child',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14 * w,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryDark,
              padding: EdgeInsets.symmetric(
                horizontal: 20 * w,
                vertical: 12 * h,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8 * w),
              ),
            ),
          ),
        ],
        SizedBox(height: 16 * h),
      ],
    );
  }

  // ================= BUILD =================

  @override
  Widget build(BuildContext context) {
    final scales = ResponsiveHelper.getScales(context);
    final widthScale = scales.widthScale;
    final heightScale = scales.heightScale;

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

              _buildApplicantInfoSection(widthScale, heightScale),
              _buildAddressSection(widthScale, heightScale),
              _buildSpouseInfoSection(widthScale, heightScale),
              _buildChildInfoSection(widthScale, heightScale),

              SizedBox(height: 24 * heightScale),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle submit action
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Profile updated successfully!'),
                        backgroundColor: AppColors.primaryDark,
                      ),
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
              AppRoutes.goToClientHome(context);
              break;
            case 1:
              AppRoutes.goToContactMembership(context);
              break;
            case 2:
              AppRoutes.goToHome(context);
              break;
            case 3:
              AppRoutes.goToContactInvoice(context);
              break;
            case 4:
              AppRoutes.goToContact(context);
              break;
            case 5:
              AppRoutes.goToContactDonation(context);
              break;
          }
        },
        scales: scales,
      ),
    );
  }
}

//Membership , Privacy Policy, Terms and Conditions