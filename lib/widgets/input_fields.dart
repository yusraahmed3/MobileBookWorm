import 'package:flutter/material.dart';

class InputFields extends StatelessWidget {
  String label;
  bool? obscureText;
  InputFields({Key? key, required this.label, this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black87)),
        SizedBox(
          height: 5,
        ),
        TextField(
          obscureText: obscureText!,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey))),
        ),
        SizedBox(
          height: 30,
        )
      ],
    );
  }
}
