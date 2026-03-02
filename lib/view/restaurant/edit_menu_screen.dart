import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saimpex_vendor/utils/widgets/common_background.dart';

class EditMenuScreen extends StatefulWidget {
  final String itemId;
  final String initialNameEn;
  final String initialNameAr;
  final String initialNameFr;

  const EditMenuScreen({
    super.key,
    required this.itemId,
    this.initialNameEn = 'Zesty Chicken Burger',
    this.initialNameAr = 'برجر دجاج حار ولذيذ',
    this.initialNameFr = 'Burger au poulet épicé',
  });

  @override
  State<EditMenuScreen> createState() => _EditMenuScreenState();
}

class _EditMenuScreenState extends State<EditMenuScreen> {
  late TextEditingController _nameEnCtrl;
  late TextEditingController _nameArCtrl;
  late TextEditingController _nameFrCtrl;
  late TextEditingController _descEnCtrl;
  late TextEditingController _descArCtrl;
  late TextEditingController _descFrCtrl;
  late TextEditingController _prepTimeCtrl;
  late TextEditingController _priceCtrl;
  late TextEditingController _discountPriceCtrl;

  String _selectedCategory = 'Fast food';
  String _selectedIsVeg = 'No';
  String _selectedTag = 'New Arrival';

  final List<String> _categories = [
    'Fast food',
    'Chinese',
    'Soups',
    'Desserts',
  ];
  final List<String> _vegOptions = ['Yes', 'No'];
  final List<String> _tags = [
    'New Arrival',
    'Best Seller',
    'Popular',
    'Special',
  ];

  // Images selected from gallery
  final List<XFile> _uploadedImages = [];

  @override
  void initState() {
    super.initState();
    _nameEnCtrl = TextEditingController(text: widget.initialNameEn);
    _nameArCtrl = TextEditingController(text: widget.initialNameAr);
    _nameFrCtrl = TextEditingController(text: widget.initialNameFr);
    _descEnCtrl = TextEditingController(
      text:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text.',
    );
    _descArCtrl = TextEditingController(
      text:
          'لوريم إيسوم هو نص تجريبي يُستخدم في صناعات الطباعة والنشر. ولقد أصبح لوريم إيسوم النص القياسي المستخدم في هذه الصناعة.',
    );
    _descFrCtrl = TextEditingController(
      text:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text.',
    );
    _prepTimeCtrl = TextEditingController(text: '20 Min');
    _priceCtrl = TextEditingController(text: '20 MRU');
    _discountPriceCtrl = TextEditingController(text: '10 MRU');
  }

