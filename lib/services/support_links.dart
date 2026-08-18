import 'package:url_launcher/url_launcher.dart';

/// Where "invítame un café" points. The app never asks for money or nags
/// about it — this is the one deliberate, optional door to it.
const koFiUrl = 'https://ko-fi.com/covaret';

Future<void> openSupportLink() async {
  final uri = Uri.parse(koFiUrl);
  await launchUrl(uri, mode: LaunchMode.externalApplication);
}
