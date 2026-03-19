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
    final confirmBtn = Padding(
      padding: EdgeInsets.all(spacing),
      child: ElevatedButton(
        onPressed: () => debugPrint('成功です'),
        child: Text('確認'),
      ),
    );

    final amountField = buildFormComboBox('金額');
    final payField = buildFormDropDown('支払方法');

    final header = Text('支出記録');

    final form = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [amountField, payField, confirmBtn],
    );

    final formCont = Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),

      padding: EdgeInsets.all(spacing),
      width: double.infinity,
      margin: EdgeInsets.all(spacing),
      child: form,
    );

    final footer = Container(child: Text('毎日の支出をスマートに管理しましょう'));

    final appContents = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [header, formCont, footer],
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('支出管理アプリ'), backgroundColor: Colors.teal),
        body: Center(child: appContents),
      ),
    );
  }

  Widget buildFormComboBox(String lblText) {
    final List<String> items = ['1000', '2000', '5000'];

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('金額'),
          DropdownMenu<String>(
            initialSelection: items.first,
            label: Text('${lblText}を選択または入力'),
            expandedInsets: EdgeInsets.zero,
            onSelected: (String? value) {
              setState(() {
                _amountValue = value!;
              });
            },
            dropdownMenuEntries:
                items.map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry<String>(value: value, label: value);
                }).toList(),
          ),
        ],
      ),
    );
  }

  Widget buildFormDropDown(String lblText) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(lblText),
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
            onChanged: (String? newValue) {
              setState(() {
                _selectedPayTypeText = newValue!;
              });
            },
          ),
        ],
      ),
    );
  }
}
