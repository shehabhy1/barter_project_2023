import 'package:barter_project_2023/features/sign_up/widgets/ciry_with_address.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'national_id_widget.dart';
import 'phone_number_field.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NationalIdInfo(),
            const SizedBox(height: 12),
            const Text(
              'Phone ',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            const SizedBox(height: 12),
            const PhoneNumberCountryCode(),
            const SizedBox(height: 12),
            const Text(
              'Repeat Phone ',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            const SizedBox(height: 12),
            const PhoneNumberCountryCode(),
            const SizedBox(height: 12),
            const CityWithAddress(),
            const SizedBox(height: 14),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(40),
                backgroundColor: kPrimaryColor,
              ),
              child: const Text(
                'Send',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
