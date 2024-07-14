import 'package:flutter/material.dart';

class OnOffControl extends StatefulWidget {
  final String title;
  final bool initStatus;
  final Color decorationColor;

  const OnOffControl(
      {super.key,
      required this.title,
      required this.initStatus,
      required this.decorationColor});

  @override
  State<OnOffControl> createState() => _OnOffControlState();
}

class _OnOffControlState extends State<OnOffControl> {
  bool status = false;

  @override
  void initState() {
    super.initState();
    status = widget.initStatus;
  }

  @override
  Widget build(BuildContext context) {
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
                  setState(() {
                    status = value;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
