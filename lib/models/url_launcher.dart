import 'package:url_launcher/url_launcher.dart';

Future<void> launchGithubProfile() async {
  String url = "https://github.com/naveenbharadwaj19";
  await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}

Future<void> openEmail() async {
  String emailTo = "mailto:bharadwajpal22@gmail.com";
  await canLaunch(emailTo)
      ? await launch(emailTo)
      : throw 'Could not launch $emailTo';
}