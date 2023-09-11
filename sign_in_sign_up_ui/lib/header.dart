import 'package:flutter/material.dart';
import 'package:sign_in_sign_up_ui/main.dart';

class Header extends StatelessWidget {
  final double height = 320;

  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: _HeaderBackground(height: height),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: _HeaderCircles(height: height),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 128),
              child: _HeaderTitle(),
            ),
          ),
          Positioned(
            top: 16,
            left: 0,
            child: _HeaderBackButton())
        ],
      )
    );
  }
}

class _HeaderCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, size.height * 0.5)
      ..quadraticBezierTo(
        size.width * 0.55,
        size.height,
        size.width,
        size.height * 0.6
      )
      ..lineTo(size.width, 0)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class _HeaderBackground extends StatelessWidget {
  final double height;

  const _HeaderBackground({
    Key? key,
    required this.height
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _HeaderCurveClipper(),
      child: Container(
        width: double.infinity,
        height: height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
            colors: [
              Color(0xFFFD9766),
              Color(0xFFFF7362)
            ],
            stops: [0, 1]
          )
        ),
      ),
    );
  }
}

class _HeaderCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;

    canvas.drawCircle(
      Offset(size.width * 0.25, size.height * 0.4),
      12,
      paint
    );
    canvas.drawCircle(
      Offset(size.width * 0.75, size.height * 0.2),
      12,
      paint
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class _HeaderCircles extends StatelessWidget {
  final double height;

  const _HeaderCircles({
    Key? key,
    required this.height
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _HeaderCirclePainter(),
      child: Container(
        width: double.infinity,
        height: height,
      ),
    );
  }
}

class _HeaderTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Welcome',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: kTextColorPrimary,
            fontWeight: FontWeight.w500
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Sign in to continue',
          style: Theme.of(context)
            .textTheme
            .titleMedium
            !.copyWith(color: kTextColorPrimary),
        )
      ],
    );
  }
}

class _HeaderBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: kButtonColorPrimary,
        backgroundColor: Colors.transparent,
        shape: const CircleBorder(
          side: BorderSide(color: kButtonColorPrimary)
        ),
      ),
      onPressed: () => {},
      child: const Icon(Icons.chevron_left, color: kIconColor,));
  }
}