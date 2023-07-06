import 'package:flutter/material.dart';

import 'forget_password.dart';

class SingInForgetPasswordTextBuotton extends StatelessWidget {
  const SingInForgetPasswordTextBuotton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ForgetPassword(),
                  ),
                );
              },
              child: Text(
                'Forget Password?',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w500),
              )),
        ],
      ),
    );
  }
}
