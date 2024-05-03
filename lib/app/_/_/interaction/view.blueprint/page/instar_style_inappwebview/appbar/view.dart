import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:linkpeek/linkpeek.dart';

import '../../../../../../../../main.dart';
import '_/state_child.dart';
import '_/state_mother.dart';

class AppbarView extends StatefulWidget implements PreferredSizeWidget {
  AppbarView({super.key, required this.url});

  final String url;

  @override
  State<AppbarView> createState() => StateChild();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AppbarViewState extends State<AppbarView> with StateMother {
  String siteTitle = "";
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();

    LinkPeek.fromUrl(
      widget.url,
    ).then((value) => setState(() {
          siteTitle = value.title ?? "";
          isLoaded = true;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {},
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (siteTitle.isEmpty)
                ? (isLoaded)
                    ? Container()
                    : Text("")
                : Text(
                    siteTitle,
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                  ).fontWeight(FontWeight.bold),
            Text(
              widget.url,
              overflow: TextOverflow.clip,
              maxLines: 1,
              style: Theme.of(context).textTheme.bodySmall,
            ).textColor((siteTitle.isEmpty)
                ? Theme.of(context).textTheme.bodySmall!.color!
                : Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .color!
                    .withOpacity(0.6)),
          ],
        ).expanded(),
        IconButton(
          icon: const Icon(Icons.more_horiz),
          onPressed: () {},
        ),
      ],
    );
  }
}

main() async {
  return buildApp(
      appHome: AppbarView(
    url: "https://flutter.dev",
  ).center());
}
