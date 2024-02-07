import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: buildOutLineInputBorder(),
        focusedBorder: buildOutLineInputBorder(),
        hintText: 'Search',
        suffixIcon: IconButton(
          icon: const Opacity(
              opacity: 0.8, child: Icon(FontAwesomeIcons.magnifyingGlass)),
          onPressed: () {},
        ),
      ),
    );
  }

  OutlineInputBorder buildOutLineInputBorder() =>
      OutlineInputBorder(borderRadius: BorderRadius.circular(12));
}
