import 'package:flutter/material.dart';

class ImageDegree extends StatelessWidget {
  const ImageDegree({
    super.key,
    required this.image,
    required this.degree,
    required this.time,
  });
  final String image;
  final String degree;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          time,
          style: const TextStyle(
              fontFamily: 'sarabun',
              fontSize: 10,
              color: Color.fromARGB(255, 71, 71, 71)),
        ),
        Image(
          image: AssetImage(
            image,
          ),
          width: 18,
          height: 18,
        ),
        Text(
          degree,
          style: const TextStyle(
              fontFamily: 'sarabun',
              fontSize: 10,
              color: Color.fromARGB(255, 71, 71, 71)),
        ),
      ],
    );
  }
}

class DaysTableItem extends StatelessWidget {
  const DaysTableItem({
    super.key,
    required this.day,
    required this.image1,
    required this.image2,
    required this.degree1,
    required this.degree2,
  });
  final String day;
  final String image1;
  final String image2;
  final String degree1;
  final String degree2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              day,
              style: const TextStyle(
                  color: Color.fromARGB(255, 71, 71, 71), fontSize: 14),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image(image: AssetImage(image1)),
                    const SizedBox(
                      width: 12,
                    ),
                    Image(image: AssetImage(image2))
                  ],
                ),
                Row(
                  children: [
                    Text(
                      degree1,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 71, 71, 71),
                          fontSize: 14,
                          fontFamily: 'sarabun'),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      degree2,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 71, 71, 71),
                          fontSize: 14,
                          fontFamily: 'sarabun'),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomPageRoute extends PageRouteBuilder {
  final Widget child;
  CustomPageRoute({required this.child})
      : super(transitionDuration: Duration(milliseconds: 200),pageBuilder: (context, animation, secondaryAnimation) => child);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      SlideTransition(position: Tween<Offset>(begin: Offset(1, 0),end: Offset.zero).animate(animation), child: child);
}
