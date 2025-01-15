import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../components/constants.dart';
import '../../providers/vacations_provider.dart';
import '../categories/pharmacies/regions.dart';

class ShowVacation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text(
          'بيان رصيد الإجازات',
          style: kReusableTextStyle,
        ),
        // leading:
        //   Row(
        //     children: [SizedBox(width:5),
        //       Container(width: 40.0,color: Colors.white, child: androidDropdown()),
        //     ],
        //   ),
        actions: [
          TextButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (builder) {
                      return new Container(
                        height: 250.0,
                        color: Colors
                            .transparent, //could change this to Color(0xFF737373),
                        //so you don't have to change MaterialApp canvasColor
                        child: new Container(
                            decoration: new BoxDecoration(
                                color: Colors.white,
                                borderRadius: new BorderRadius.only(
                                    topLeft: const Radius.circular(10.0),
                                    topRight: const Radius.circular(10.0))),
                            child: new Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  new Text(
                                    "عدد أيام العارضة : 7 أيام",
                                    style: kCardTextStyle,
                                  ),
                                ],
                              ),
                            )),
                      );
                    });
              },
              child: Row(
                children: [
                  Icon(
                    Icons.calendar_month,
                    color: Colors.deepPurple[600],
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Shimmer.fromColors(
                    period: const Duration(seconds: 2),
                    direction: ShimmerDirection.rtl,
                    baseColor: Colors.white,
                    highlightColor: Colors.deepPurple[300]!,
                    child: Text(
                      'ضبط رصيد السنوى',
                      style: kReusableTextStyle.copyWith(fontSize: 12),
                    ),
                  ),
                ],
              ))
        ],
      ),
      body: DataListWidget(),
    );
  }
}

class DataListWidget extends StatefulWidget {
  @override
  _DataListWidgetState createState() => _DataListWidgetState();
}

class _DataListWidgetState extends State<DataListWidget> {
  final TextEditingController _controller = TextEditingController();
  DateTime? _selectedDate;
  String chooseDay = 'اختر اليوم';
  String _filterText = '';
  int listTileCount = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _filterText = 'سنوى';
                  listTileCount = 0;
                });
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(
                //     content: Text('Total ListTiles: $listTileCount'),
                //     behavior: SnackBarBehavior.floating,
                //     margin: EdgeInsets.only(top: 30),
                //   ),
                // );
                Future.delayed(Duration(seconds: 2), () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.purple,
                      // content: Text('Total ListTiles: $listTileCount'),
                      content: Text(
                        'عدد أيام السنوى التى أخذتها هى $listTileCount',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.only(top: 30),
                    ),
                  );
                });
              },
              // }, child: Container( padding: EdgeInsets.all(16), color: Colors.red, child: Text('Value3', style: TextStyle(color: Colors.white)),
              child: Container(
                width: 80.0, height: 50,
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                // padding: EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  color:
                      _filterText == 'سنوى' ? Colors.purple[900] : Colors.grey,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Text(
                    'سنوى',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _filterText = 'عارضة';
                  listTileCount = 0;
                });
                Future.delayed(Duration(seconds: 2), () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.purple,
                      // content: Text('Total ListTiles: $listTileCount'),
                      content: Text(
                        'عدد أيام العارضة المتبقية ${7 - listTileCount}',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.only(top: 30),
                    ),
                  );
                });
              },
              // }, child: Container( padding: EdgeInsets.all(16), color: Colors.red, child: Text('Value3', style: TextStyle(color: Colors.white)),
              child: Container(
                width: 80.0, height: 50,
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                // padding: EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  color:
                      _filterText == 'عارضة' ? Colors.purple[900] : Colors.grey,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Text(
                    'عارضة',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _filterText = 'ساعات';
                  listTileCount = 0;
                });
              },
              // }, child: Container( padding: EdgeInsets.all(16), color: Colors.red, child: Text('Value3', style: TextStyle(color: Colors.white)),
              child: Container(
                width: 80.0, height: 50,
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                // padding: EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  color:
                      _filterText == 'ساعات' ? Colors.purple[900] : Colors.grey,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Text(
                    'ساعات',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ]),
          Expanded(
            child: Consumer<DataModel>(
              builder: (context, dataModel, child) {
                //add this variable to show results based on filtered list
                final filteredItems = dataModel.items.where((item) {
                  return item['data']!
                      .toLowerCase()
                      .contains(_filterText.toLowerCase());
                }).toList();

                return ListView.builder(
                  //original line to show all
                  // itemCount: dataModel.items.length,
                  //to show results based on the title search
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) {
                    // final item = dataModel.items[index];
                    final item = filteredItems[index];
                    // final formattedDate = DateFormat('yyyy-MM-dd')
                    //     .format(DateTime.parse(item['date'] ?? ''));
                    final formattedDate = DateFormat.yMMMd('ar')
                        .format(DateTime.parse(item['date'] ?? ''));
                    listTileCount++;
                    print(listTileCount);
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        leading: Icon(Icons.event, color: Colors.blueGrey),
                        title: Text(
                          item['data'] ?? '',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontFamily: "ElMessiri",
                          ),
                        ),
                        subtitle: Text(
                          formattedDate,
                          style: kCardSubtitleTextStyle.copyWith(fontSize: 16),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            Provider.of<DataModel>(context, listen: false)
                                .removeItem(index);
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  chooseDay,
                  style: kReusableTextStyle.copyWith(
                    color: Colors.purple,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        _selectedDate = pickedDate;
                        chooseDay = pickedDate.toString().substring(0, 10);
                      });
                    }
                  },
                ),
                Spacer(),
                // Text('نوع الإجازة'),
                specialDropdown(),
                // ElevatedButton(
                //   onPressed: () {
                //     String text = _controller.text;
                //     if (text.isNotEmpty && _selectedDate != null) {
                //       Provider.of<DataModel>(context, listen: false)
                //           .addItem(_selectedDate!, text);
                //       _controller.clear();
                //       setState(() {
                //         _selectedDate = null;
                //       });
                //     }
                //   },
                //   child: Text('أضف'),
                // ),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                // String text = _controller.text;
                if (_selectedDate != null && selectedSpecial != 'نوع الإجازة') {
                  Provider.of<DataModel>(context, listen: false)
                      .addItem(_selectedDate!, selectedSpecial!);
                  // _controller.clear();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.purple,
                      content: Text(
                        'تمت إضافة اليوم بنجاح',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      duration: Duration(seconds: 3),
                    ),
                  );
                  setState(() {
                    _selectedDate = null;
                    chooseDay = 'اختر اليوم';
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.purple,
                      content: Text(
                        'برجاء اختيار اليوم ونوع الإجازة أولا',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      duration: Duration(seconds: 3),
                    ),
                  );
                }
              },
              child: Container(
                child: Center(
                    child: Text(
                  'أضف',
                  style: kReusableTextStyle,
                )),
                width: 100.0,
                height: 50.0,
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(10)),
              )),
        ],
      ),
    );
  }

  String? selectedSpecial = 'نوع الإجازة';

  DropdownButton<String> specialDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in vacationType) {
      var newItem = DropdownMenuItem(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              currency,
              style: kCardTextStyle,
              // TextStyle(
              //     color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18.0),
              textAlign: TextAlign.end,
              // textDirection: TextDirection.rtl,
            ),
          ],
        ),
        value: currency,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedSpecial,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedSpecial = value;
          print(selectedSpecial);
          // getData();
        });
      },
    );
  }
}
