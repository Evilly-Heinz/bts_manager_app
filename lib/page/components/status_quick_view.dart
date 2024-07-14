import 'package:bts_manager_app/models/ac_power_supply.dart';
import 'package:bts_manager_app/models/center_control.dart';
import 'package:bts_manager_app/page/components/adaptive_grid.dart';
import 'package:bts_manager_app/page/components/card_data.dart';
import 'package:bts_manager_app/page/components/generate_alert.dart';
import 'package:bts_manager_app/page/components/quick_control.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class StatusQuickView extends StatelessWidget {
  const StatusQuickView({
    super.key,
    required this.centerControl,
  });

  final CenterControl centerControl;

  @override
  Widget build(BuildContext context) {
    AlertValidation alertValidation = generateAlertMessages(
      centerControl.alert?.toJson(),
      null,
      context,
    );
    List<AlertMessage> alertMessages = alertValidation.errors;
    return Column(
      children: [
        Text(
          'Trạng thái trạm ${centerControl.name}',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          // Specify the desired height
          child: Center(
            child: Container(
              height: 32,
              alignment: Alignment.center,
              color: Colors.blue.withOpacity(0.1),
              child: Center(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: alertMessages.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                      child: alertMessages[index].icon,
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AdaptiveGrid(
                  children: [
                    CardData(
                      title: 'Nhiệt độ',
                      value: centerControl.status?.indoorTemperature,
                      unit: '℃',
                      icon: Icons.device_thermostat_rounded,
                      color: Colors.blue,
                    ),
                    CardData(
                      title: 'Độ ẩm',
                      value: centerControl.status?.humidity,
                      unit: '%',
                      icon: Symbols.humidity_percentage_rounded,
                      color: Colors.blue,
                    )
                  ],
                ),
                const SizedBox(height: 8),
                AdaptiveGrid(
                  children: [
                    CardData(
                      title: 'Nhiên luệu',
                      value: centerControl.status?.fuelLevel,
                      unit: 'lit',
                      icon: Icons.local_gas_station_rounded,
                      color: Colors.blue,
                    ),
                    CardData(
                      title: 'Nguồn điện DC',
                      value: centerControl.status?.dcVoltage1,
                      unit: 'V',
                      value2: centerControl.status?.dcCurrent1,
                      unit2: 'A',
                      icon: Symbols.battery_charging_full_rounded,
                      color: Colors.blue,
                    )
                  ],
                ),
                const SizedBox(height: 8),
                AdaptiveGrid(
                  children: [
                    CardData(
                      title: 'Nguồn điện DC',
                      value: centerControl.status?.acVoltagePhase1,
                      unit: 'V',
                      value2: centerControl.status?.acCurrentPhase1,
                      unit2: 'A',
                      icon: Symbols.power_rounded,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(12, 8.0, 16, 12),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Nguồn cấp điện",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                  const SizedBox(height: 12),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.3),
                                          spreadRadius: 0,
                                          blurRadius: 1,
                                          offset: const Offset(0, 1),
                                        ),
                                      ],
                                    ),
                                    child: Wrap(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              16, 8, 16, 8),
                                          decoration: BoxDecoration(
                                            color: centerControl.status!
                                                        .acPowerSupply ==
                                                    ACPowerSupply.grid
                                                ? Colors.blue
                                                : Theme.of(context)
                                                    .buttonTheme
                                                    .colorScheme
                                                    ?.onPrimary,
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                    bottomLeft:
                                                        Radius.circular(20)),
                                          ),
                                          child: Text(
                                            "Điện lưới",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                  color: centerControl.status!
                                                              .acPowerSupply ==
                                                          ACPowerSupply.grid
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              16, 8, 16, 8),
                                          decoration: BoxDecoration(
                                            color: centerControl.status!
                                                        .acPowerSupply ==
                                                    ACPowerSupply.generator
                                                ? Colors.blue
                                                : Theme.of(context)
                                                    .buttonTheme
                                                    .colorScheme
                                                    ?.onPrimary,
                                          ),
                                          child: Text(
                                            "Máy phát",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                  color: centerControl.status!
                                                              .acPowerSupply ==
                                                          ACPowerSupply
                                                              .generator
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              16, 8, 16, 8),
                                          decoration: BoxDecoration(
                                            color: centerControl.status!
                                                        .acPowerSupply ==
                                                    ACPowerSupply.ups
                                                ? Colors.blue
                                                : Theme.of(context)
                                                    .buttonTheme
                                                    .colorScheme
                                                    ?.onPrimary,
                                            borderRadius:
                                                const BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(20),
                                                    topRight:
                                                        Radius.circular(20)),
                                          ),
                                          child: Text(
                                            "UPS",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                  color: centerControl.status!
                                                              .acPowerSupply ==
                                                          ACPowerSupply.ups
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ])),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                QuickControl(
                  centerControl: centerControl,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
