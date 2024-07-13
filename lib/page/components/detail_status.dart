import 'package:bts_manager_app/models/center_control.dart';
import 'package:bts_manager_app/models/center_control_status.dart';
import 'package:flutter/material.dart';

class DetailStatus extends StatelessWidget {
  final CenterControl centerControl;

  const DetailStatus({super.key, required this.centerControl});

  @override
  Widget build(BuildContext context) {
    if (centerControl.status == null) {
      return const Center(
        child: Text("data is not available"),
      );
    }
    final CenterControlStatus status = centerControl.status!;
    return Column(
      children: [
        Text(
          'Trạng thái chi tiết ${centerControl.name}',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
            child: Column(
              children: [
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          'Nhiệt độ',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        tileColor: const Color.fromARGB(255, 229, 241, 242),
                        contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      ),
                      ListTile(
                        title: const Text('Nhiệt độ trong phòng'),
                        trailing: Text(
                          status.indoorTemperature != null
                              ? ('${status.indoorTemperature!.toStringAsFixed(1)}℃')
                              : 'N/A',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      ),
                      const Divider(),
                      ListTile(
                        title: const Text('Nhiệt độ ngoài trời'),
                        trailing: Text(
                          status.outdoorTemperature != null
                              ? ('${status.outdoorTemperature!.toStringAsFixed(1)}℃')
                              : 'N/A',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      ),
                      const Divider(),
                      ListTile(
                        title: const Text('Nhiệt độ bộ điều khiển'),
                        trailing: Text(
                          status.closetTemperature1 != null
                              ? ('${status.closetTemperature1!.toStringAsFixed(1)}℃')
                              : 'N/A',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      ),
                      const Divider(),
                      ListTile(
                        title: const Text('Nhiệt độ máy lạnh 1'),
                        trailing: Text(
                          status.closetTemperature2 != null
                              ? ('${status.closetTemperature2!.toStringAsFixed(1)}℃')
                              : 'N/A',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      ),
                      const Divider(),
                      ListTile(
                        title: const Text('Nhiệt độ máy lạnh 2'),
                        trailing: Text(
                          status.closetTemperature3 != null
                              ? ('${status.closetTemperature3!.toStringAsFixed(1)}℃')
                              : 'N/A',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(children: [
                      ListTile(
                        title: Text(
                          'Nguồn AC',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        tileColor: const Color.fromARGB(255, 229, 241, 242),
                        contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      ),
                      ListTile(
                        title: const Text('Điện áp tổng'),
                        trailing: Text(
                          status.acVoltagePhase1 != null
                              ? ('${status.acVoltagePhase1!.toStringAsFixed(1)}V')
                              : 'N/A',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      ),
                      ListTile(
                        title: const Text('Dòng điện tổng'),
                        trailing: Text(
                          status.acVoltagePhase1 != null
                              ? ('${status.acCurrentPhase1!.toStringAsFixed(1)}A')
                              : 'N/A',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      ),
                      ListTile(
                        title: const Text('Tần số tổng'),
                        trailing: Text(
                          status.acVoltagePhase1 != null ? ('25Hz') : 'N/A',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      ),
                      const Divider(),
                      ListTile(
                        title: const Text('Điện áp máy lạnh 1'),
                        trailing: Text(
                          status.acVoltagePhase1 != null
                              ? ('${status.acVoltagePhase2!.toStringAsFixed(1)}V')
                              : 'N/A',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      ),
                      ListTile(
                        title: const Text('Dòng điện máy lạnh 1'),
                        trailing: Text(
                          status.acVoltagePhase1 != null
                              ? ('${status.acCurrentPhase2!.toStringAsFixed(1)}A')
                              : 'N/A',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      ),
                      const Divider(),
                      ListTile(
                        title: const Text('Điện áp máy lạnh 2'),
                        trailing: Text(
                          status.acVoltagePhase1 != null
                              ? ('${status.acVoltagePhase3!.toStringAsFixed(1)}V')
                              : 'N/A',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      ),
                      ListTile(
                        title: const Text('Dòng điện máy lạnh 2'),
                        trailing: Text(
                          status.acVoltagePhase1 != null
                              ? ('${status.acCurrentPhase3!.toStringAsFixed(1)}A')
                              : 'N/A',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      ),
                    ])),
                const SizedBox(height: 16),
                Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(children: [
                      ListTile(
                        title: Text(
                          'Nguồn DC',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        tileColor: const Color.fromARGB(255, 229, 241, 242),
                        contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      ),
                      ListTile(
                        title: const Text('Điện áp nguồn 1'),
                        trailing: Text(
                          status.dcVoltage1 != null
                              ? ('${status.dcVoltage1!.toStringAsFixed(1)}V')
                              : 'N/A',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      ),
                      ListTile(
                        title: const Text('Dòng điện nguồn 1'),
                        trailing: Text(
                          status.dcCurrent1 != null
                              ? ('${status.dcCurrent1!.toStringAsFixed(1)}A')
                              : 'N/A',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      ),
                      const Divider(),
                      ListTile(
                        title: const Text('Điện áp nguồn 2'),
                        trailing: Text(
                          status.dcVoltage2 != null
                              ? ('${status.dcVoltage2!.toStringAsFixed(1)}V')
                              : 'N/A',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      ),
                      ListTile(
                        title: const Text('Dòng điện nguồn 2'),
                        trailing: Text(
                          status.dcCurrent2 != null
                              ? ('${status.dcCurrent2!.toStringAsFixed(1)}A')
                              : 'N/A',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      ),
                      const Divider(),
                      ListTile(
                        title: const Text('Điện áp nguồn 3'),
                        trailing: Text(
                          status.dcVoltage3 != null
                              ? ('${status.dcVoltage3!.toStringAsFixed(1)}V')
                              : 'N/A',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      ),
                      ListTile(
                        title: const Text('Dòng điện nguồn 3'),
                        trailing: Text(
                          status.dcCurrent3 != null
                              ? ('${status.dcCurrent3!.toStringAsFixed(1)}A')
                              : 'N/A',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      ),
                      const Divider(),
                      ListTile(
                        title: const Text('Điện áp nguồn 4'),
                        trailing: Text(
                          status.dcVoltage4 != null
                              ? ('${status.dcVoltage4!.toStringAsFixed(1)}V')
                              : 'N/A',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      ),
                      ListTile(
                        title: const Text('Dòng điện nguồn 4'),
                        trailing: Text(
                          status.dcCurrent4 != null
                              ? ('${status.dcCurrent4!.toStringAsFixed(1)}A')
                              : 'N/A',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      ),
                    ])),
              ],
            ),
          ),
        )
      ],
    );
  }
}
