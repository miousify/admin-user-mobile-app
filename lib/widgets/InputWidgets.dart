import "package:flutter/material.dart";

UnderlineInputBorder App_getDefaultInputBorder(Color color) {
  return UnderlineInputBorder(
      borderSide: BorderSide(color: color == null ? Colors.grey : color));
}

InputDecoration App_getDefaultInputDecoration({String label}) {
  return InputDecoration(
      labelText: label, focusedBorder: App_getDefaultInputBorder(Colors.green));
}

abstract class AppInputFactory extends StatelessWidget {
  final String hint;
  final String label;
  final Function onChange;
  final String helperText;
  final IconData icon;
  final Color color;
  final String value;
  final bool multiline;

  AppInputFactory(
      {this.label,
      this.onChange,
      this.value,
      this.hint,
      this.multiline = false,
      this.helperText,
      this.icon,
      this.color});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}

class AppPlainInputWidget extends AppInputFactory {
  final String hint;
  final String label;
  final Function onChange;
  final Function onSubmit;
  final String helperText;
  final IconData icon;
  final Color color;
  final String value;
  final bool multiline;
  final bool isNumbered;

  AppPlainInputWidget(
      {this.label,
      this.onChange,
      this.isNumbered = false,
      this.onSubmit,
      this.value,
      this.hint,
      this.multiline = false,
      this.helperText,
      this.icon,
      this.color});
  @override
  Widget build(BuildContext context) {
    UnderlineInputBorder getInputBorder(Color color) {
      return UnderlineInputBorder(
          borderSide: BorderSide(color: color == null ? Colors.grey : color));
    }

    // TODO: implement build
    return TextField(
      onChanged: this.onChange,
      keyboardType: this.isNumbered == true
          ? TextInputType.numberWithOptions(decimal: true)
          : null,
      onSubmitted: this.onSubmit,
      controller: TextEditingController(text: value),
      maxLines: this.multiline == true ? 2 : 1,
      decoration: InputDecoration(
          prefixIcon: Icon(
            icon == null ? Icons.edit : icon,
          ),
          focusColor: Color.fromRGBO(0, 50, 0, .9),
          helperText: this.helperText == null ? "" : this.helperText,
          focusedBorder: getInputBorder(Colors.black87),
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: getInputBorder(null),
          hintText: hint == null ? "" : hint),
    );
  }
}

class AppRoundedInputWidget extends AppInputFactory {
  final String hint;
  final String label;
  final Function onChange;
  final Function onSubmit;
  final String helperText;
  final IconData icon;
  final Color color;
  final String value;
  final bool multiline;

  AppRoundedInputWidget(
      {this.label,
      this.onSubmit,
      this.onChange,
      this.value,
      this.hint,
      this.multiline = false,
      this.helperText,
      this.icon,
      this.color});
  @override
  Widget build(BuildContext context) {
    OutlineInputBorder getInputBorder() {
      return OutlineInputBorder(
          gapPadding: 30,
          borderSide: BorderSide(style: BorderStyle.solid),
          borderRadius: BorderRadius.all(Radius.circular(10)));
    }

    // TODO: implement build
    return TextField(
      onChanged: this.onChange,
      onSubmitted: this.onChange,
      controller: TextEditingController(text: value),
      maxLines: this.multiline == true ? 2 : 1,
      decoration: InputDecoration(
          prefixIcon: Icon(
            icon == null ? Icons.edit : icon,
          ),
          focusColor: Color.fromRGBO(0, 50, 0, .9),
          helperText: this.helperText == null ? "" : this.helperText,
          focusedBorder: getInputBorder(),
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
              gapPadding: 30,
              borderSide: BorderSide(
                  color: Colors.transparent, style: BorderStyle.solid),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          hintText: hint == null ? "" : hint),
    );
  }
}

class AppPlainFormWidget extends StatelessWidget {
  final List<Widget> inputElemtents;
  final String formLabel;

  AppPlainFormWidget({this.formLabel, this.inputElemtents});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(14),
            child: Row(
              children: <Widget>[
                Text(
                  this.formLabel,
                  style: Theme.of(context).textTheme.subtitle,
                )
              ],
            ),
          ),
          Column(
            children: this.inputElemtents,
          )
        ],
      ),
    );
  }
}

class AppBeatifulRoundedFormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}
