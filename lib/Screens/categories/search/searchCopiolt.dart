import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/components/constants.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:url_launcher/url_launcher.dart';

class MedicalSearchWidget extends StatefulWidget {
  @override
  _MedicalSearchWidgetState createState() => _MedicalSearchWidgetState();
}

class _MedicalSearchWidgetState extends State<MedicalSearchWidget> {
  final TextEditingController _typeAheadController = TextEditingController();
  final Stream<QuerySnapshot> _medicalStream =
      FirebaseFirestore.instance.collection('allMedical').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: FittedBox(
          fit: BoxFit.contain,
          child: Row(
            children: [
              Text(
                'جميع الجهات الطبية',
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
                    labelText: " بحث عن جهة طبية...",
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
                                  icon: Icon(Icons.map),
                                  onPressed: () {
                                    _openInGoogleMaps(data['address']);
                                  },
                                )
                              ],
                            ),
                            subtitle: Text(
                              data['address'],
                              style: kCardSubtitleTextStyle,
                            ),
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
}
