// ignore_for_file: non_constant_identifier_names, require_trailing_commas

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BottomNav extends StatelessWidget {
  PageController Controller;
  BottomNav({super.key, required this.Controller});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      color: Colors.tealAccent,
      child: SizedBox(
        height: 63,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  Controller.animateToPage(0,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                },
                icon: const Icon(Icons.home)),
            const SizedBox(),
            IconButton(
                onPressed: () {
                  Controller.animateToPage(1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                },
                icon: const Icon(Icons.bookmark)),
          ],
        ),
      ),
    );
  }
}
