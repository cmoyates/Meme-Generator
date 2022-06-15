import 'package:flutter/material.dart';

class LargeTextField extends StatefulWidget {
  LargeTextField({Key key, this.onChanged, this.label, this.hint})
      : super(key: key);

  final onChanged;
  final String label;
  final String hint;

  @override
  State<LargeTextField> createState() => _LargeTextFieldState();
}

class _LargeTextFieldState extends State<LargeTextField> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      fit: FlexFit.loose,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            widget.label,
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width / 4,
            child: TextField(
              onChanged: widget.onChanged,
              onEditingComplete: () {
                setState(() {});
                FocusScope.of(context).unfocus();
                TextEditingController(text: "").clear();
              },
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent, width: 2.0),
                ),
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
                hintText: widget.hint,
              ),
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
