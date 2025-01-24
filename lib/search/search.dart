import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Search extends StatefulWidget {
  @override
  _Search createState() => _Search();
}

class _Search extends State<Search> {
  TextEditingController search = TextEditingController();
  TextEditingController datec = TextEditingController();
  DateTime? date;

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
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "filter options",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                ElevatedButton(
                  onPressed: _exitModal,
                  child: Text('Apply Filters'),
                ),
              ],
            ),
          );
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
            // SizedBox(height: 16,),
            // ElevatedButton(onPressed: _performSearch, child: Text("search")),
          ],
        ),
      ),
    );
  }
}
