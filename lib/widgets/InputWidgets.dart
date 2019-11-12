import "package:flutter/material.dart";

class AppPlainInputWidget extends StatelessWidget {
  final String hint;
  final String label;
  final Function onChange;
  final Function onSubmit;
  final Function onSave;
  final String helperText;
  final IconData icon;
  final Color color;
  final String value;

  AppPlainInputWidget(
      {this.label,
      this.onChange,
      this.onSubmit,
      this.value,
      this.hint,
      this.helperText,
      this.onSave,
      this.icon,
      this.color});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextField(
      onChanged: this.onSubmit,
      onSubmitted: this.onSubmit,
      controller: TextEditingController(text: value),
      decoration: InputDecoration(
          prefixIcon: Icon(
            icon == null ? Icons.input : icon,
//            color: color == null ? Colors.blue : color,
          ),
          helperText: "",
          border: null,
          hintText: hint == null ? "" : hint),
    );
  }
}

class AppRaisedInputWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}
