import 'package:flutter/material.dart';
import 'package:phandal_frontend/model/account_model.dart';

class CustomTextFormField extends StatefulWidget {
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String hintText;
  final bool isPassword;
  final Account errorMessages;

  const CustomTextFormField({
    super.key,
    this.onTap,
    this.validator,
    this.isPassword = false,
    this.controller,
    required this.hintText,
    required this.errorMessages,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword && !_isPasswordVisible,
      readOnly: widget.onTap != null,
      onTap: widget.onTap,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: widget.errorMessages.password != ""
                      ? const Color(0xFFFF6767)
                      : const Color(0xFF6BC7E9),
                ),
              )
            : null,
        contentPadding: const EdgeInsets.only(left: 20),
        hintText: widget.hintText,
        filled: true,
        fillColor: const Color(0xFF253960),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
            color: Color(0xFF6BC7E9),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
            color: Color(0xFFFF6767),
          ),
        ),
      ),
      validator: widget.validator,
    );
  }
}
