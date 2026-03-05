import 'package:flutter/material.dart';

class LoginLanguageDropdown extends StatelessWidget {
  const LoginLanguageDropdown({
    super.key,
    required this.topPadding,
    required this.currentLanguageCode,
    required this.onLanguageChanged,
  });

  final double topPadding;
  final String currentLanguageCode;
  final ValueChanged<String> onLanguageChanged;

  String _getLanguageName(String code) {
    if (code == 'ar') return 'Arabic';
    if (code == 'fr') return 'French';
    return 'English';
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: topPadding + 10,
      right: 20,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          color: const Color(0xFFFFD8CC),
          borderRadius: BorderRadius.circular(10),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: _getLanguageName(currentLanguageCode),
            items: const [
              DropdownMenuItem(
                value: 'English',
                child: Text(
                  'English ',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DropdownMenuItem(
                value: 'Arabic',
                child: Text(
                  'Arabic',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DropdownMenuItem(
                value: 'French',
                child: Text(
                  'French',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
            onChanged: (value) {
              if (value != null) {
                onLanguageChanged(value);
              }
            },
            icon: const Icon(
              Icons.expand_more,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
