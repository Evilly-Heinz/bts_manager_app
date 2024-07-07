import 'package:bts_manager_app/models/center_control.dart';
import 'package:flutter/material.dart';

class BtsListPage extends StatefulWidget {
  const BtsListPage({super.key});

  @override
  State<BtsListPage> createState() => _BtsListPageState();
}

class _BtsListPageState extends State<BtsListPage> {
  List<CenterControl> centerControlList =
      []; // Define the centerControlList variable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BTS List'),
      ),
      body: ListView.builder(
        itemCount: centerControlList.length,
        itemBuilder: (context, index) {
          final centerControl = centerControlList[index];
          return ListTile(
            title: Text(centerControl.name),
            subtitle: Text(centerControl.location.fullAddress),
            trailing: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.phone),
                SizedBox(width: 8),
                Icon(Icons.email),
                SizedBox(width: 8),
                Icon(Icons.location_on),
              ],
            ),
          );
        },
      ),
    );
  }
}
