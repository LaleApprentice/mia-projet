import 'package:url_launcher/url_launcher.dart';

class MapUtils{

  MapUtils._();
  static Future<void> openMap(double latitude, double longitude,
      ) async{
    Uri googleUrl=Uri.parse("https://www.google.com/maps/search/?api=1&query=$latitude,$longitude");

      await launchUrl(googleUrl);

  }
}