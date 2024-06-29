import 'package:barter_app/core/helper/spacing.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import 'package:url_launcher/url_launcher.dart';
class BuildCommunicationButtons extends StatelessWidget {
  // final String phoneNumber = '+201012345678';

  const BuildCommunicationButtons({
    super.key,
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
      onPressed: () {},
      // onPressed: () => _makePhoneCall('tel:$phoneNumber'),
      label: const Text(
        'Call',
        style: TextStyle(color: Colors.white),
      ),
      icon: const Icon(Icons.call, color: Colors.white),
    );
  }

  // Future<void> _launchWhatsApp(String phoneNumber) async {
  //   const message =
  //       'Hello, I am interested in your product.'; // Replace with your desired message
  //   final whatsappUrl =
  //       'https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}';

  //   if (await canLaunch(whatsappUrl)) {
  //     await launchUrl(whatsappUrl);
  //   } else {
  //     throw 'Could not launch $whatsappUrl';
  //   }

  //   Future<void> _makePhoneCall(String phoneNumber) async {
  //     final Uri launchUri = Uri(
  //       scheme: 'tel',
  //       path: phoneNumber,
  //     );
  //     await launchUrl(launchUri);
  //   }
  // }

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
      onPressed: () {},
      // onPressed: () => _launchWhatsApp(phoneNumber),
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
