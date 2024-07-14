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
        const SizedBox(height: 16),
        Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          // Specify the desired height
          child: Center(
            child: Container(
              height: 32,
              alignment: Alignment.center,
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
        const SizedBox(height: 8),
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
                      color: Colors.white,
                      index: 0,
                    ),
                    CardData(
                      title: 'Độ ẩm',
                      value: centerControl.status?.humidity,
                      unit: '%',
                      icon: Symbols.humidity_percentage_rounded,
                      color: Colors.white,
                      index: 1,
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
                      color: Colors.white,
                      index: 2,
                    ),
                    CardData(
                      title: 'Nguồn điện DC',
                      value: centerControl.status?.dcVoltage1,
                      unit: 'V',
                      value2: centerControl.status?.dcCurrent1,
                      unit2: 'A',
                      icon: Symbols.battery_charging_full_rounded,
                      color: Colors.white,
                      index: 3,
                    )
                  ],
                ),
                const SizedBox(height: 8),
                AdaptiveGrid(
                  children: [
                    CardData(
                      title: 'Nguồn điện AC',
                      value: centerControl.status?.acVoltagePhase1,
                      unit: 'V',
                      value2: centerControl.status?.acCurrentPhase1,
                      unit2: 'A',
                      icon: Symbols.power_rounded,
                      color: Colors.white,
                      index: 4,
                    ),
                    // powerSource(context)
                    CardData(
                      title: 'Nguồn cấp điện',
                      value: 0,
                      stringValue: getPowerSource(),
                      unit: '',
                      icon: getPowerSourceIcon(),
                      color: Colors.white,
                      index: 5,
                    ),
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

  String getPowerSource() {
    switch (centerControl.status!.acPowerSupply) {
      case ACPowerSupply.grid:
        return "Điện lưới";
      case ACPowerSupply.generator:
        return "Máy phát";
      case ACPowerSupply.ups:
        return "UPS";
      default:
        return "N/A";
    }
  }

  SizedBox powerSource(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 1, 118, 213), Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 8.0, 16, 12),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nguồn cấp điện",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.white)),
                    const SizedBox(height: 12),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.3),
                            spreadRadius: 0,
                            blurRadius: 1,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Wrap(
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                            decoration: BoxDecoration(
                              color: centerControl.status!.acPowerSupply ==
                                      ACPowerSupply.grid
                                  ? Colors.white
                                  : Theme.of(context)
                                      .buttonTheme
                                      .colorScheme
                                      ?.onPrimary,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20)),
                            ),
                            child: Text(
                              "Điện lưới",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color:
                                        centerControl.status!.acPowerSupply ==
                                                ACPowerSupply.grid
                                            ? Colors.white
                                            : Colors.black,
                                  ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                            decoration: BoxDecoration(
                              color: centerControl.status!.acPowerSupply ==
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
                                    color:
                                        centerControl.status!.acPowerSupply ==
                                                ACPowerSupply.generator
                                            ? Colors.white
                                            : Colors.black,
                                  ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                            decoration: BoxDecoration(
                              color: centerControl.status!.acPowerSupply ==
                                      ACPowerSupply.ups
                                  ? Colors.blue
                                  : Theme.of(context)
                                      .buttonTheme
                                      .colorScheme
                                      ?.onPrimary,
                              borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                            ),
                            child: Text(
                              "UPS",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color:
                                        centerControl.status!.acPowerSupply ==
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
      ),
    );
  }

  IconData getPowerSourceIcon() {
    switch (centerControl.status!.acPowerSupply) {
      case ACPowerSupply.grid:
        return Icons.power_rounded;
      case ACPowerSupply.generator:
        return Icons.wind_power_rounded;
      case ACPowerSupply.ups:
        return Icons.battery_charging_full_rounded;
      default:
        return Icons.error_rounded;
    }
  }
}
