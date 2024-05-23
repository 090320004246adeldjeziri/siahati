import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneNumberField extends StatefulWidget {
  final String hintText;
  final Icon icon;
  final TextEditingController controller;

  PhoneNumberField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.controller,
  }) : super(key: key);

  @override
  _PhoneNumberFieldState createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  late String? _phoneNumberError;

  @override
  void initState() {
    super.initState();
    _phoneNumberError = null; // Initialisation de _phoneNumberError à null
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InternationalPhoneNumberInput(
            inputDecoration: InputDecoration(
              filled: true,
              hintText: widget.hintText,
              prefixIcon: widget.icon,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              errorText: _phoneNumberError,
            ),
            onInputChanged: (PhoneNumber number) {
              // Vous pouvez ajouter des validations personnalisées ici si nécessaire
            },
            onInputValidated: (bool value) {
              // Vous pouvez ajouter des validations supplémentaires ici si nécessaire
            },
            selectorConfig: SelectorConfig(
              selectorType: PhoneInputSelectorType.DIALOG,
            ),
            ignoreBlank: false,
            autoValidateMode: AutovalidateMode.onUserInteraction,
            selectorTextStyle: TextStyle(color: Colors.black),
            initialValue: PhoneNumber(isoCode: 'DZ'),
            textFieldController: widget.controller,
            formatInput: false,
            keyboardType: TextInputType.phone,
            
          ),
        ),
      ],
    );
  }

  


}
