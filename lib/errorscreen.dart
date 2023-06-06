import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final FlutterErrorDetails errorDetails;

  CustomErrorWidget(this.errorDetails, {super.key});

  @override
  Widget build(BuildContext context) {
    // Customize the error widget based on the errorDetails
    return const Scaffold(

      body: Center(
        child: CircularProgressIndicator()
        ),

    );
  }
}
