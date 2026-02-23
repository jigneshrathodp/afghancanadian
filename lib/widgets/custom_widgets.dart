import 'package:afghancanadian/app_colors.dart';
import 'package:flutter/material.dart';

/// Reusable styled text used for headings and important labels.
class StyledText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const StyledText(
    this.text, {
    Key? key,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final widthScale = (screenWidth / 414).clamp(0.8, 1.2);
    final isTablet = screenWidth > 600;
    
    final defaultStyle = TextStyle(
      fontSize: isTablet ? 36 : (32 * widthScale),
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
    );

    return Text(
      text,
      style: defaultStyle.merge(style),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

/// A reusable TextFormField with built-in styling and optional obscure toggle.
class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Color? suffixIconColor;
  final EdgeInsetsGeometry? contentPadding;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    this.hintText,
    this.validator,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.suffixIconColor,
    this.contentPadding,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscure;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    final iconColor = widget.suffixIconColor ?? AppColors.iconPrimary;
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive text field sizing
    final isVerySmallScreen = screenWidth < 360;
    final fieldHeight = isVerySmallScreen ? 45.0 : 50.0;
    final fontSize = isVerySmallScreen ? 14.0 : 16.0;
    final padding = isVerySmallScreen
        ? const EdgeInsets.symmetric(horizontal: 12, vertical: 10)
        : const EdgeInsets.symmetric(horizontal: 16, vertical: 12);

    Widget? suffix;
    if (widget.obscureText) {
      suffix = IconButton(
        icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
        color: iconColor,
        iconSize: isVerySmallScreen ? 18.0 : 24.0,
        onPressed: () {
          setState(() {
            _obscure = !_obscure;
          });
        },
      );
    }

    return FormField<String>(
      initialValue: widget.controller.text,
      validator: widget.validator,
      builder: (field) {
        // Update error text when field has error
        _errorText = field.errorText;
        final hasError = _errorText != null;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: fieldHeight,
              child: TextFormField(
                controller: widget.controller,
                obscureText: _obscure,
                keyboardType: widget.keyboardType,
                textInputAction: widget.textInputAction,
                autocorrect: false,
                enableSuggestions: false,
                onChanged: (value) {
                  field.didChange(value);
                },
                style: TextStyle(
                  fontSize: fontSize,
                ),
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                    color: AppColors.textHint,
                    fontSize: fontSize,
                  ),
                  contentPadding: padding,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: AppColors.borderLight),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: AppColors.borderLight),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: AppColors.borderPrimary, width: 2),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.red, width: 1),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.red, width: 2),
                  ),
                  errorStyle: const TextStyle(height: 0, fontSize: 0),
                  suffixIcon: suffix,
                ),
              ),
            ),
            if (hasError)
              Padding(
                padding: const EdgeInsets.only(top: 4, left: 4),
                child: Text(
                  _errorText!,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: isVerySmallScreen ? 11 : 12,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

/// Reusable button matching the app style.
class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final bool isLoading;
  final bool fullWidth;
  final Color? backgroundColor;
  final double height;

  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.fullWidth = true,
    this.backgroundColor,
    this.height = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bg = backgroundColor ?? AppColors.buttonPrimary;
    final screenWidth = MediaQuery.of(context).size.width;
    final isVerySmallScreen = screenWidth < 360;
    
    final buttonHeight = isVerySmallScreen ? 45.0 : height;
    final buttonTextSize = isVerySmallScreen ? 16.0 : 19.0;

    final button = ElevatedButton(
      onPressed: (isLoading || onPressed == null) ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bg,
        // Avoid deprecated withOpacity by using withAlpha
        disabledBackgroundColor: bg.withAlpha((0.5 * 255).round()),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        padding: isVerySmallScreen 
            ? const EdgeInsets.symmetric(horizontal: 20, vertical: 12)
            : null,
      ),
      child: isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                strokeWidth: 2,
              ),
            )
          : Text(
              label,
              style: TextStyle(
                fontSize: buttonTextSize, 
                fontWeight: FontWeight.bold, 
                color: Colors.white
              ),
            ),
    );

    if (fullWidth) {
      return SizedBox(width: double.infinity, height: buttonHeight, child: button);
    }

    return SizedBox(height: buttonHeight, child: button);
  }
}
