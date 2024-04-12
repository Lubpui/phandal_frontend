import 'package:http/http.dart' as http;
// Import your UserModel class
import 'dart:convert';

import 'package:phandal_frontend/model/bluetooth_model.dart';

class BluetoothRepository {
  final String url =
      'https://66162b71b8b8e32ffc7c8c4c.mockapi.io/BluetoothDevice';

  Future<List<BluetoothModel>> getDevice() async {
    final bluetoothresponse = await http.get(Uri.parse(url));
    if (bluetoothresponse.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(bluetoothresponse.body);
      final List<BluetoothModel> devices =
          jsonList.map((json) => BluetoothModel.fromJson(json)).toList();
      return devices;
    } else {
      throw Exception('Failed to load devices');
    }
  }
}
