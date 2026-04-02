import 'package:flutter/material.dart';

class Model extends StatefulWidget {
  const Model({super.key});


	

  @override
  State<Model> createState() => _ModelState();
}

class _ModelState extends State<Model> {
  final double spacing = 20;
  String _selectedPayTypeText = 'Suica';
  String _amountValue = '1000';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('支出管理アプリ', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '支出記録',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade700,
                ),
              ),
              Container(
                padding: EdgeInsets.all(spacing),
                margin: EdgeInsets.all(spacing),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildFormComboBox('金額'),
                    SizedBox(height: spacing),
                    _buildFormDropDown('支払方法'),
                    SizedBox(height: spacing),
                    _buildConfirmButton(),
                  ],
                ),
              ),
              Text(
                '毎日の支出をスマートに管理しましょう',
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildConfirmButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          debugPrint('保存: $_amountValue 円 / 方法: $_selectedPayTypeText');
        },
        child: const Text(
          '確認',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildFormComboBox(String lblText) {
    const items = ['1000', '2000', '5000'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(lblText, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        DropdownMenu<String>(
          initialSelection: items.first,
          label: Text('$lblTextを選択または入力'),
          expandedInsets: EdgeInsets.zero,
          onSelected: (value) => setState(() => _amountValue = value!),
          dropdownMenuEntries:
              items.map((value) {
                return DropdownMenuEntry<String>(value: value, label: value);
              }).toList(),
        ),
      ],
    );
  }

  Widget _buildFormDropDown(String lblText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(lblText, style: const TextStyle(fontWeight: FontWeight.bold)),
        DropdownButton<String>(
          isExpanded: true,
          value: _selectedPayTypeText,
          items:
              ['Suica', 'PayPay', '現金'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
          onChanged:
              (newValue) => setState(() => _selectedPayTypeText = newValue!),
        ),
      ],
    );
  }
}
