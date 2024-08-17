import 'package:bts_manager_app/backend/api_request/center_control_manager.dart';
import 'package:bts_manager_app/backend/api_request/setting_manager.dart';
import 'package:bts_manager_app/models/alert_notification.dart';
import 'package:bts_manager_app/models/center_control.dart';
import 'package:bts_manager_app/models/setting.dart';
import 'package:bts_manager_app/page/bts_details.dart';
import 'package:bts_manager_app/page/components/blinking_icon.dart';
import 'package:bts_manager_app/providers/authentication.provider.dart';
import 'package:bts_manager_app/providers/mqtt.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BtsListPage extends StatefulWidget {
  const BtsListPage({super.key});

  @override
  State<BtsListPage> createState() => _BtsListPageState();
}

class _BtsListPageState extends State<BtsListPage>
    with SingleTickerProviderStateMixin {
  List<CenterControl> centerControlList = [];
  List<String> alertCenter = [];
  late CenterControlManager centerControlManager;
  @override
  void initState() {
    super.initState();
    fetchCenterControlList();
    initClient();
  }

  Future<void> initClient() async {
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    Setting setting;
    if (authProvider.getSetting() == null) {
      SettingMgr settingMgr = SettingMgr(authProvider.getAccessToken()!);
      setting = await settingMgr.getSetting();
      authProvider.setSetting(setting);
    } else {
      setting = authProvider.getSetting()!;
    }
    if (mounted) {
      final mqttProvider =
          Provider.of<MQTTClientProvider>(context, listen: false);
      await mqttProvider.connect(setting);
    }
  }

  Future<List<CenterControl>> fetchCenterControlList() async {
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    centerControlManager = CenterControlManager(authProvider.getAccessToken()!);
    final data = await centerControlManager.searchCenterControls();
    setState(() {
      centerControlList = data;
    });
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4, // Add elevation for box shadow effect
        shadowColor: Colors.grey, // Set the shadow color
        // Add other properties of the AppBar
        centerTitle: true,
        title: Center(
          child: Image.asset(
            'assets/images/business1619078246-MobiFone.png',
            width: 200,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
      body:
          Consumer<MQTTClientProvider>(builder: (context, mqttProvider, child) {
        return StreamBuilder<AlertMessage>(
          stream: mqttProvider.alert,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active &&
                snapshot.hasData) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (!alertCenter.contains(snapshot.data!.centerControlId)) {
                  setState(() {
                    alertCenter.add(snapshot.data!.centerControlId);
                  });
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Row(
                      children: [
                        snapshot.data!.icon,
                        const SizedBox(width: 8),
                        Text(
                          "Trạm ${snapshot.data!.centerControlId}: ${snapshot.data!.message}",
                          style: TextStyle(
                              color: snapshot.data!.severity == 'error'
                                  ? Colors.red
                                  : Colors.blueAccent),
                        ),
                      ],
                    ),
                    backgroundColor: Colors.white,
                  ),
                );
              });
            }
            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(8.0, 16, 8, 0),
                  child: Text(
                    'Danh sách trạm',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                        child: FutureBuilder<List<CenterControl>>(
                          future: centerControlManager.searchCenterControls(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.hasError) {
                              return Center(
                                child: Text('Error: ${snapshot.error}'),
                              );
                            } else {
                              final centerControlList = snapshot.data;
                              return ListView.builder(
                                itemCount: centerControlList!.length,
                                itemBuilder: (context, index) {
                                  final centerControl =
                                      centerControlList[index];
                                  return Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  CenterControlDetail(
                                                      centerControlId:
                                                          centerControl.id),
                                            ),
                                          );
                                        },
                                        child: ListTile(
                                          title: Text(
                                              '${centerControl.name} - (${centerControl.code})'),
                                          minVerticalPadding: 0,
                                          subtitle: Text(centerControl
                                              .location.fullAddress),
                                          leading: centerControl
                                                      .lastStatusError ||
                                                  alertCenter.contains(
                                                      centerControl.code)
                                              ? const BlinkingIcon(
                                                  children: [
                                                    Icon(
                                                      Icons.cell_tower_rounded,
                                                      color: Color(0xFFE23636),
                                                      size: 32,
                                                    ),
                                                    Icon(
                                                      Icons.cell_tower_rounded,
                                                      color: Color(0xFF007E33),
                                                      size: 32,
                                                    ),
                                                  ],
                                                )
                                              : const Icon(
                                                  Icons.cell_tower_rounded,
                                                  color: Color(0xFF007E33),
                                                  size: 32,
                                                ),
                                        ),
                                      ),
                                      Divider(
                                        color: Colors.grey[300],
                                        thickness: 1,
                                        indent: 0,
                                        height: 0,
                                      )
                                    ],
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      }),
    );
  }
}

class AlertSnackbar extends StatelessWidget {
  const AlertSnackbar({super.key});

  @override
  Widget build(BuildContext context) {
    // Listen to WebSocket messages
    return Consumer<MQTTClientProvider>(
      builder: (context, mqttProvider, child) {
        return StreamBuilder<AlertMessage>(
          stream: mqttProvider.alert,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active &&
                snapshot.hasData) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Row(
                      children: [
                        snapshot.data!.icon,
                        const SizedBox(width: 8),
                        Text(
                          "Trạm ${snapshot.data!.centerControlId}: ${snapshot.data!.message}",
                          style: TextStyle(
                              color: snapshot.data!.severity == 'error'
                                  ? Colors.red
                                  : Colors.blueAccent),
                        ),
                      ],
                    ),
                    backgroundColor: Colors.white,
                  ),
                );
              });
            }
            return const SizedBox.shrink(); // Return an empty widget
          },
        );
      },
    );
  }
}
