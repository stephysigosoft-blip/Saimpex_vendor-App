import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

String getCurrencySymbol() {
  return "MRU ";
}

savename(String key, value) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, json.encode(value));
  } catch (e) {
    throw e;
  }
}

getSavedObject(String key) async {
  final prefs = await SharedPreferences.getInstance();
  var data = prefs.getString(key);
  return data != null ? json.decode(data) : null;
}

bool get isInDebugMode {
  bool inDebugMode = false;
  assert(inDebugMode = true);
  return inDebugMode;
}

removename(String key) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  } catch (e) {
    throw e;
  }
}

showErrorMessage(error) {
  if (isInDebugMode) {
    debugPrint("Error is :$error");
  }
  if (!error.toString().contains("setState()")) {
    if (error is DioException) {
      DioException e = error;
      debugPrint("Error is :${error.response!.data}");
      var message = e.response!.data["message"];
      if (message == null) {
        message = e.response!.data["message"];
        message ??= "Oops Something went wrong try again !!";
      } else {
        message = e.response!.data["message"];
      }
      Fluttertoast.showToast(
        msg: message.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else {
      Fluttertoast.showToast(
        msg: error?.toString() ?? "Oops Something went wrong try again !!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}

void showToast(BuildContext context, String message) {
  FocusScope.of(context).requestFocus(FocusNode());
  final overlay = Overlay.of(context);

  // Calculate the position based on the keyboard visibility
  double bottomPadding = 50.0; // Default padding for toast
  if (MediaQuery.of(context).viewInsets.bottom > 0) {
    // Keyboard is visible, adjust the position
    bottomPadding = MediaQuery.of(context).viewInsets.bottom + 50.0;
  }

  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      bottom: bottomPadding, // Adjust the position of the toast
      left: MediaQuery.of(context).size.width * 0.1, // Center horizontally
      right: MediaQuery.of(context).size.width * 0.1, // Center horizontally
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.7),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  'lib/assets/images/logo.png', // Replace with your image path
                  width: 24,
                  height: 24,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  message,
                  style: GoogleFonts.rubik(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );

  overlay.insert(overlayEntry);

  // Remove the toast after 3 seconds
  Future.delayed(Duration(seconds: 3), () {
    overlayEntry.remove();
  });
}

void navigateTo(double lat, double lng) async {
  if (Platform.isIOS) {
    var uri = Uri.parse("http://maps.apple.app/q=$lat,$lng&mode=d");
    if (await canLaunch(uri.toString())) {
      await launch(uri.toString());
    } else {
      throw 'Could not launch ${uri.toString()}';
    }
  } else {
    var uri = Uri.parse("google.navigation:q=$lat,$lng&mode=d");
    if (await canLaunch(uri.toString())) {
      await launch(uri.toString());
    } else {
      throw 'Could not launch ${uri.toString()}';
    }
  }
}

bool emailValid(String email) {
  return true;
}

Future<bool> checkNetwork() async {
  var connectivityResult = await Connectivity().checkConnectivity();

  if (connectivityResult == ConnectivityResult.mobile) {
    debugPrint('Connected to mobile network');
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    debugPrint('Connected to WiFi');
    return true;
  } else {
    debugPrint('No internet connection');
    return false;
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return true;
  }
}

extension PasswordValidator on String {
  bool isValidPassword() {
    return true;
  }
}

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // Prevent closing when tapping outside
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent, // No background
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              'lib/assets/images/loader.json',
              width: 100,
              height: 100,
            ),
            // SizedBox(height: 10),
            // Text("Loading...", style: TextStyle(color: Colors.white)),
          ],
        ),
      );
    },
  );
}

void printFormData(FormData formData) {
  Map<String, String> formDataMap = {};
  formData.fields.forEach((field) {
    formDataMap[field.key] = field.value;
  });
  debugPrint(formDataMap.toString());
}

int versionToCode(String version) {
  final parts = version.split('.');
  final major = int.parse(parts[0]);
  final minor = int.parse(parts[1]);
  final patch = int.parse(parts[2]);

  return major * 10000 + minor * 100 + patch;
}

String convertToAmPm(String time24) {
  try {
    // Parse the "23:00:00" format
    final parsedTime = DateFormat("HH:mm").parse(time24);

    // Convert to "11 PM"
    return DateFormat("h a").format(parsedTime);
  } catch (e) {
    return time24; // fallback
  }
}

