import 'package:flutter/material.dart';

class EmailField extends StatefulWidget {
  final String ButtonName;
  final Icon icon;
  final TextEditingController textEditingController;
  final TextInputType serviceType;

  EmailField({
    Key? key,
    required this.ButtonName,
    required this.icon,
    required this.textEditingController,
    required this.serviceType,
  }) : super(key: key);

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  late String? _emailError;

  @override
  void initState() {
    super.initState();
    _emailError = null; // Initialisation de _emailError à null
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: widget.textEditingController,
            keyboardType: widget.serviceType,
            decoration: InputDecoration(
              filled: true,
              hintText: widget.ButtonName,
              prefixIcon: widget.icon,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              errorText: _emailError,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez saisir une adresse e-mail';
              } else if (!isValidEmail(value)) {
                return 'Veuillez saisir une adresse e-mail valide';
              }
              return null;
            },
            onFieldSubmitted: (value) {
              _validateEmail(value);
            },
          ),
        )
      ],
    );
  }

  void _validateEmail(String value) {
    setState(() {
      if (value.isEmpty) {
        _emailError = 'Veuillez saisir une adresse e-mail';
      } else if (!isValidEmail(value)) {
        _emailError = 'Veuillez saisir une adresse e-mail valide';
      } else {
        _emailError = null;
      }
    });
  }

  bool isValidEmail(String value) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(value);
  }
}
