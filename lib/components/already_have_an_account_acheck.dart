import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function? press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: press as void Function()?,
          child: Text(
            login ? "   حساب جديد     " : "    دخـــول",
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,fontSize: 18.0
            ),
          ),
        ),
        Text(
          login ? " ليس لديك حساب ؟    " : "     لديك حساب بالفعل ؟ ",
          style: TextStyle(color: kPrimaryColor, fontSize: 18.0),
        ),
      ],
    );
  }
}
