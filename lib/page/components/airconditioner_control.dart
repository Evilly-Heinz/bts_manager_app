import 'package:flutter/material.dart';

typedef AirconditionerControlSateChange = void Function(
    double temperature, bool status);
class AirconditionerControl extends StatefulWidget {
  final double initTemperature;
  final bool initStatus;
  final String title;
  final Color decorationColor;
  final bool readOnly;
  final AirconditionerControlSateChange? onControlSateChange;
  const AirconditionerControl(
      {super.key,
      this.initTemperature = 16,
      this.initStatus = true,
      required this.title,
      required this.decorationColor,
      this.readOnly = false,
      this.onControlSateChange});

  @override
  State<AirconditionerControl> createState() => _AirconditionerControlState();
}

class _AirconditionerControlState extends State<AirconditionerControl> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double temperature = widget.initTemperature;
    bool status = widget.initStatus;
    return Card(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            transform: const GradientRotation(-0.5),
            colors: [
              Colors.white,
              Colors.white,
              widget.decorationColor //Color(0xFFCAFEBE),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
          child: Column(
            children: [
              ListTile(
                title: Text(widget.title),
                contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              ),
              SwitchListTile(
                title: Text(status ? 'Bật' : 'Tắt',
                    style: const TextStyle(fontSize: 18)),
                contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                value: status,
                activeColor: Colors.blue,
                onChanged: (value) {
                  if (widget.readOnly) {
                    return;
                  }
                  widget.onControlSateChange?.call(temperature, !status);
                },
              ),
              ListTile(
                title: const Text('Nhiệt độ', style: TextStyle(fontSize: 18)),
                contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                trailing: Card(
                  color: Theme.of(context).buttonTheme.colorScheme!.onPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          if (widget.readOnly) {
                            return;
                          }
                          if (temperature >= 16.5) {
                              temperature -= 0.5;
                            widget.onControlSateChange
                                ?.call(temperature, status);
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
                        child: Text(
                          temperature.toStringAsFixed(1),
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          if (widget.readOnly) {
                            return;
                          }
                          if (temperature <= 29.5) {
                            temperature += 0.5;
                            widget.onControlSateChange
                                ?.call(temperature, status);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
