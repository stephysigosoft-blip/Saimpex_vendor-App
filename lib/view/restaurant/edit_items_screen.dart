import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saimpex_vendor/utils/widgets/common_background.dart';

class EditItemsScreen extends StatefulWidget {
  final String itemId;

  const EditItemsScreen({super.key, required this.itemId});

  @override
  State<EditItemsScreen> createState() => _EditItemsScreenState();
}

class _EditItemsScreenState extends State<EditItemsScreen> {
  late TextEditingController _prepTimeCtrl;
  late TextEditingController _serialNumberCtrl;
  late TextEditingController _maxQuantityCtrl;
  late TextEditingController _priceCtrl;
  late TextEditingController _discountPriceCtrl;

  String? _selectedType = 'Zesty Chicken Burger'; // Pre-filled for demo
  String? _selectedTag = 'New Arrival'; // Pre-filled for demo
  String? _selectedAttribute = 'Full'; // Pre-filled for demo

  final List<String> _types = [
    'Zesty Chicken Burger',
    'Cheese Burger',
    'Veg Burger',
  ];
  final List<String> _tags = ['New Arrival', 'Best Seller', 'Popular'];
  final List<String> _attributes = ['Full', 'Half', 'Quarter'];

  @override
  void initState() {
    super.initState();
    _prepTimeCtrl = TextEditingController(text: '10 Min');
    _serialNumberCtrl = TextEditingController(text: '456');
    _maxQuantityCtrl = TextEditingController(text: '100');
    _priceCtrl = TextEditingController(text: '20 MRU');
    _discountPriceCtrl = TextEditingController(text: '10 MRU');
  }

  @override
  void dispose() {
    _prepTimeCtrl.dispose();
    _serialNumberCtrl.dispose();
    _maxQuantityCtrl.dispose();
    _priceCtrl.dispose();
    _discountPriceCtrl.dispose();
    super.dispose();
  }

  void _reset() {
    setState(() {
      _prepTimeCtrl.text = '10 Min';
      _serialNumberCtrl.text = '456';
      _maxQuantityCtrl.text = '100';
      _priceCtrl.text = '20 MRU';
      _discountPriceCtrl.text = '10 MRU';
      _selectedType = 'Zesty Chicken Burger';
      _selectedTag = 'New Arrival';
      _selectedAttribute = 'Full';
    });
  }

  @override
  Widget build(BuildContext context) {
    return CommonBackground(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20,
          ),
        ),
        title: Text(
          'Edit Item',
          style: GoogleFonts.rubik(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1F2937),
          ),
        ),
        centerTitle: false,
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _fieldLabel('Item Type'),
            const SizedBox(height: 8),
            _dropdownField(
              value: _selectedType,
              hint: 'Select type',
              items: _types,
              onChanged: (v) => setState(() => _selectedType = v),
              fullWidth: true,
            ),
            const SizedBox(height: 20),

            _fieldLabel('Preparation Time (minutes)'),
            const SizedBox(height: 8),
            _textField(controller: _prepTimeCtrl, hint: 'Enter minutes'),
            const SizedBox(height: 20),

            _fieldLabel('Tags'),
            const SizedBox(height: 8),
            _dropdownField(
              value: _selectedTag,
              hint: 'Select tag',
              items: _tags,
              onChanged: (v) => setState(() => _selectedTag = v),
              fullWidth: true,
            ),
            const SizedBox(height: 20),

            _fieldLabel('Attribute'),
            const SizedBox(height: 8),
            _dropdownField(
              value: _selectedAttribute,
              hint: 'Select attribute',
              items: _attributes,
              onChanged: (v) => setState(() => _selectedAttribute = v),
              fullWidth: true,
            ),
            const SizedBox(height: 20),

            _fieldLabel('Serial Number'),
            const SizedBox(height: 8),
            _textField(
              controller: _serialNumberCtrl,
              hint: 'Enter serial number',
            ),
            const SizedBox(height: 20),

            _fieldLabel('Maximum Allowed Quantity'),
            const SizedBox(height: 8),
            _textField(
              controller: _maxQuantityCtrl,
              hint: 'Enter maximum allowed quantity',
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _fieldLabel('Price'),
                      const SizedBox(height: 8),
                      _textField(
                        controller: _priceCtrl,
                        hint: 'Enter Price',
                        fullWidth: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _fieldLabel('Discount Price'),
                      const SizedBox(height: 8),
                      _textField(
                        controller: _discountPriceCtrl,
                        hint: 'Enter Discount Price',
                        fullWidth: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        color: Colors.white.withOpacity(0.01),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: _reset,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF1F5F9),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Reset',
                    style: GoogleFonts.rubik(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1F2937),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 2,
              child: SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: handle submit
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF5216),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Submit',
                    style: GoogleFonts.rubik(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _fieldLabel(String label) {
    return Text(
      label,
      style: GoogleFonts.rubik(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: const Color(0xFF1F2937),
      ),
    );
  }

  Widget _textField({
    required TextEditingController controller,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    bool fullWidth = true,
  }) {
    return SizedBox(
      width: fullWidth ? double.infinity : null,
      height: 48,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        style: GoogleFonts.rubik(fontSize: 14, color: const Color(0xFF1F2937)),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.rubik(
            fontSize: 14,
            color: const Color(0xFF94A3B8).withOpacity(0.6),
          ),
          filled: true,
          fillColor: Colors.white,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFF1F5F9), width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFF1F5F9), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFFF5216), width: 1),
          ),
        ),
      ),
    );
  }

  Widget _dropdownField({
    required List<String> items,
    required ValueChanged<String?> onChanged,
    String? value,
    String? hint,
    bool fullWidth = true,
  }) {
    return SizedBox(
      width: fullWidth ? double.infinity : null,
      height: 48,
      child: DropdownButtonFormField<String>(
        value: value,
        onChanged: onChanged,
        isExpanded: true,
        hint: hint != null
            ? Text(
                hint,
                style: GoogleFonts.rubik(
                  fontSize: 14,
                  color: const Color(0xFF94A3B8).withOpacity(0.6),
                ),
              )
            : null,
        icon: const Icon(
          Icons.keyboard_arrow_down,
          color: Color(0xFF94A3B8),
          size: 24,
        ),
        style: GoogleFonts.rubik(fontSize: 14, color: const Color(0xFF1F2937)),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFF1F5F9), width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFF1F5F9), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFFF5216), width: 1),
          ),
        ),
        items: items
            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
            .toList(),
      ),
    );
  }
}
