import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_taipei_park_example/parklist/parkspot_dto.dart';
import 'package:flutter_taipei_park_example/parklist/parkspot_list_item_dto.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_taipei_park_example/generated/i18n.dart';

class ParkSpotListPage extends StatefulWidget {
  ParkSpotListPage({Key key}) : super(key: key);

  @override
  _ParkSpotListPageState createState() => new _ParkSpotListPageState();
}

class _ParkSpotListPageState extends State<ParkSpotListPage> {
  final String asset_image_loading = "images/loading_park.jpeg";
  List<ParkSpotListItemDTO> items = [];

  @override
  void initState() {
    super.initState();
    fetchAllParkSpot();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(S.of(context).app_name),
      ),
      body: new Container(
        child: new ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext ctxt, int index) =>
                buildBody(ctxt, index)),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: (() => fetchAllParkSpot()),
        tooltip: 'Refresh',
        child: new Icon(Icons.refresh),
      ),
    );
  }

  Widget buildBody(BuildContext ctxt, int index) {
    ParkSpotListItemDTO item = items[index];
    double itemWidth = MediaQuery.of(context).size.width;
    double imageHeight = itemWidth * 0.65;

    Widget image = FadeInImage.assetNetwork(
      placeholder: asset_image_loading,
      image: item.Image,
      width: itemWidth,
      height: imageHeight,
      fit: BoxFit.cover,
    );
    Widget textArea = new Container(
        color: Colors.white,
        child: new Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 16.0),
          child: new Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Text(
                    item.Name,
                    style: new TextStyle(color: Colors.black45, fontSize: 24.0),
                  ),
                ],
              ),
              new Row(
                children: <Widget>[
                  new Text(item.ParkName,
                      style:
                          new TextStyle(color: Colors.black38, fontSize: 14.0)),
                ],
              ),
            ],
          ),
        ));

    return new Card(
      child: new Container(
          child: new Column(
        children: <Widget>[image, textArea],
      )),
      elevation: 4.0,
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
    );
  }

  Map<String, dynamic> getDecodedMap(var jsonData) {
    debugPrint(jsonData);
    Map<String, dynamic> decodeMap = json.decode(jsonData);
    return decodeMap;
  }

  fetchAllParkSpot() async {
    var rid = "bf073841-c734-49bf-a97f-3757a6013812";
    var url =
        "http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=$rid";
    debugPrint('getAllParkData(), url=$url');
    final response = await http.get(url);
    if (response.statusCode == HttpStatus.OK) {
      ParkSpotDTO resultDTO = ParkSpotDTO.fromJson(getDecodedMap(response.body));
      setState(() {
        items = resultDTO.result.results;
      });
    } else {
      throw Exception('Failed to load park data');
    }
  }

}
