import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carouseleffect/Screens/Obboardingpage.dart';
import 'package:carouseleffect/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
import 'package:flutter/widgets.dart' as flutter;

class CoverFlowCarouselPage extends StatefulWidget {
  const CoverFlowCarouselPage({super.key});

  static PageRoute route() =>
      MaterialPageRoute(builder: (context) => const CoverFlowCarouselPage());

  @override
  State<CoverFlowCarouselPage> createState() => _CoverFlowCarouselPageState();
}

class _CoverFlowCarouselPageState extends State<CoverFlowCarouselPage> {
  late PageController _pageController;
  final _maxHeight = 150.0;
  final _minItemWidth = 40.0;
  double _currentPageIndex = 5;
  final _spacing = 10.0;
  final _images = [
    'assets/Walpaper1.jpg',
    'assets/Walpaper2.jpg',
    'assets/Walpaper3.jpg',
    'assets/Walpaper4.jpg',
    'assets/Rainforest..jpg',
    'assets/Rainforest..jpg',
    'assets/Walpaper5.jpg',
    'assets/Walpaper3.jpg',
    'assets/Walpaper1.jpg',
    'assets/Walpaper3.jpg',
  ];
  bool isLightTheme = false;
  late SMITrigger lightTheme;
  late SMITrigger dartTheme;
  StateMachineController getRiveController(Artboard artboard) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, "State Machine 1");
    artboard.addController(controller!);
    return controller!;
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _currentPageIndex.toInt(),
    );
    _pageController.addListener(_pageControllerListener);
  }

  void _pageControllerListener() {
    setState(() {
      _currentPageIndex = _pageController.page ?? 0;
    });
  }

  @override
  void dispose() {
    _pageController.removeListener(_pageControllerListener);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor:
          isLightTheme ? Klightbackgroundcolor : Kdartbackgroundcolor,
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Home'),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Onboardingpage()));
              },
              icon: Icon(Icons.navigate_before))),
      body: Column(children: [
        SizedBox(
          height: _maxHeight,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(
                child: Stack(
                  children: _images.asMap().entries.map((item) {
                    final currentIndex = _currentPageIndex - item.key;
                    return _CoverFlowPositionedItem(
                      imagePath: item.value,
                      index: currentIndex,
                      absIndex: currentIndex.abs(),
                      size: Size(screenWidth, _maxHeight),
                      minItemWidth: _minItemWidth,
                      maxItemWidth: screenWidth / 2,
                      spacing: _spacing,
                    );
                  }).toList(),
                ),
              ),
              Positioned.fill(
                child: PageView.builder(
                  controller: _pageController,
                  itemBuilder: (context, index) => const SizedBox.expand(),
                  itemCount: _images.length,
                ),
              ),
            ],
          ),
        ),
        Center(
          child: Container(
            child: AnimatedTextKit(
              isRepeatingAnimation: true,
              repeatForever: true,
              animatedTexts: [
                TyperAnimatedText(
                    speed: Duration(microseconds: 80),
                    "Above ",
                    textStyle: GoogleFonts.kalnia(fontSize: 24)),
                TyperAnimatedText(
                    speed: Duration(microseconds: 80),
                    "shown ",
                    textStyle: GoogleFonts.kalnia(fontSize: 24)),
                TyperAnimatedText(
                    speed: Duration(microseconds: 80),
                    "is ",
                    textStyle: GoogleFonts.kalnia(fontSize: 24)),
                TyperAnimatedText(
                    speed: Duration(microseconds: 80),
                    " the ",
                    textStyle: GoogleFonts.kalnia(fontSize: 24)),
                TyperAnimatedText(
                    speed: Duration(microseconds: 80),
                    "carousel ",
                    textStyle: GoogleFonts.kalnia(fontSize: 24)),
                TyperAnimatedText(
                    speed: Duration(microseconds: 80),
                    "effect",
                    textStyle: GoogleFonts.kalnia(fontSize: 24)),
              ],
            ),
          ),
        ),
        GestureDetector(
          onDoubleTap: () {},
          onTap: () {
            setState(() {
              if (isLightTheme) {
                //true
                // Update with your light background color
                lightTheme.fire();
                // Trigger the light theme animation
              } else {
                //false
                // Update with your dark background color
                dartTheme.fire(); // Trigger the dark theme animation
              }
              isLightTheme = !isLightTheme;
              // Toggle the theme state
            });
          },
          child: Container(
            height: 160,
            width: 220,
            child: RiveAnimation.asset(
              "assets/Riveassets/Theme.riv",
              onInit: (artboard) {
                StateMachineController controller = getRiveController(artboard);
                lightTheme = controller.findSMI("Day Mode") as SMITrigger;
                dartTheme = controller.findSMI("Night Mode") as SMITrigger;
              },
            ),
          ),
        )
      ]),
    );
  }
}

class _CoverFlowPositionedItem extends StatelessWidget {
  const _CoverFlowPositionedItem({
    required this.imagePath,
    required this.index,
    required this.absIndex,
    required this.size,
    required this.minItemWidth,
    required this.maxItemWidth,
    required this.spacing,
  });
  final String imagePath;
  final double index;
  final double absIndex;
  final Size size;
  final double minItemWidth;
  final double maxItemWidth;
  final double spacing;

  double get _getItemPosition {
    final centerPosition = size.width / 2;
    final mainPosition = centerPosition - (maxItemWidth / 2);
    if (index == 0) return mainPosition;
    return _calculateNewMainPosition(mainPosition);
  }

  double get _calculateItemWidth {
    final diffWidth = maxItemWidth - minItemWidth;
    final newMaxItemWidth = maxItemWidth - (diffWidth * absIndex);
    return absIndex < 1 ? newMaxItemWidth : minItemWidth;
  }

  double get _getScaleValue => 1 - (0.15 * absIndex);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(_getItemPosition, 0),
      child: Transform.scale(
        scale: _getScaleValue,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            children: [
              SizedBox(
                width: _calculateItemWidth,
                height: size.height,
                child: flutter.Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double _calculateLeftPosition(double mainPosition) {
    return absIndex <= 1 ? mainPosition : (mainPosition - minItemWidth);
  }

  double _calculateRightPosition(double mainPosition) {
    final totalItemWidth = maxItemWidth + minItemWidth;
    return absIndex <= 1 ? mainPosition : mainPosition + totalItemWidth;
  }

  double _calculateRightAndLeftDiffPosition() {
    return absIndex <= 1.0
        ? ((index > 0 ? minItemWidth : maxItemWidth) * absIndex)
        : ((index > 0 ? (absIndex - 1) : (absIndex - 2)) * minItemWidth);
  }

  double _calculateNewMainPosition(double mainPosition) {
    final diffPosition = _calculateRightAndLeftDiffPosition();
    final leftPosition = _calculateLeftPosition(mainPosition);
    final rightPosition = _calculateRightPosition(mainPosition);
    return index > 0
        ? leftPosition - diffPosition - spacing
        : rightPosition + diffPosition + spacing;
  }
}
