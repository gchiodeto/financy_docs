import 'package:financy_docs/financy_docs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

class BasePage extends StatefulWidget {
  const BasePage({
    super.key,
    required this.title,
    required this.assetPath,
    required this.namedRoute,
  });

  final String assetPath;
  final String title;
  final String namedRoute;

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  final _data = ValueNotifier('');

  @override
  void initState() {
    super.initState();
    _loadAsset();

    _data.addListener(_loadAsset);
  }

  Future<void> _loadAsset() async =>
      _data.value = await const AssetLoader().load(widget.assetPath);

  @override
  void dispose() {
    _data.removeListener(_loadAsset);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
      title: widget.title,
      color: Colors.black,
      child: Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: ValueListenableBuilder<String>(
          valueListenable: _data,
          builder: (context, value, child) {
            if (value.isNotEmpty) {
              return Markdown(
                data: value,
                onTapLink: (text, href, title) async {
                  launchUrl(Uri.parse(href!));
                },
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
