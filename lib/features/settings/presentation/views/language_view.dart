import 'package:barter_project_2023/features/settings/presentation/views/widgets/radio_checke_language.dart';
import 'package:flutter/material.dart';
import 'package:barter_project_2023/core/utils/styles.dart';
import 'package:go_router/go_router.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('Language'),
        titleTextStyle: Styles.textStyle24,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'Select the language you prefer for browsing, shopping and communication',
              style: Styles.textStyle16.copyWith(fontSize: 18),
            ),
            const RadioCheckLanguage()
          ],
        ),
      ),
    );
  }
}
