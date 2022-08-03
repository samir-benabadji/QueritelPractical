import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final imageURL;
  final name;
  final VoidCallback onPressed;
  const MyCard({Key? key, this.imageURL, this.name, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: GridTile(
        child: GestureDetector(
          onTap: onPressed,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage(
              placeholder: AssetImage('assets/images/petPlaceholder.png'),
              image: NetworkImage(imageURL),
              fit: BoxFit.fill,
            ),
          ),
        ),
        footer: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          child: GridTileBar(
            title: Text(
              name,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
