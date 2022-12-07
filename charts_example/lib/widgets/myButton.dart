import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  String title;
  Function onTap;
  bool disabled;
  MyButton({Key? key, this.title = '', required this.onTap, this.disabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 0, bottom: 30),
      height: 80,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (!disabled) {
            onTap();
          }
        },
        child: Text(title),
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor:
              MaterialStateProperty.all(!disabled ? Colors.grey : Color.fromARGB(255, 65, 65, 65)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
        ),
      ),
    );
  }
}
