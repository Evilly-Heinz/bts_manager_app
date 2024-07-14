import 'package:bts_manager_app/backend/api_request/center_control_manager.dart';
import 'package:bts_manager_app/models/center_control.dart';
import 'package:bts_manager_app/page/components/detail_alert.dart';
import 'package:bts_manager_app/page/components/detail_status.dart';
import 'package:bts_manager_app/providers/authentication.provider.dart';
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
  @override
  void initState() {
    super.initState();
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    centerControlManager = CenterControlManager(authProvider.getAccessToken()!);
  }

  Future<CenterControl> fetchCenterControl() async {
    final data =
        await centerControlManager.getCenterControl(widget.centerControlId);
    setState(() {
      centerControl = data;
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
      body: FutureBuilder<CenterControl>(
        future: centerControlManager.getCenterControl(widget.centerControlId),
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
            CenterControl? centerControl = snapshot.data;
            if (centerControl == null) {
              return const Center(
                child: Text('No data'),
              );
            }
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(28, 16, 28, 16),
                  child: CarouselSlider(
                    carouselController: _controller,
                    options: CarouselOptions(
                      autoPlay: false,
                      viewportFraction: 1,
                      height: double.infinity,
                    ),
                    items: [
                      StatusQuickView(centerControl: centerControl),
                      DetailAlert(centerControl: centerControl),
                      DetailStatus(centerControl: centerControl),
                    ],
                  ),
                ),
                Positioned(
                  left: 12,
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
                  right: 12,
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
        },
      ),
    );
  }
}
