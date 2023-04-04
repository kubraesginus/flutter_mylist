import 'package:flutter/material.dart';

class IstatisticButton extends StatelessWidget {
  final Text;
  final void Function()? onpressed;

  const IstatisticButton({
    super.key,
    required this.Text,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle;
    return ElevatedButton(
      onPressed: onpressed,
      child: Icon(Icons.align_vertical_bottom_sharp),
    );
  }
}
