import 'package:animation_circle/option_image_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OptionImage extends StatefulWidget {
  final Color color;
  final int id;

  const OptionImage({Key? key, required this.color, required this.id}) : super(key: key);

  @override
  State<OptionImage> createState() => _OptionImageState();
}

class _OptionImageState extends State<OptionImage> {

  double _position = 350;
  double _size = 170;
  double _left = 120;
  double _opacity = 1;

  @override
  Widget build(BuildContext context) {
    final optionImageProvider = Provider.of<OptionImageProvider>(context, listen: false);
    return GestureDetector(
      onPanUpdate: (details) {
        // Swiping in right direction.
        if (details.delta.dy > 0) {
          debugPrint('shoot down');
          setState(() {
            _position = 1600;
            _size = 800;
            _left = -100;
          });
        }

        // Swiping in left direction.
        if (details.delta.dy < 0) {
          debugPrint('shoot up');
          setState(() {
            _position = -1600;
            _size = 30;
            _left = 190;
          });
        }
        setState(() {
          _opacity = 0;
        });
        optionImageProvider.remove(widget. id);
      },
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned(
              top: 337,
              left: 105,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: _opacity,
                child: Container(
                    height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.cyan, width: 20),
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
                top: _position,
                left: _left,
                duration: Duration(milliseconds: 500),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  height: _size,
                  width: _size,
                  decoration: BoxDecoration(
                    color: widget.color,
                    shape: BoxShape.circle,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