  @override
  void dispose() {
    _nameEnCtrl.dispose();
    _nameArCtrl.dispose();
    _nameFrCtrl.dispose();
    _descEnCtrl.dispose();
    _descArCtrl.dispose();
    _descFrCtrl.dispose();
    _prepTimeCtrl.dispose();
    _priceCtrl.dispose();
    _discountPriceCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickImages() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> picked = await picker.pickMultiImage(imageQuality: 80);
    if (picked.isNotEmpty) {
      setState(() {
        _uploadedImages.addAll(picked);
      });
    }
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
          'Edit Menu',
          style: GoogleFonts.rubik(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1F1F1F),
          ),
        ),
        centerTitle: false,
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Item Name (English) ──────────────────────────────
            _fieldLabel('Item Name (English)'),
            const SizedBox(height: 6),
            _textField(controller: _nameEnCtrl, hint: 'Zesty Chicken Burger'),
            const SizedBox(height: 16),

            // ── Item Name (Arabic) ──────────────────────────────
            _fieldLabel('Item Name (Arabic)'),
            const SizedBox(height: 6),
            _textField(
              controller: _nameArCtrl,
              hint: 'برجر دجاج حار ولذيذ',
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 16),

            // ── Item Name (French) ──────────────────────────────
            _fieldLabel('Item Name (French)'),
            const SizedBox(height: 6),
            _textField(controller: _nameFrCtrl, hint: 'Burger au poulet épicé'),
            const SizedBox(height: 16),

            // ── Category + Is Veg ────────────────────────────────
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _fieldLabel('Category'),
                      const SizedBox(height: 6),
                      _dropdownField(
                        value: _selectedCategory,
                        items: _categories,
                        onChanged: (v) =>
                            setState(() => _selectedCategory = v!),
                        height: 46,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _fieldLabel('Is Veg'),
                      const SizedBox(height: 6),
                      _dropdownField(
                        value: _selectedIsVeg,
                        items: _vegOptions,
                        onChanged: (v) => setState(() => _selectedIsVeg = v!),
                        height: 46,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // ── Description (English) ────────────────────────────
            _fieldLabel('Description (English)'),
            const SizedBox(height: 6),
            _textAreaField(
              controller: _descEnCtrl,
              hint: 'Enter description in English...',
            ),
            const SizedBox(height: 16),

            // ── Description (Arabic) ─────────────────────────────
            _fieldLabel('Description (Arabic)'),
            const SizedBox(height: 6),
            _textAreaField(
              controller: _descArCtrl,
              hint: 'أدخل الوصف بالعربية...',
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 16),

            // ── Description (French) ─────────────────────────────
            _fieldLabel('Description (French)'),
            const SizedBox(height: 6),
            _textAreaField(
              controller: _descFrCtrl,
              hint: 'Entrez la description en français...',
            ),
            const SizedBox(height: 16),

            // ── Tags ─────────────────────────────────────────────
            _fieldLabel('Tags'),
            const SizedBox(height: 6),
            _dropdownField(
              value: _selectedTag,
              items: _tags,
              onChanged: (v) => setState(() => _selectedTag = v!),
              height: 46,
              width: 358,
            ),
            const SizedBox(height: 16),

            // ── Preparation Time ─────────────────────────────────
            _fieldLabel('Preparation Time (minutes)'),
            const SizedBox(height: 6),
            _textField(
              controller: _prepTimeCtrl,
              hint: '20 Min',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),

            // ── Price + Discount Price ───────────────────────────
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _fieldLabel('Price'),
                      const SizedBox(height: 6),
                      _textField(
                        controller: _priceCtrl,
                        hint: '20 MRU',
                        keyboardType: TextInputType.number,
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
                      const SizedBox(height: 6),
                      _textField(
                        controller: _discountPriceCtrl,
                        hint: '10 MRU',
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // ── Item Image ───────────────────────────────────────
            _fieldLabel('Item Image'),
            const SizedBox(height: 6),
            GestureDetector(
              onTap: _pickImages,
              child: Container(
                width: 358,
                height: 117,
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0xFFE5E5E5),
                    width: 2,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.upload_outlined,
                      color: Color(0xFF94A3B8),
                      size: 22,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Upload image here',
                      style: GoogleFonts.rubik(
                        fontSize: 12,
                        color: const Color(0xFF94A3B8),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),

            // ── Uploaded Image Thumbnails ─────────────────────────
            if (_uploadedImages.isNotEmpty)
              SizedBox(
                height: 64,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _uploadedImages.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    return Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            File(_uploadedImages[index].path),
                            width: 64,
                            height: 64,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Container(
                              width: 64,
                              height: 64,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF1F5F9),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Icons.image,
                                color: Color(0xFF94A3B8),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: -6,
                          right: -6,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _uploadedImages.removeAt(index);
                              });
                            },
                            child: Container(
                              width: 18,
                              height: 18,
                              decoration: const BoxDecoration(
                                color: Color(0xFFFF5216),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 11,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

            const SizedBox(height: 24),

            // ── Reset + Submit ────────────────────────────────────
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Reset
                SizedBox(
                  width: 119,
                  height: 40,
                  child: OutlinedButton(
                    onPressed: () {
                      _nameEnCtrl.text = widget.initialNameEn;
                      _nameArCtrl.text = widget.initialNameAr;
                      _nameFrCtrl.text = widget.initialNameFr;
                      _prepTimeCtrl.text = '20 Min';
                      _priceCtrl.text = '20 MRU';
                      _discountPriceCtrl.text = '10 MRU';
                      setState(() {
                        _selectedCategory = 'Fast food';
                        _selectedIsVeg = 'No';
                        _selectedTag = 'New Arrival';
                      });
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Color(0xFFE5E5E5),
                        width: 1,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: Colors.white,
                    ),
                    child: Text(
                      'Reset',
                      style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1F1F1F),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Submit
                SizedBox(
                  width: 189,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: submit edit
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
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  // ── Helpers ────────────────────────────────────────────────────────────────

  Widget _fieldLabel(String label) {
    return Text(
      label,
      style: GoogleFonts.rubik(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: const Color(0xFF64748B),
      ),
    );
  }

  Widget _textField({
    required TextEditingController controller,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    TextAlign textAlign = TextAlign.start,
  }) {
    return SizedBox(
      width: 358,
      height: 52,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        textAlign: textAlign,
        style: GoogleFonts.rubik(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF1F1F1F),
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.rubik(
            fontSize: 13,
            color: const Color(0xFF94A3B8),
          ),
          filled: true,
          fillColor: Colors.white,
          isDense: true,
          contentPadding: const EdgeInsets.fromLTRB(16, 13, 16, 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFE5E5E5), width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFE5E5E5), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFFF5216), width: 1),
          ),
        ),
      ),
    );
  }

  Widget _textAreaField({
    required TextEditingController controller,
    required String hint,
    TextAlign textAlign = TextAlign.start,
  }) {
    return SizedBox(
      width: 358,
      height: 89,
      child: TextFormField(
        controller: controller,
        textAlign: textAlign,
        maxLines: null,
        expands: true,
        style: GoogleFonts.rubik(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF1F1F1F),
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.rubik(
            fontSize: 12,
            color: const Color(0xFF94A3B8),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.fromLTRB(16, 13, 16, 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFE5E5E5), width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFE5E5E5), width: 1),
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
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
    double height = 52,
    double? width,
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: DropdownButtonFormField<String>(
        value: value,
        onChanged: onChanged,
        isExpanded: true,
        icon: const Icon(
          Icons.keyboard_arrow_down,
          color: Color(0xFF94A3B8),
          size: 20,
        ),
        style: GoogleFonts.rubik(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF1F1F1F),
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          isDense: true,
          contentPadding: const EdgeInsets.fromLTRB(16, 13, 8, 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFE5E5E5), width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFE5E5E5), width: 1),
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
