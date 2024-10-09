import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final String? missionName;
  final String? description;
  final List<String>? payloadIds;
 

  const MyListTile(
      {super.key,
      required this.missionName,
      required this.description, this.payloadIds,
      
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        missionName!,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Text(payloadIds),

        ],
      ),
    );
  }
}