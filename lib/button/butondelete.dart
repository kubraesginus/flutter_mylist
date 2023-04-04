import 'package:flutter/material.dart';

class DeleteButton extends StatelessWidget {
  final String text;
  final void Function()? onpressed;

  const DeleteButton({
    super.key,
    required this.text,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle;
    return IconButton(
      onPressed: onpressed,
      icon: Icon(Icons.delete_forever),
      color: Colors.white,
    );
  }
}
