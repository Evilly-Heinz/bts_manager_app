import 'dart:async';

import 'package:bts_manager_app/backend/api_request/center_control_manager.dart';
import 'package:bts_manager_app/models/center_control.dart';
import 'package:bts_manager_app/models/center_control_status.dart';
import 'package:bts_manager_app/page/components/detail_alert.dart';
import 'package:bts_manager_app/page/components/detail_status.dart';
import 'package:bts_manager_app/providers/authentication.provider.dart';
import 'package:bts_manager_app/providers/mqtt.provider.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart'; // Import the package that contains the Carousel class

import 'components/status_quick_view.dart';

class CenterControlDetail extends StatefulWidget {
  final String centerControlId;
  const CenterControlDetail({required this.centerControlId, super.key});

  @override
  State<CenterControlDetail> createState() => _CenterControlDetailState();
}

class _CenterControlDetailState extends State<CenterControlDetail> {
  final CarouselController _controller = CarouselController();
  late CenterControlManager centerControlManager;
  CenterControl? centerControl;
  StreamSubscription<CenterControlStatus>? subscription;
  MQTTClientProvider? mqttClientProvider;
  @override
  void initState() {
    super.initState();
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    centerControlManager = CenterControlManager(authProvider.getAccessToken()!);
    mqttClientProvider =
        Provider.of<MQTTClientProvider>(context, listen: false);
    subscription = mqttClientProvider?.centerControl.listen((event) {
      if (event.centerControlId == centerControl?.code) {
        print('Update centerControl');
        setState(() {
          centerControl?.status?.copyWith(event.toJson());
        });
      }
    });
  }

  @override
  void dispose() {
    cancelSubscription();
    super.dispose();
  }

  cancelSubscription() async {
    if (centerControl != null && mqttClientProvider != null) {
      mqttClientProvider?.unsubscribe(centerControl!);
    }
    await subscription?.cancel();
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
      body: centerControl == null
          ? FutureBuilder<CenterControl>(
              future:
                  centerControlManager.getCenterControl(widget.centerControlId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  centerControl = snapshot.data;
                  if (centerControl == null) {
                    return const Center(
                      child: Text('No data'),
                    );
                  }
                  Provider.of<MQTTClientProvider>(context, listen: false)
                      .subscribe(centerControl!);
                  return CenterControlView(
                      controller: _controller, centerControl: centerControl);
                }
              },
            )
          : CenterControlView(
              controller: _controller, centerControl: centerControl),
    );
  }
}

class CenterControlView extends StatelessWidget {
  const CenterControlView({
    super.key,
    required CarouselController controller,
    required this.centerControl,
  }) : _controller = controller;

  final CarouselController _controller;
  final CenterControl? centerControl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: CarouselSlider(
            carouselController: _controller,
            options: CarouselOptions(
              autoPlay: false,
              viewportFraction: 1,
              height: double.infinity,
            ),
            items: [
              StatusQuickView(centerControl: centerControl!),
              DetailAlert(centerControl: centerControl!),
              DetailStatus(centerControl: centerControl!),
            ],
          ),
        ),
        Positioned(
          left: 5,
          top: MediaQuery.of(context).size.height / 2 - 24,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0x80FFFFFF),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(1, 2),
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                size: 24,
              ),
              onPressed: () {
                _controller.previousPage();
              },
            ),
          ),
        ),
        Positioned(
          right: 5,
          top: MediaQuery.of(context).size.height / 2 - 24,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0x80FFFFFF),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(1, 2),
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_forward,
                size: 24,
              ),
              onPressed: () {
                _controller.nextPage();
              },
            ),
          ),
        ),
      ],
    );
  }
}
