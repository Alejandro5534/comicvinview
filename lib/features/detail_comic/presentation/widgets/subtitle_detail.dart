import 'package:flutter/material.dart';

class SubtitleDetail extends StatelessWidget {
  const SubtitleDetail({
    super.key,
    required this.subtitle,
    required this.empty,
    required this.comic,
  });

  final String subtitle;
  final String empty;
  final List comic;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    int crossAxisCount = MediaQuery.of(context).size.width ~/ 200;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text(
            subtitle,
            style: const TextStyle(fontSize: 35),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: Divider(),
        ),
        comic.isEmpty
            ? Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Text(empty),
              )
            : Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: size < 680 ? 3.5 : 1,
                      crossAxisCount: size < 680 ? 5 : crossAxisCount,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                    ),
                    itemCount: comic.length,
                    itemBuilder: (context, index) {
                      final character = comic[index];

                      return TextButton(
                          onPressed: () {},
                          child: Text(
                            character.name!,
                            style: TextStyle(fontSize: size < 680 ? 15 : 22),
                          ));
                    },
                  ),
                ),
              ),
      ],
    );
  }
}
