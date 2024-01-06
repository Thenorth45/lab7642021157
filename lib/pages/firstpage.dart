import 'package:flutter/material.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({super.key});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  List<String> sex = ["ชาย", "หญิง", "LGBT+"];
  String _selectedItem = "ชาย";

  List<listItem> prefix = [
    listItem("boy", "เด็กชาย"),
    listItem("girl", 'เด็กหญิง'),
    listItem("miss", 'หญิง'),
    listItem("Mr", 'ชาย'),
  ];

  List<DropdownMenuItem<listItem>> _dropdownmenuitem = [];
  listItem? _seclectedprefix;

  List<DropdownMenuItem<listItem>> builddropdownmenuitem(
      List<listItem> prefix) {
    List<DropdownMenuItem<listItem>> item = [];
    for (listItem pf in prefix) {
      item.add(DropdownMenuItem(value: pf, child: Text(pf.name)));
    }
    return item;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dropdownmenuitem = builddropdownmenuitem(prefix);
    _seclectedprefix = _dropdownmenuitem[0].value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Lab7",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 108, 211, 68),
          ),
        ),
        elevation: 10,
        backgroundColor: Color.fromARGB(255, 10, 82, 4),
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          Text('เลือกเพศ',style: TextStyle(fontSize: 30)),
          DropdownButton(
            value: _selectedItem,
            items: sex.map((item) {
              return DropdownMenuItem(
                child: Text(item),
                value: item,
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedItem = value!;
              });
            },
          ),
          Divider(),
          Text('คำนำหน้า',style: TextStyle(fontSize: 30)),
          DropdownButton(
            value: _seclectedprefix,
            items: _dropdownmenuitem,
            onChanged: (value) {
              setState(() {
                _seclectedprefix = value;
              });
            },
          )
        ],
      ),
    );
  }
}

class listItem {
  String value;
  String name;
  listItem(this.value, this.name);
}