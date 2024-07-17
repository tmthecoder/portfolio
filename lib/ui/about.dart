import 'package:controller_widgets/routing/route_controller.dart';
import 'package:controller_widgets/theming/theme_controller.dart';

/// Made by Tejas Mehta
/// Made on Tuesday, August 25, 2020
/// File Name: about.dart

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/widgets/bullet_list_text.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

import 'package:portfolio/widgets/dynamic_padding.dart';
import 'package:portfolio/widgets/image_link.dart';

class About extends StatefulWidget {
  static final String route = "about";

  ///CreateState method
  ///Sets the state of the app (rebuilt each time a UI change is needed)
  @override
  State<StatefulWidget> createState() {
    return AboutState();
  }
}

class AboutState extends State<About> with WidgetsBindingObserver {
  ScrollController _controller = ScrollController();

  ///InitState method
  ///Currently only sets a listener for any light/dark theme changes
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      RouteController.of(context)?.updateRoute("about");
    });
    WidgetsBinding.instance.addObserver(this);
  }

  ///Dispose method
  ///Currently only removes the observer set in initState for the light/dark theme changes
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  ///didChangePlatformBrightness method
  ///Only changes the listener's state to the theme allowing to change the theme while user is on the screen
  @override
  void didChangePlatformBrightness() {
    WidgetsBinding.instance.window.platformBrightness;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      RouteController.of(context)?.updateRoute("about");
    }
  }

  ///Main widget build method
  ///Builds the UI on this screen
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _controller,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        controller: _controller,
        child: DynamicPadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: makeProfilePic(),
              ),
              Padding(padding: const EdgeInsets.all(10)),
              makeSocialIcons(),
              Padding(padding: const EdgeInsets.all(5)),
              Text(
                "About",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Padding(padding: const EdgeInsets.all(5)),
              Text(
                  "Hello! I'm a Software Developer who loves experimenting with various new languages, technologies, and tools. "
                  "I'm currently a student at Georgia Tech looking to expand my horizon of Computer Science knowledge. Aside from development, "
                  "I love hiking outdoors, experimenting with coffee-making and watching new TV shows and movies! If you didn't know, I'm also a huge Star Wars fan!"),
              Padding(padding: const EdgeInsets.all(10)),
              Text(
                "Experience Overview",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Padding(padding: const EdgeInsets.all(5)),
              Text("C & C++:"),
              BulletListText(
                  "Currently working at Akuna Capital on the Market Data team writing highly performant C++ code to work with rapid data ingest while minimizing latency"),
              BulletListText(
                  "Worked with C & C++ in personal projects such as cClip (to bridge between Rust and Dart safely with support for complex data types)"),
              BulletListText(
                  "Contributed to Cloudflare's open-source 'workerd' runtime during my internship, as well as wrote code for the internal multi-tenant runtime."),
              Padding(padding: const EdgeInsets.all(5)),
              Text("Rust:"),
              BulletListText(
                  "About 4 years, started writing code with Rust in 2020"),
              BulletListText(
                  "Created an open source package for HOTP & TOTP generation and validation"),
              BulletListText(
                  "Re-wrote cClip's Direct Transfer implementation in Rust, improving performance nearly 10x and dropping errors 20% (threading + safety)"),
              BulletListText(
                  "Currenly working on smb_reader, a library to parse and work with SMB messages directly from a byte stream efficiently, concurrently, and safely"),
              Padding(padding: const EdgeInsets.all(5)),
              Text("Flutter & Dart:"),
              BulletListText(
                  "Over 5 years, started writing code with Flutter & Dart in 2018 during Flutter's beta phase"),
              BulletListText(
                  "Freelance Development utilizing Flutter to build applications for various clients"),
              BulletListText(
                  "Experienced in complex skills such as isolate computation for encryption & efficient state management"),
              Padding(padding: const EdgeInsets.all(5)),
              createResumeViewOpen(),
            ],
          ),
        ),
      ),
    );
  }

  /// The method to create my profile picture seen at the top of the webpage
  Widget makeProfilePic() {
    return ClipOval(
      child: Image.asset(
        "assets/profilepic.jpg",
        height: 200,
        fit: BoxFit.cover,
      ),
    );
  }

  /// A method to make the social icons seen under the profile picture.
  /// Currently only has LinkedIn and Github, but more may be coming soon
  Widget makeSocialIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ImageLink(
          link: "https://github.com/tmthecoder",
          assetUri:
              "assets/third_party/github_logo_${ThemeController.of(context).isDark ? "dark" : "light"}.png",
          edgeInsets: const EdgeInsets.all(10),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
        ),
        ImageLink(
          link: "https://www.linkedin.com/in/tmthecoder",
          assetUri: "assets/third_party/linkedin_logo.png",
          edgeInsets: const EdgeInsets.fromLTRB(10.0, 10.0, 8.0, 10.0),
        ),
      ],
    );
  }

  /// A method to create the viewing options for my resume at the bottom of the webpage
  /// Creates a nicely formatted Text with two links on the same line, one for a view and
  /// the other to download.
  Widget createResumeViewOpen() {
    String userPlatform = getUserAgent().toLowerCase();
    bool showSingleButton = false;
    if (userPlatform.contains("ipod") ||
        userPlatform.contains("ipad") ||
        userPlatform.contains("iphone") ||
        userPlatform.contains("android")) {
      showSingleButton = true;
    }
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: "Resume (", style: Theme.of(context).textTheme.bodySmall),
        TextSpan(
          text: "View",
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.merge(TextStyle(color: Colors.blue)),
          recognizer: TapGestureRecognizer()..onTap = viewResume,
        ),
        if (!showSingleButton)
          TextSpan(text: " / ", style: Theme.of(context).textTheme.bodySmall),
        if (!showSingleButton)
          TextSpan(
            text: "Download",
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.merge(TextStyle(color: Colors.blue)),
            recognizer: TapGestureRecognizer()..onTap = downloadResume,
          ),
        TextSpan(text: ")", style: Theme.of(context).textTheme.bodySmall),
      ]),
    );
  }

  String getUserAgent() {
    return "${js.context.callMethod('getUserAgent')}";
  }

  /// Method to get my age because I will definitely forget to update a static age
  int getAge() {
    DateTime now = DateTime.now();
    DateTime birthday = DateTime(2003, 12, 19);
    return (now.difference(birthday).inDays / 365).floor();
  }

  /// A method to glob the resume PDF and open it up in browser
  Future<void> viewResume() async {
    ByteData fileData = await rootBundle.load("assets/resume.pdf");
    final blob = html.Blob([fileData], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);
    html.window.open(url, "_blank");
    html.Url.revokeObjectUrl(url);
  }

  /// A method to glob the resume PDF and send it as a download
  Future<void> downloadResume() async {
    ByteData fileData = await rootBundle.load("assets/resume.pdf");
    final blob = html.Blob([fileData], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.document.createElement('a') as html.AnchorElement
      ..href = url
      ..style.display = 'none'
      ..download = 'Mehta_Tejas-Resume.pdf';
    html.document.body?.children.add(anchor);
    anchor.click();
    html.document.body?.children.remove(anchor);
    html.Url.revokeObjectUrl(url);
  }
}
