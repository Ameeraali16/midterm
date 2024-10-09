import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hehe/launch_model.dart';
import 'package:hehe/my_list_tile.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  Future<List<Launch>> fetchAllLaunch() async { //decodes json http response to Launch model 

    final response = await http.get(Uri.parse('https://api.spacexdata.com/v3/missions'));
  
    print(response.body);
    if (response.statusCode == 200) {
       jsonDecode(response.body) ;
      Map<String,dynamic> jsonResponse = jsonDecode(response.body);
      
      List jsonLaunch = jsonResponse['mission_name']; //extracting from jsonResponse 
      
      return jsonLaunch.map((launchj) => Launch.fromJson(launchj)).toList();
      print('done!')
    } else {
      throw Exception('Failed to load ');
    }
  }
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      
      home: Scaffold(
        appBar: AppBar(
            title: const Text('Launch'),
        ),

         body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: FutureBuilder(
            future: fetchAllLaunch(), 
            builder: (context, snapshot) {

              if (snapshot.hasError){
                return const Center(child: Text('Error Retrieving Data'),);
              } else if (!snapshot.hasData){
                return const Center(child: Text('No Data To Retrieve'),);
              } else if(snapshot.hasData){

                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color.fromARGB(255, 231, 222, 222), width: 1), 
                          borderRadius: BorderRadius.circular(10), 
                        ),
                        child: Column(
                          children: [
                            MyListTile(
                              missionName: (snapshot.data as List<Launch>)[index].missionName,
                              description: (snapshot.data as List<Launch>)[index].description,
                             
                              
                            ),
                          
                          ],
                        ),
                      ),
                    );
                  }, 
                );
              } else{
                return const Center(child: Text('Confusion'),);
              }
              
          
        
  }),
         )
      ),
    );
  }
}
