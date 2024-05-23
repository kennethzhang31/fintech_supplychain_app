import 'package:flutter/material.dart';
import 'package:fintech_/widgets/sidebar_menu.dart';

class mySearchBar extends StatefulWidget{
  const mySearchBar ({super.key});

  @override
  State<mySearchBar> createState(){
    return _mySearchBar();
  }
}

class _mySearchBar extends State<mySearchBar>{

  List<Map<String, dynamic>> allUsers = [
    {'id': 1, 'username': 'Zheng\'s Electronics', 'type': 'buy'},
    {'id': 2, 'username': 'SoundSavvy Electronics', 'type': 'buy'},
    {'id': 3, 'username': 'TechTune Hub', 'type': 'buy'},
    {'id': 4, 'username': 'ElectroBeat Emporium', 'type': 'buy'},
    {'id': 5, 'username': 'RubberLink Enterprises', 'type': 'supply'},
    {'id': 6, 'username': 'Duraflex Technologies', 'type': 'supply'},
    {'id': 7, 'username': 'SiliconWorks Inc.', 'type': 'supply'},
    {'id': 8, 'username': 'SonicGadgets Emporium', 'type': 'buy'},
    {'id': 9, 'username': 'Super Duper Electronics', 'type': 'buy'},
    {'id': 10, 'username': 'MagneXcel Technologies', 'type': 'supply'},
  ];

  List<Map<String, dynamic>> foundUser = [];

  @override
  void initState(){
    super.initState();
    foundUser = allUsers;
  }

  void _runFilter(String keyword){
    
    List<Map<String, dynamic>> results = [];
    if (keyword.isEmpty){
      results = allUsers;
    }
    else{
      results = allUsers
        .where((user) => user['username'].toLowerCase().contains(keyword.toLowerCase()))
        .toList();
    }

    setState(() {
      foundUser = results;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text')
      ),
      drawer: const sidebarDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                labelText: 'Search', suffixIcon: Icon(Icons.search), 
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: foundUser.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: const Color.fromARGB(255, 70, 111, 120),
                      key: ValueKey(foundUser[index]['id']),
                      elevation: 3,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        leading: Text(
                          foundUser[index]['id'].toString(),
                          style: const TextStyle(fontSize: 18, color: Colors.white)
                        ),
                        title: Text(
                          foundUser[index]['username'],
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          'Looking to ${foundUser[index]['type']}',
                          style: TextStyle(color: foundUser[index]['type'] == 'buy' ? const Color.fromARGB(255, 118, 161, 240) : const Color.fromARGB(255, 23, 204, 68)),
                        ),
                      
                      ),
                    );
                  }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}