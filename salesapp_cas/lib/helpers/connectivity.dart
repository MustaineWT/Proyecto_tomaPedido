import 'dart:io';

class Connectivity {
  static connectivity() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return 'connected';
      }
    } on SocketException catch (_) {
      return 'not connected';
    }
  }

  static connectivityReintent() async {
    String result = '';
    for (int i = 0; i <= 10; i++) {
      await Future.delayed(Duration(milliseconds: 1200));
      result = await connectivity();
      if (result == 'not connected') {
      } else {
        return result;
      }
    }
    return result;
  }
}
