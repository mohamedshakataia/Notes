import 'package:flutter/material.dart';
import 'package:notes/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, this.isloading = false});
  final Function()? onPressed;
  final bool isloading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60, bottom: 20),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: KColor,
          minimumSize: Size(double.infinity, 50),
        ),

        child: isloading
            ? CircularProgressIndicator()
            : Text('Add', style: TextStyle(color: Colors.black, fontSize: 20)),
      ),
    );
  }
}
