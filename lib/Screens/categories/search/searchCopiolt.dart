import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/components/constants.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class MedicalSearchWidget extends StatefulWidget {
  @override
  _MedicalSearchWidgetState createState() => _MedicalSearchWidgetState();
}

class _MedicalSearchWidgetState extends State<MedicalSearchWidget> {
  final TextEditingController _typeAheadController = TextEditingController();
  String _selectedFilter = '';

  Future<void> deleteDuplicateDocuments() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final CollectionReference medicalCollection =
        firestore.collection('allMedical');

    final QuerySnapshot querySnapshot = await medicalCollection.get();

    Map<String, String> uniqueNames = {};

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      String docId = doc.id;
      String name = doc['finalName'];

      if (uniqueNames.containsKey(name)) {
        await medicalCollection.doc(docId).delete();
        print('Deleted duplicate document with ID: $docId');
      } else {
        uniqueNames[name] = docId;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _medicalStream = FirebaseFirestore.instance
        .collection('allMedical')
        .orderBy('name')
        .orderBy('region')
        .where('type',
            isEqualTo: _selectedFilter.isNotEmpty ? _selectedFilter : null)
        .snapshots();
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //     child: Icon(Icons.add),
      //     onPressed: () {
      //       deleteDuplicateDocuments();
      //     }),
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: FittedBox(
          fit: BoxFit.contain,
          child: Row(
            children: [
              Text(
                'جميع الجهات الطبية 2025',
                style: kReusableTextStyle,
              ),
              // SizedBox(width:10.0),Container(width: 40.0,color: Colors.white, child: androidDropdown()),
            ],
          ),
        ),
        // leading:
        //   Row(
        //     children: [SizedBox(width:5),
        //       Container(width: 40.0,color: Colors.white, child: androidDropdown()),
        //     ],
        //   ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TypeAheadField(
              textFieldConfiguration: TextFieldConfiguration(
                // autofocus: true,
                controller: _typeAheadController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText:
                        " بحث عن مستشفى ، صيدلية ، معامل تحاليل ، مركز أشعة...",
                    prefixIcon: Icon(Icons.search)),
              ),
              suggestionsCallback: (pattern) async {
                return await _getFilteredResults(pattern);
              },
              itemBuilder: (context, Map<String, dynamic> suggestion) {
                return ListTile(
                  title: Text(suggestion['finalName']),
                  subtitle: Text(
                    suggestion['address'],
                    style: kCardSubtitleTextStyle,
                  ),
                );
              },
              onSuggestionSelected: (Map<String, dynamic> suggestion) {
                _typeAheadController.text = suggestion['finalName'];
              },
              // onSelected: (Map<String, dynamic> value) {},
            ),
            SizedBox(height: 10.0),
            Container(
              height: 40.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildFilterContainer('مستشفى'),
                  _buildFilterContainer('صيدلية'),
                  _buildFilterContainer('معامل تحاليل'),
                  _buildFilterContainer('مركز أشعة'),
                  _buildFilterContainer('أسنان'),
                  _buildFilterContainer('نظارات'),
                  _buildFilterContainer('باطنة'),
                  _buildFilterContainer('الصدر'),
                  _buildFilterContainer('القلب'),
                  _buildFilterContainer('العظام'),
                  _buildFilterContainer('الرمد'),
                  _buildFilterContainer('الأطفال'),
                  _buildFilterContainer('العلاج الطبيعى'),
                  _buildFilterContainer('نفسية وعصبية'),
                  _buildFilterContainer('أنف وأذن وحنجرة'),
                  _buildFilterContainer('جراحة عامة'),
                  _buildFilterContainer('جراحة الوجه والفكين'),
                  _buildFilterContainer('جراحة الأوعية الدموية'),
                  _buildFilterContainer('جراحة المخ والأعصاب'),
                  _buildFilterContainer('جراحة المسالك البولية'),
                  _buildFilterContainer('التخاطب'),
                  _buildFilterContainer('الأطفال والتخاطب'),
                  _buildFilterContainer('أجهزة تعويضية'),
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _medicalStream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final results = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: results.length,
                    itemBuilder: (context, index) {
                      final data =
                          results[index].data() as Map<String, dynamic>;
                      return Column(
                        children: [
                          ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(data['finalName'],
                                    style:
                                        kCardTextStyle.copyWith(fontSize: 16)),
                                // IconButton(
                                //   icon: Icon(
                                //     Icons.call,
                                //     color: Colors.purple[900],
                                //   ),
                                //   onPressed: () async {
                                //     var _phone = data['tel1'];
                                //     final Uri url =
                                //         Uri(scheme: "tel", path: _phone);
                                //     await launchUrl(url);
                                //   },
                                // ),
                                // IconButton(
                                //   icon: Icon(
                                //     Icons.my_location,
                                //     color: Colors.purple[900],
                                //   ),
                                //   onPressed: () {
                                //     _openInGoogleMaps(
                                //         data['finalName'] + data['address']);
                                //   },
                                // )
                              ],
                            ),
                            subtitle: Text(
                              data['address'],
                              style: kCardSubtitleTextStyle,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.call,
                                  color: Colors.purple[900],
                                ),
                                onPressed: () async {
                                  var _phone = data['tel1'];
                                  final Uri url =
                                      Uri(scheme: "tel", path: _phone);
                                  await launchUrl(url);
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.my_location,
                                  color: Colors.purple[900],
                                ),
                                onPressed: () {
                                  _openInGoogleMaps(
                                      data['finalName'] + data['address']);
                                },
                              ),
                              IconButton(
                                onPressed: () {
                                  // print(data.docs[index]['name'] +   ' والعنوان هو ' + data.docs[index]['address']+' ورقم التليفون '+ data.docs[index]['tel1'] );
                                  Share.share(
                                    (data['finalName'] +
                                        ' والعنوان هو ' +
                                        data['address'] +
                                        ' ورقم التليفون ' +
                                        data['tel1']),
                                  );
                                },
                                icon: FaIcon(
                                  FontAwesomeIcons.shareNodes,
                                  color: Colors.orange[900],
                                ),
                              ),
                            ],
                          ),
                          Divider(height: 1.0),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<Map<String, dynamic>>> _getFilteredResults(String query) async {
    final result = await FirebaseFirestore.instance
        .collection('allMedical')
        .where('finalName', isGreaterThanOrEqualTo: query)
        .where('finalName', isLessThanOrEqualTo: query + '\uf8ff')
        .get();
    return result.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }

  void _openInGoogleMaps(String address) async {
    final url =
        Uri.parse('https://www.google.com/maps/search/?api=1&query=$address');
    await launchUrl(url);
  }

  Widget _buildFilterContainer(String filter) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedFilter = filter;
          print(_selectedFilter);
        });
      },
      child: Container(
        width: 80.0,
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          color: _selectedFilter == filter ? Colors.purple[900] : Colors.grey,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            filter,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