String formatRatingCount(int? value) {
  if (value == null) return "0";

  if (value < 1000) {
    return value.toString(); // 1, 999 etc.
  } else if (value < 1000000) {
    // Thousands → 1K, 1.2K, 999K
    double result = value / 1000;
    return "${result.toStringAsFixed(result < 10 ? 1 : 0)}K+";
  } else {
    // Millions → 1M, 1.5M, 10M
    double result = value / 1000000;
    return "${result.toStringAsFixed(result < 10 ? 1 : 0)}M+";
  }
}

/// Calculate bearing (direction) between two GPS coordinates using the haversine formula
///
/// Returns bearing in degrees (0-360), where:
/// - 0° = North
/// - 90° = East
/// - 180° = South
/// - 270° = West
///
/// Formula: bearing = atan2(sin(Δlong) * cos(lat2), cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(Δlong))
///
/// [lat1] Latitude of the starting point in degrees
/// [lon1] Longitude of the starting point in degrees
/// [lat2] Latitude of the destination point in degrees
/// [lon2] Longitude of the destination point in degrees
///
/// Returns bearing in degrees (0-360)
double calculateBearing(double lat1, double lon1, double lat2, double lon2) {
  // Convert degrees to radians
  final lat1Rad = lat1 * math.pi / 180;
  final lat2Rad = lat2 * math.pi / 180;
  final deltaLonRad = (lon2 - lon1) * math.pi / 180;

  // Calculate bearing using haversine formula
  final y = math.sin(deltaLonRad) * math.cos(lat2Rad);
  final x =
      math.cos(lat1Rad) * math.sin(lat2Rad) -
      math.sin(lat1Rad) * math.cos(lat2Rad) * math.cos(deltaLonRad);

  // Calculate bearing in radians, then convert to degrees
  final bearingRad = math.atan2(y, x);
  final bearingDeg = bearingRad * 180 / math.pi;

  // Normalize to 0-360 range
  return (bearingDeg + 360) % 360;
}

/// Smooth bearing changes to prevent jittery rotation
///
/// Uses interpolation (lerp) to gradually transition between bearings.
/// Handles the 360/0 degree wrap-around case (e.g., transitioning from 350° to 10°
/// should go through 0°, not backwards).
///
/// [currentBearing] The newly calculated bearing in degrees (0-360)
/// [previousBearing] The previous bearing in degrees (0-360)
/// [smoothingFactor] Interpolation factor between 0.0 (no smoothing) and 1.0 (full smoothing)
///                   Default is 0.3 for smooth but responsive rotation
///
/// Returns smoothed bearing in degrees (0-360)
double smoothBearing(
  double currentBearing,
  double previousBearing, {
  double smoothingFactor = 0.3,
}) {
  // Handle wrap-around case (e.g., 350° to 10°)
  double diff = currentBearing - previousBearing;

  // Normalize difference to -180 to 180 range
  if (diff > 180) {
    diff -= 360;
  } else if (diff < -180) {
    diff += 360;
  }

  // Calculate smoothed bearing
  double smoothedBearing = previousBearing + (diff * smoothingFactor);

  // Normalize to 0-360 range
  return (smoothedBearing + 360) % 360;
}

/// Calculate distance between two GPS coordinates using Haversine formula
///
/// Returns distance in meters
///
/// [lat1] Latitude of the first point in degrees
/// [lon1] Longitude of the first point in degrees
/// [lat2] Latitude of the second point in degrees
/// [lon2] Longitude of the second point in degrees
///
/// Returns distance in meters
double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
  const double earthRadius = 6371000; // Earth radius in meters

  // Convert degrees to radians
  final lat1Rad = lat1 * math.pi / 180;
  final lat2Rad = lat2 * math.pi / 180;
  final deltaLatRad = (lat2 - lat1) * math.pi / 180;
  final deltaLonRad = (lon2 - lon1) * math.pi / 180;

  // Haversine formula
  final a =
      math.sin(deltaLatRad / 2) * math.sin(deltaLatRad / 2) +
      math.cos(lat1Rad) *
          math.cos(lat2Rad) *
          math.sin(deltaLonRad / 2) *
          math.sin(deltaLonRad / 2);
  final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

  return earthRadius * c;
}
