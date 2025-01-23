import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
          width: screenWidth * 0.8,
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              border: const OutlineInputBorder(),
              hintText: 'Enter a search term',
              hintStyle: const TextStyle(color: Colors.grey), 
            ),
          ),
        ),
      ),
    );
  }
}