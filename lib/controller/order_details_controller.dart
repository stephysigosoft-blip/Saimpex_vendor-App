import 'package:flutter/cupertino.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Utils/Utils.dart';
import '../configs/ApiConfigs.dart';
import '../configs/Dioclient.dart';
import '../generated/l10n.dart';
import '../model/OrderDetailsModel.dart';
import '../view/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderDetailsController extends GetxController {

  final FlutterLocalization localization = FlutterLocalization.instance;
  bool isLoading = false;
  Data? orderData;
  /// 0 = Order Overview (timeline), 1 = Order Duration Breakdown
  int selectedOrderTabIndex = 0;


  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getRestaurantOrderDetails(BuildContext context, String order_id) async {
    try {
      print(order_id);
      isLoading = true;
      update();
      var token = await getSavedObject("token");
      DioClient().updateToken(token);
      final response = await DioClient().get(
        ApiEndPoints.restaurantOrderDetails,
        query: {"order_id": order_id},
      );

      if (response.data?['status'].toString() == "true") {
        final orderDetailsModel = OrderDetailsModel.fromJson(response.data);
        if (orderDetailsModel.status.toString() == "true") {
          orderData = orderDetailsModel.data;
        }
      }
    } catch (error, stackTrace) {
      debugPrint("stackTrace: $stackTrace");
      debugPrint("getOrderDetails Error restaurant: $error");
      if (error.toString() == "Unauthorized") {
        final prefs = await SharedPreferences.getInstance();
        await prefs.clear();
        showToast(context, S.of(context).youAreLoggedOutSuccessfully);
        Get.offAll(LoginScreen());
      }else{
        showToast(context, error.toString());
      }
    } finally {
      isLoading = false;
      update();
    }
  }


  Future<void> getGroceryOrderDetails(BuildContext context, String order_id) async {
    try {
      isLoading = true;
      update();
      var token = await getSavedObject("token");
      DioClient().updateToken(token);
      final response = await DioClient().get(
        ApiEndPoints.groceryOrderDetails,
        query: {"order_id": order_id},
      );
      if (response.data?['status'].toString() == "true") {
        final orderDetailsModel = OrderDetailsModel.fromJson(response.data);
        if (orderDetailsModel.status.toString() == "true") {
          orderData = orderDetailsModel.data;
        }
      }
    } catch (error, stackTrace) {
      debugPrint("stackTrace: $stackTrace");
      debugPrint("getOrderDetails Error grocery: $error");
      if (error.toString() == "Unauthorized") {
        final prefs = await SharedPreferences.getInstance();
        await prefs.clear();
        showToast(context, S.of(context).youAreLoggedOutSuccessfully);
        Get.offAll(LoginScreen());
      }else{
        showToast(context, error.toString());
      }
    } finally {
      isLoading = false;
      update();
    }
  }
}