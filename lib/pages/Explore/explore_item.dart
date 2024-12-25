import 'package:flutter/material.dart';
import 'package:senior_shabeb/colors/colors.dart';

class ExploreItem extends StatefulWidget {
  final List<String> imagesName;
  final String title;
  final double rating;
  final String distance;
  final String price;

  const ExploreItem({
    required this.imagesName,
    required this.title,
    required this.rating,
    required this.distance,
    required this.price,
    super.key,
  });

  @override
  State<ExploreItem> createState() => _ExploreItemState();
}

class _ExploreItemState extends State<ExploreItem> {
  int index = 0;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: AppColors.primary),
            borderRadius: BorderRadius.circular(12),
          ),
          clipBehavior: Clip.hardEdge,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              PageView.builder(
                itemCount: widget.imagesName.length,
                onPageChanged: (i) {
                  setState(() {
                    index = i;
                  });
                },
                itemBuilder: (context, i) {
                  return Image.asset(
                    "images/${widget.imagesName[i]}",
                    fit: BoxFit.cover,
                  );
                },
              ),
              Positioned(
                top: 10,
                right: 10,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: AppColors.primary,
                    size: 30,
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    widget.imagesName.length,
                    (i) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: index == i ? Colors.black : Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 18),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star_border_outlined,
                      color: AppColors.primary,
                      size: 24,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      widget.rating.toString(),
                      style: const TextStyle(
                          color: AppColors.primary, fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              widget.distance,
              style: const TextStyle(color: Colors.black54),
            ),
            Text(
              widget.price,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
