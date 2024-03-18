import 'package:flutter/material.dart';

class SearchDisplay extends StatelessWidget {
  const SearchDisplay({
    super.key,
    required this.url,
    required this.title,
  });
  final String url;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            width: 150,
            height: 150,
            child: Image(image: NetworkImage(url)),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
            child: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            color: Colors.white,
            fontSize: 15,
          ),
        )),
      ],
    );
  }
}
