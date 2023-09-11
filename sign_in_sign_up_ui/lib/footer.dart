import 'package:flutter/material.dart';
import 'package:sign_in_sign_up_ui/main.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have Account?',
          style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: kTextColorSecondary),
        ),
        SizedBox(width: 4),
        Text(
          'Sign up',
          style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: kTextColorPrimary),
        ),
      ],
    );
  }
}