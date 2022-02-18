import 'package:flutter/material.dart';
import 'package:fooddelivery2/models/models.dart';

class PromoBox extends StatelessWidget {
  final Promo promo;

  const PromoBox({Key? key, required this.promo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width - 40,
          margin: const EdgeInsets.only(right: 5.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Theme.of(context).primaryColor,
              image: DecorationImage(
                  image: AssetImage(
                      promo.imageUrl),
                  fit: BoxFit.cover)),
        ),
        ClipPath(
          clipper: PromoCustomClipper(),
          child: Container(
            width: MediaQuery.of(context).size.width - 40,
            margin: const EdgeInsets.only(right: 5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Theme.of(context).primaryColor.withOpacity(0.9),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 15.0, right: 125),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(promo.title,
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: Colors.white)),
                  const SizedBox(height: 15.0),
                  Text(
                      promo.description,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.white))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PromoCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(225, size.height);
    path.lineTo(250, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
