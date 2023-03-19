import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(),
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
        hintText: 'Search',
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 18,
        ),
        contentPadding: EdgeInsets.zero,
        prefixIcon: const Icon(Icons.search),
      ),
      onChanged: (val) {},
    );
  }
}
