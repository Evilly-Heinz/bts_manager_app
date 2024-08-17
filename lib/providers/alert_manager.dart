import 'package:bts_manager_app/models/alert_notification.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart'; // Add this line to import the 'fluttertoast' package

class AlertManager extends ChangeNotifier {
  List<AlertMessage> alerts = [];

  // Add methods and logic for managing alerts

  void addAlert(AlertMessage alert) {
    if (alerts.length >= 50) {
      alerts.removeRange(0, alerts.length - 49);
    }
    alerts.add(alert);
    notifyListeners();
    Fluttertoast.showToast(msg: alert.message);
  }

  void clearAlerts() {
    alerts.clear();
    notifyListeners();
  }

  void removeAlert(int index) {
    alerts.removeAt(index);
    notifyListeners();
  }
}

  // toastification.show(
	//   context: context,
	//   type: ToastificationType.error,
	//   style: ToastificationStyle.flat,
	//   title: Text("090"),
	//   description: Text(""),
	//   alignment: Alignment.bottomCenter,
	//   autoCloseDuration: const Duration(seconds: 3),
	//   animationBuilder: (
	//     context,
	//     animation,
	//     alignment,
	//     child,
	//   ) {
	//     return ScaleTransition(
	//       scale: animation,
	//       child: child,
	//     );
	//   },
	//   foregroundColor: Color(0xff000000),
	//   icon: Icon(Iconsax.ticket_expired_copy),
	//   borderRadius: BorderRadius.circular(12.0),
	//   showProgressBar: true,
	//   dragToClose: true,
	//   pauseOnHover: false,
	//   applyBlurEffect: true,
	// );
