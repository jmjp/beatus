import 'package:core/utils/svg.utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ErrorView extends HookWidget {
  final String error;
  const ErrorView({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final svgCustom = useState('');
    final controller =
        useAnimationController(duration: Duration(milliseconds: 800));
    final bodyController =
        useAnimationController(duration: Duration(milliseconds: 1800));
    final opacity =
        useAnimation(Tween(begin: 0.0, end: 1.0).animate(controller));
    final bodyOpacity =
        useAnimation(Tween(begin: 0.0, end: 1.0).animate(bodyController));
    if (svgCustom.value.isEmpty) {
      customizeSVG(
              path: 'assets/images/bug.svg',
              fromColor: Color(0xFF6C63FF),
              toColor: Theme.of(context).scaffoldBackgroundColor)
          .then((value) => svgCustom.value = value);
    }

    bodyController.forward();

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: bodyOpacity,
              duration: bodyController.duration!,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Ooops!',
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontWeight: FontWeight.w600)),
                  SizedBox(height: 20),
                  Text(
                    "Parece que houve um erro",
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '$error',
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            AnimatedBuilder(
                animation: svgCustom,
                builder: (context, child) {
                  if (svgCustom.value.isEmpty) {
                    return SizedBox();
                  } else {
                    controller.forward();
                    return AnimatedOpacity(
                        opacity: opacity,
                        duration: controller.duration!,
                        child: SvgPicture.string(svgCustom.value,
                            width: _size.width * 0.8,
                            height: _size.height * 0.4));
                  }
                })
          ],
        ),
      ),
    );
  }
}
