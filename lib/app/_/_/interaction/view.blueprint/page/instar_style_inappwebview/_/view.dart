import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:linkpeek/linkpeek.dart';
import 'package:linkpeek/models/linkpeek.model.dart';

import '../../../../../../../../main.dart';
import '../appbar/view.dart';
import '_/state_child.dart';
import '_/state_mother.dart';

class NewView extends StatefulWidget {
  NewView({super.key, this.url = "https://docs.flutter.dev"});

  final String url;

  @override
  State<NewView> createState() => StateChild();
}

class NewViewState extends State<NewView> with StateMother {
  InAppWebViewController? webViewController;

  InAppWebViewSettings settings = InAppWebViewSettings(
      isInspectable: kDebugMode,
      mediaPlaybackRequiresUserGesture: false,
      allowsInlineMediaPlayback: true,
      iframeAllow: "camera; microphone",
      iframeAllowFullscreen: true);

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppbarView(
          url: widget.url,
        ),
        body: Column(
          children: [
            InAppWebView(
              // key: webViewKey,
              // webViewEnvironment: webViewEnvironment,
              initialUrlRequest: URLRequest(url: WebUri(widget.url)),
              // initialUrlRequest:
              // URLRequest(url: WebUri(Uri.base.toString().replaceFirst("/#/", "/") + 'page.html')),
              // initialFile: "assets/index.html",
              initialUserScripts: UnmodifiableListView<UserScript>([]),
              initialSettings: settings,
              onWebViewCreated: (controller) async {
                webViewController = controller;
              },
              onLoadStart: (controller, url) async {
                // setState(() {
                //   widget.url = url.toString();
                // });
              },
              onPermissionRequest: (controller, request) async {
                return PermissionResponse(
                    resources: request.resources,
                    action: PermissionResponseAction.GRANT);
              },
              shouldOverrideUrlLoading: (controller, navigationAction) async {
                var uri = navigationAction.request.url!;

                if (![
                  "http",
                  "https",
                  "file",
                  "chrome",
                  "data",
                  "javascript",
                  "about"
                ].contains(uri.scheme)) {
                  // if (await canLaunchUrl(uri)) {
                  //   // Launch the App
                  //   await launchUrl(
                  //     uri,
                  //   );
                  //   // and cancel the request
                  //   return NavigationActionPolicy.CANCEL;
                  // }
                }

                return NavigationActionPolicy.ALLOW;
              },
              onConsoleMessage: (controller, consoleMessage) {
                print(consoleMessage);
              },
            ).expanded(),
          ],
        ),
        floatingActionButton: FloatingActionButtonKit(),
      ),
    );
  }
}

main() async {
  return buildApp(appHome: NewView());
}
