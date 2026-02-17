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
    final defaultStyle = TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: const Color(0xFF2D5016),
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

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    final iconColor = widget.suffixIconColor ?? const Color(0xFF2D5016);
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

    return SizedBox(
      height: fieldHeight,
      child: TextFormField(
        controller: widget.controller,
        obscureText: _obscure,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        validator: widget.validator,
        autocorrect: false,
        enableSuggestions: false,
        style: TextStyle(
          fontSize: fontSize,
        ),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: const Color(0xFFB0B0B0),
            fontSize: fontSize,
          ),
          contentPadding: padding,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFFE8E8E8)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFFE8E8E8)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFF2D5016), width: 2),
          ),
          suffixIcon: suffix,
        ),
      ),
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
    final bg = backgroundColor ?? const Color(0xFF2D5016);
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
