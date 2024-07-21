import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobScaffold;
  final Widget webScaffold;
  const ResponsiveLayout({super.key, required this.mobScaffold, required this.webScaffold});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,Constraints){
      if(Constraints.maxWidth<1100){
        return mobScaffold;

      } else{
        return webScaffold;
      }
    });
  }
}