import 'package:flutter/material.dart';
import 'package:portfolio/constants/strings.dart';
import 'package:portfolio/constants/text_styles.dart';
import 'package:portfolio/ui/pages/about.dart';
import 'package:portfolio/ui/pages/hire.dart';
import 'package:portfolio/ui/pages/intro.dart';
import 'package:portfolio/ui/pages/skills.dart';
import 'package:portfolio/utils/hover/custom_cursor_widget.dart';
import 'package:portfolio/utils/screen/screen_utils.dart';
import 'package:portfolio/widgets/responsive_widget.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  bool isSmallScreen = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF1a1a1a),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: <Widget>[
                _buildBody(context, constraints),
                _buildMadeWith(
                  alignment: ResponsiveWidget.isSmallScreen(context)
                      ? Alignment.topRight
                      : Alignment.bottomLeft,
                ),
                isSmallScreen ? const SizedBox.shrink() : _buildSocialButtons()
              ],
            );
          },
        ),
      ),
    );
  }

  // body:----------------------------------------------------------------------
  Widget _buildBody(BuildContext context, BoxConstraints constraints) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: constraints.maxWidth,
                minHeight: constraints.maxHeight),
            child: ResponsiveWidget(
              largeScreen: _buildLargeScreen(context),
              mediumScreen: _buildMediumScreen(context),
              smallScreen: _buildSmallScreen(context),
              onSmallScreen: () {
                if (!isSmallScreen) {
                  Future.delayed(Duration.zero, () {
                    setState(() {
                      isSmallScreen = true;
                    });
                  });
                }
              },
              onMediumScreen: () {
                if (isSmallScreen) {
                  Future.delayed(Duration.zero, () {
                    setState(() {
                      isSmallScreen = false;
                    });
                  });
                }
              },
              onLargeScreen: () {
                if (isSmallScreen) {
                  Future.delayed(Duration.zero, () {
                    setState(() {
                      isSmallScreen = false;
                    });
                  });
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLargeScreen(BuildContext context) {
    return const IntrinsicHeight(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(flex: 1, child: IntroWidget()),
                Expanded(flex: 1, child: AboutWidget()),
                Expanded(flex: 1, child: SkillsWidget()),
                Expanded(flex: 1, child: HireWidget()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMediumScreen(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 50.0),
      child: IntrinsicHeight(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            IntroWidget(),
            AboutWidget(),
            SkillsWidget(),
            HireWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildSmallScreen(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const IntroWidget(),
          const AboutWidget(),
          const SkillsWidget(),
          const HireWidget(),
          _buildSocialButtons(
            axis: Axis.horizontal,
            quarterTurns: 4,
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }

  // general widgets:-----------------------------------------------------------
  Widget _buildSocialButtons({
    int quarterTurns = 3,
    Axis axis = Axis.vertical,
    alignment = Alignment.centerRight,
  }) {
    return Align(
      alignment: alignment,
      child: SingleChildScrollView(
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          direction: axis,
          children: <Widget>[
            _buildMenuItem(
                quarterTurns, Strings.menuGithubLink, Strings.menuGithub),
            _buildMenuItem(
                quarterTurns, Strings.menuLinkedinLink, Strings.menuLinkedin),
            _buildMenuItem(quarterTurns, Strings.menuGooglePlayLink,
                Strings.menuGooglePlay),
            _buildMenuItem(
                quarterTurns, Strings.menuInstagramLink, Strings.menuInstagram),
            _buildMenuItem(
                quarterTurns, Strings.menuWhatsappLink, Strings.menuWhatsapp),
            _buildMenuItem(
                quarterTurns, Strings.menuTelegramLink, Strings.menuTelegram),
            _buildMenuItem(
                quarterTurns, Strings.menuTwitterLink, Strings.menuTwitter),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(int quarterTurns, String link, String title) {
    return CustomCursor(
      cursorStyle: CustomCursor.pointer,
      child: RotatedBox(
        quarterTurns: quarterTurns,
        child: MaterialButton(
          hoverColor: const Color(0xFF00bcd5),
          child: Text(
            title,
            style: TextStyles.menuItem,
          ),
          onPressed: () {
            _launchURL(link);
          },
        ),
      ),
    );
  }

  Future<void> _launchURL(String link) async {
    if (await canLaunchUrlString(link)) {
      await launchUrlString(link);
    } else {
      throw 'Could not launch $link';
    }
  }

  Widget _buildMadeWith({Alignment alignment = Alignment.bottomLeft}) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 50.0,
        left: (ScreenUtil.getInstance().setWidth(40)),
      ),
      child: Align(
        alignment: alignment,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          color: const Color(0xFF1A1A1A),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RotatedBox(
                quarterTurns: 3,
                child: Text(
                  Strings.inFlutter,
                  style: TextStyles.strikeThrough,
                ),
              ),
              RotatedBox(
                quarterTurns: 3,
                child: Text(
                  Strings.heart,
                  style: TextStyles.strikeThrough.copyWith(
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              RotatedBox(
                quarterTurns: 3,
                child: Text(
                  Strings.madeWith,
                  style: TextStyles.strikeThrough,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
