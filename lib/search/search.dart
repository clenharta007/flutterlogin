import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Search extends StatefulWidget {
  @override
  _Search createState() => _Search();
}

class _Search extends State<Search> {
  TextEditingController search = TextEditingController();
  TextEditingController datec = TextEditingController();

  String _selectedOption = "Option 1";
  List<Map<String, dynamic>> data = [];
  List<Map<String, dynamic>> sr = [];

  DateTime? date;

  Future<void> loadData() async {
    final String response =
        await rootBundle.loadString("assets/json/random_data_2000_2020.json");
    final List<dynamic> raw = jsonDecode(response);
    // DateTime defaultDate = DateTime(1970, 1, 1);

    setState(() {
      data = raw.map((item) {
        return {
          "title": item["title"],
          "desc": item["description"],
          "date": item["date"]
        };
      }).toList();
    });
  }

  void _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000), // Earliest selectable date
      lastDate: DateTime(2101), // Latest selectable date
    );

    if (pickedDate != null) {
      setState(() {
        datec.text = DateFormat('yyyy-MM-dd').format(pickedDate);
        date = pickedDate;
      });
    }
  }

  void _exitModal() {
    var t = datec.text;
    print("Selected Date: $t");
    print("Selected Date: $date");

    Navigator.pop(context);
  }

  void _filterSettings() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return Container(
                  padding: EdgeInsets.all(16),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "filter options",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: datec,
                        readOnly: true,
                        decoration: InputDecoration(
                            labelText: "select date",
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.calendar_today)),
                        onTap: _pickDate,
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Row(
                                children: [
                                  Radio<String>(
                                    value: 'Option 1',
                                    groupValue: _selectedOption,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _selectedOption = value!;
                                      });
                                    },
                                  ),
                                  Text('Option 1'),
                                ],
                              ),
                              Row(
                                children: [
                                  Radio<String>(
                                    value: 'Option 2',
                                    groupValue: _selectedOption,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _selectedOption = value!;
                                      });
                                    },
                                  ),
                                  Text('Option 2'),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: _exitModal,
                        child: Text('Apply Filters'),
                      ),
                    ],
                  ),
                );
              }));
        });
  }

  void _performSearch() {
    String query = search.text;
    var t = datec.text;
    String? formattedDate =
        date != null ? DateFormat('yyyy-MM-dd').format(date!) : null;

    // Replace this with your search logic
    print('Search Query: $query');
    print('Selected Date: $t ');
    print('Selected Date: $formattedDate');

    setState(() {
      if (query.isEmpty) {
        sr = data;
      } else {
        sr = data.where((e) {
          return e["title"]
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: search,
              decoration: InputDecoration(
                labelText: "Search",
                border: OutlineInputBorder(),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.filter_alt),
                      onPressed: _filterSettings,
                    ),
                    IconButton(
                        onPressed: _performSearch, icon: Icon(Icons.search)),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            if (sr.isEmpty)
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.highlight_off_rounded,
                      size: 100,
                      color: Colors.red,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Data Not found",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    Text(
                      "looking for something..???",
                      style: TextStyle(fontSize: 17, color: Colors.black54),
                    ),
                  ],
                ),
              )
            else
              Expanded(
                  child: ListView.builder(
                      itemCount: sr.length,
                      itemBuilder: (context, index) {
                        final item = sr[index];
                        return ListTile(
                          // leading: Text(item["title"]),
                          title: Text(item["title"]),
                          subtitle: Text("${item["desc"]}\n${item["date"]}"),
                          onTap: () {
                            print("${item["title"]}. tapped");
                          },
                        );
                      }))

            // Center(
            //     child: Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Icon(
            //       Icons.check_circle,
            //       size: 100,
            //       color: Colors.green,
            //     ),
            //     SizedBox(
            //       height: 10,
            //     ),
            //     Text(
            //       "Data Found",
            //       style: TextStyle(fontSize: 20, color: Colors.black),
            //     ),
            //     Text(
            //       "",
            //       style: TextStyle(fontSize: 17, color: Colors.black54),
            //     ),
            //   ],
            // )),
            // ElevatedButton(onPressed: _performSearch, child: Text("search")),
          ],
        ),
      ),
    );
  }
}
