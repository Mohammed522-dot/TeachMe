
import 'package:flutter/material.dart';
import 'package:teachme/core/constant.dart';


class InputRegisterField extends StatefulWidget {
  const InputRegisterField({
    Key? key,
    required this.focusNode,
    required this.textController,
    required this.label,
    required this.icons,


  }) : super(key: key);
  @override
  _InputRegisterFieldState createState() => _InputRegisterFieldState();
  final FocusNode focusNode;
  final TextEditingController textController;
  final String label;
  final Icon icons;
}
class _InputRegisterFieldState extends State<InputRegisterField> {
  final textFieldFocusNode = FocusNode();
  bool _obscured = false;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;

      if (widget.focusNode.hasPrimaryFocus) return; // If focus is on text field, dont unfocus
      widget.focusNode.canRequestFocus = false;     // Prevents focus if tap on eye
    });
  }
  @override

  Widget build(BuildContext context) {

    return Padding(
      padding: kHPadding,
      child: TextFormField(
        obscureText: widget.label == "Password" ? true : false,
        controller: widget.textController,
        autofocus: false,
        onFieldSubmitted: (value) {
          FocusScope.of(context).requestFocus(widget.focusNode);
        },
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: kBorderRadius),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue),
                borderRadius: kBorderRadius),
            hintStyle: const TextStyle(color: Colors.black54),
            filled: true,
            suffixIcon:  Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
        child: GestureDetector(
          onTap: _toggleObscured,
          child: Icon(
            _obscured
                ? Icons.visibility_rounded
                : Icons.visibility_off_rounded,
            size: 24,
          ),
        ),
      ),
            fillColor: Colors.transparent,
            hintText: widget.label,
            prefixIcon: widget.icons),

      ),
    );
  }
}