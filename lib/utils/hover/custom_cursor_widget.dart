import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class CustomCursor extends MouseRegion {
  static final appContainer =
      html.window.document.getElementById('app-container');

  // cursor types from http://www.javascripter.net/faq/stylesc.htm
  static const String pointer = 'pointer';
  static const String auto = 'auto';
  static const String move = 'move';
  static const String noDrop = 'no-drop';
  static const String colResize = 'col-resize';
  static const String allScroll = 'all-scroll';
  static const String notAllowed = 'not-allowed';
  static const String rowResize = 'row-resize';
  static const String crosshair = 'crosshair';
  static const String progress = 'progress';
  static const String eResize = 'e-resize';
  static const String neResize = 'ne-resize';
  static const String text = 'text';
  static const String nResize = 'n-resize';
  static const String nwResize = 'nw-resize';
  static const String help = 'help';
  static const String verticalText = 'vertical-text';
  static const String sResize = 's-resize';
  static const String seResize = 'se-resize';
  static const String inherit = 'inherit';
  static const String wait = 'wait';
  static const String wResize = 'w-resize';
  static const String swResize = 'sw-resize';

  CustomCursor(
      {super.key, required Widget child, String cursorStyle = 'pointer'})
      : super(
          onHover: (PointerHoverEvent evt) {
            if (kIsWeb) {
              appContainer?.style.cursor = cursorStyle;
            }
          },
          onExit: (PointerExitEvent evt) {
            if (kIsWeb) {
              appContainer?.style.cursor = 'default';
            }
          },
          child: child,
        );
}

typedef OnPointerEnter = void Function(PointerEvent event);
typedef OnPointerExit = void Function(PointerEvent event);

class StrikeThroughOnHover extends StatefulWidget {
  final OnPointerEnter onEnterListener;
  final OnPointerExit onExitListener;
  final Widget child;

  const StrikeThroughOnHover({
    Key? key,
    required this.child,
    required this.onEnterListener,
    required this.onExitListener,
  }) : super(key: key);

  @override
  StrikeThroughOnHoverState createState() => StrikeThroughOnHoverState();
}

class StrikeThroughOnHoverState extends State<StrikeThroughOnHover> {
  final nonHoverTransform = Matrix4.identity()..translate(0, 0, 0);
  final hoverTransform = Matrix4.identity()..translate(0, -10, 0);

  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => widget.onEnterListener(e),
      onExit: (e) => widget.onExitListener(e),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: _hovering ? hoverTransform : nonHoverTransform,
        child: widget.child,
      ),
    );
  }

  void _mouseEnter(bool hover) {
    setState(() {
      _hovering = hover;
    });
  }
}
