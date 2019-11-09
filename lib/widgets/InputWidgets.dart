import "package:flutter/material.dart";

class AppPlainInputWidget extends StatelessWidget {
  final String hint;
  final String label;
  final Function onChange;
  final Function onSave;
  final String helperText;
  final IconData icon;
  final Color color;

  AppPlainInputWidget(
      {this.label,
      this.onChange,
      this.hint,
      this.helperText,
      this.onSave,
      this.icon,
      this.color});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextField(
      onChanged: onChange,
      onSubmitted: (String string) {},
      onEditingComplete: () {},
      decoration: InputDecoration(
          prefixIcon: Icon(
            icon == null ? Icons.input : icon,
            color: color == null ? Colors.blue : color,
          ),
          helperText: "Category name",
          border: null,
          hintText: hint == null ? "Category label" : hint),
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
