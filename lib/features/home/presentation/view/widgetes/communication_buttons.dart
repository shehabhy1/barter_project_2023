import 'package:barter_app/core/helper/spacing.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class BuildCommunicationButtons extends StatelessWidget {
  final String phoneNumber;
  final String urlImage;

  const BuildCommunicationButtons({
    super.key,
    required this.phoneNumber,
    required this.urlImage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildCallButton(),
        horizontalSpace(20),
        _buildWhatsAppButton(),
      ],
    );
  }

  Widget _buildCallButton() {
    return TextButton.icon(
      style: TextButton.styleFrom(
        backgroundColor: const Color(0xff4CD964),
      ),
      onPressed: () => _makePhoneCall('tel:$phoneNumber'),
      label: const Text(
        'Call',
        style: TextStyle(color: Colors.white),
      ),
      icon: const Icon(Icons.call, color: Colors.white),
    );
  }

  launchWhatsApp() async {
    final link = WhatsAppUnilink(
      phoneNumber: '+2$phoneNumber',
      text: "Hey! I'm inquiring about the apartment listing $urlImage",
    );
    await launchUrlString('$link');
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Widget _buildWhatsAppButton() {
    return TextButton.icon(
      style: TextButton.styleFrom(
        foregroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Color(0xff4CD964),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: () => launchWhatsApp(),
      label: const Text(
        'WhatsApp',
        style: TextStyle(color: Colors.black),
      ),
      icon: const FaIcon(
        FontAwesomeIcons.whatsapp,
        color: Color(0xff4CD964),
      ),
    );
  }
}
