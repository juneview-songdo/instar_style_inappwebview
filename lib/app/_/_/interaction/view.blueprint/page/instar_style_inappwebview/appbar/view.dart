import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../main.dart';
import '_/state_child.dart';
import '_/state_mother.dart';

class AppbarView extends StatefulWidget implements PreferredSizeWidget {
  AppbarView({super.key, required this.title, required this.url});

  final String title;
  final String url;

  @override
  State<AppbarView> createState() => StateChild();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AppbarViewState extends State<AppbarView> with StateMother {
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
            Text(
              widget.title,
              overflow: TextOverflow.clip,
              maxLines: 1,
            ).fontWeight(FontWeight.bold),
            Text(
              widget.url,
              overflow: TextOverflow.clip,
              maxLines: 1,
              style: Theme.of(context).textTheme.bodySmall,
            ).textColor(
                Theme.of(context).textTheme.bodySmall!.color!.withOpacity(0.6)),
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
    title: "Flutter",
    url: "https://flutter.dev",
  ).center());
}
