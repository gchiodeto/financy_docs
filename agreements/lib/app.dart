import 'package:financy_docs/financy_docs.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Financy Agreements',
      theme: ThemeData(primarySwatch: Colors.teal),
      routes: {
        '/': (context) => const Agreements(),
        '/eula': (context) => const BasePage(
              title: 'EULA',
              assetPath: MarkdownAssets.eula,
              namedRoute: '/eula',
            ),
        '/privacy-policy': (context) => const BasePage(
              title: 'Privacy Policy',
              assetPath: MarkdownAssets.privacyPolicy,
              namedRoute: '/privacy-policy',
            ),
        '/terms-of-service': (context) => const BasePage(
              title: 'Terms of Service',
              assetPath: MarkdownAssets.termsOfService,
              namedRoute: '/terms-of-service',
            ),
      },
    );
  }
}
