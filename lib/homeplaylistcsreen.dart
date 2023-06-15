import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePlaylistScreen extends StatefulWidget {
  const HomePlaylistScreen({Key? key}) : super(key: key);

  @override
  State<HomePlaylistScreen> createState() => _HomePlaylistScreenState();
}

class _HomePlaylistScreenState extends State<HomePlaylistScreen> {
  List<Map<String, dynamic>> users = [];
  bool isLoading = true; // Track whether data is loading or not

  // Fetch content from the json file
  Future<void> readJson() async {
    String response = await DefaultAssetBundle.of(context)
        .loadString("assets/files/playlist.json");
    final data = jsonDecode(response);
    setState(() {
      users = List<Map<String, dynamic>>.from(data["playlist"]);
      isLoading = false; // Data loaded, set isLoading to false
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Playlist',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Playlist"),
          centerTitle: true,
        ),
        backgroundColor: Colors.lightBlue,
        body: isLoading // Check if data is loading
            ? Center(
                child:
                    CircularProgressIndicator(), // Show CircularProgressIndicator if data is loading
              )
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text('Index')),
                      DataColumn(label: Text('Title')),
                      DataColumn(label: Text('Danceability')),
                      DataColumn(label: Text('Energy')),
                      DataColumn(label: Text('Mode')),
                      DataColumn(label: Text('Acousticness')),
                      DataColumn(label: Text('Tempo')),
                      DataColumn(label: Text('Duration (ms)')),
                      DataColumn(label: Text('Num Sections')),
                      DataColumn(label: Text('Num Segments')),
                    ],
                    rows: users.map((user) {
                      return DataRow(cells: [
                        DataCell(Text(user['index'].toString())),
                        DataCell(Text(user['title'] ?? '')),
                        DataCell(Text(user['danceability'].toString())),
                        DataCell(Text(user['energy'].toString())),
                        DataCell(Text(user['mode'].toString())),
                        DataCell(Text(user['acousticness'].toString())),
                        DataCell(Text(user['tempo'].toString())),
                        DataCell(Text(user['duration_ms'].toString())),
                        DataCell(Text(user['num_sections'].toString())),
                        DataCell(Text(user['num_segments'].toString())),
                      ]);
                    }).toList(),
                  ),
                ),
              ),
      ),
    );
  }
}
