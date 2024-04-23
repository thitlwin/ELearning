import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 5,
        backgroundColor: Colors.cyanAccent,
        // valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
      ),
    );
  }
}
