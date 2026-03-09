import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saimpex_vendor/generated/l10n.dart';
import 'package:saimpex_vendor/utils/widgets/common_background.dart';
import 'package:get/get.dart';
import 'package:saimpex_vendor/controller/profile_controller.dart';
import 'package:saimpex_vendor/Utils/Utils.dart';

class AddItemsScreen extends StatefulWidget {
  const AddItemsScreen({super.key});

  @override
  State<AddItemsScreen> createState() => _AddItemsScreenState();
}

class _AddItemsScreenState extends State<AddItemsScreen> {
  final TextEditingController _prepTimeCtrl = TextEditingController();
  final TextEditingController _serialNumberCtrl = TextEditingController();
  final TextEditingController _maxQuantityCtrl = TextEditingController();
  final TextEditingController _priceCtrl = TextEditingController();
  final TextEditingController _discountPriceCtrl = TextEditingController();

  String? _selectedType;
  String? _selectedTag;
  String? _selectedAttribute;

  final List<String> _types = ['Type 1', 'Type 2', 'Type 3'];
  final List<String> _tags = ['New Arrival', 'Best Seller', 'Popular'];
  final List<String> _attributes = [
    'Attribute 1',
    'Attribute 2',
    'Attribute 3',
  ];

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
    _prepTimeCtrl.clear();
    _serialNumberCtrl.clear();
    _maxQuantityCtrl.clear();
    _priceCtrl.clear();
    _discountPriceCtrl.clear();
    setState(() {
      _selectedType = null;
      _selectedTag = null;
      _selectedAttribute = null;
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
          S.of(context).addItemsTitle,
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
            _fieldLabel(S.of(context).itemTypeLabel),
            const SizedBox(height: 8),
            _dropdownField(
              value: _selectedType,
              hint: S.of(context).selectTypeHint,
              items: _types,
              onChanged: (v) => setState(() => _selectedType = v),
              fullWidth: true,
            ),
            const SizedBox(height: 20),

            _fieldLabel(S.of(context).preparationTimeMinutesLabel),
            const SizedBox(height: 8),
            _textField(
              controller: _prepTimeCtrl,
              hint: S.of(context).enterMinutesHint,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),

            _fieldLabel(S.of(context).tagsLabel),
            const SizedBox(height: 8),
            _dropdownField(
              value: _selectedTag,
              hint: S.of(context).selectTagHint,
              items: _tags,
              onChanged: (v) => setState(() => _selectedTag = v),
              fullWidth: true,
            ),
            const SizedBox(height: 20),

            _fieldLabel(S.of(context).attributeLabel),
            const SizedBox(height: 8),
            _dropdownField(
              value: _selectedAttribute,
              hint: S.of(context).selectAttributeHint,
              items: _attributes,
              onChanged: (v) => setState(() => _selectedAttribute = v),
              fullWidth: true,
            ),
            const SizedBox(height: 20),

            _fieldLabel(S.of(context).serialNoLabel), // serialNumberLabel
            const SizedBox(height: 8),
            _textField(
              controller: _serialNumberCtrl,
              hint: S.of(context).enterSerialNumberHint,
            ),
            const SizedBox(height: 20),

            _fieldLabel(S.of(context).maxAllowedQuantityLabel),
            const SizedBox(height: 8),
            _textField(
              controller: _maxQuantityCtrl,
              hint: S.of(context).enterMaxQuantityHint,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _fieldLabel(S.of(context).priceLabel),
                      const SizedBox(height: 8),
                      _textField(
                        controller: _priceCtrl,
                        hint: S.of(context).enterPriceHint,
                        keyboardType: TextInputType.number,
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
                      _fieldLabel(S.of(context).discountPriceLabel),
                      const SizedBox(height: 8),
                      _textField(
                        controller: _discountPriceCtrl,
                        hint: S.of(context).enterDiscountPriceHint,
                        keyboardType: TextInputType.number,
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
                    S.of(context).resetButton,
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
                    if (_selectedAttribute == null) {
                      showToast(context, "Please select attribute");
                      return;
                    }
                    if (_priceCtrl.text.isEmpty) {
                      showToast(context, "Please enter price");
                      return;
                    }

                    final profileController = Get.find<ProfileController>();
                    profileController.addGroceryMenuItem(
                      context,
                      menuId: "1", // Placeholder Menu ID
                      attributeValue: "2", // Placeholder
                      groceryAttributeId: "5", // Placeholder
                      price: _priceCtrl.text,
                      discountPrice: _discountPriceCtrl.text.isNotEmpty
                          ? _discountPriceCtrl.text
                          : _priceCtrl.text,
                      quantityAllowed: _maxQuantityCtrl.text.isNotEmpty
                          ? _maxQuantityCtrl.text
                          : "10",
                      serialNumber: _serialNumberCtrl.text.isNotEmpty
                          ? _serialNumberCtrl.text
                          : "SN-${DateTime.now().millisecondsSinceEpoch}",
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF5216),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    S.of(context).submitButton,
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
