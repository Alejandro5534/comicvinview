import 'package:comicvine/features/home/presentation/controllers/comic_controller.dart';
import 'package:comicvine/features/home/presentation/widgets/image_comic.dart';
import 'package:comicvine/features/home/presentation/widgets/label_comic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HoverCard extends StatefulWidget {
  final String? image;
  final String? name;
  final double imageSize;
  final DateTime? dateAdded;
  final String? issueNumber;

  const HoverCard({
    super.key,
    required this.image,
    required this.name,
    required this.imageSize,
    required this.dateAdded,
    required this.issueNumber,
  });

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _marginAnimation;
  late final Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _marginAnimation = Tween<double>(begin: 2.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.linear),
    );

    _colorAnimation =
        ColorTween(begin: Colors.transparent, end: Colors.black).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.linear),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => _animationController.forward(),
      onExit: (_) => _animationController.reverse(),
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Container(
            margin: EdgeInsets.all(_marginAnimation.value),
            decoration: BoxDecoration(
              color: _colorAnimation.value,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                if (_animationController.value > 0)
                  BoxShadow(
                    color: isDark ? Colors.white : Colors.black54,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
              ],
            ),
            child: child,
          );
        },
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _StateRowColumnCard(
                dateAdded: widget.dateAdded,
                image: widget.image,
                imageSize: widget.imageSize,
                name: widget.name,
                issueNumber: widget.issueNumber,
              )),
        ),
      ),
    );
  }
}

class _StateRowColumnCard extends ConsumerWidget {
  final double imageSize;
  final String? image;
  final DateTime? dateAdded;
  final String? name;
  final String? issueNumber;
  const _StateRowColumnCard({
    required this.imageSize,
    required this.image,
    required this.dateAdded,
    required this.name,
    required this.issueNumber,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isList = ref.watch(isListProvider);
    final size = MediaQuery.of(context).size.width;
    final List<Widget> contentCard = [
      ImageComic(imageSize: imageSize, image: image),
      isList ? const SizedBox(width: 80) : Container(),
      LabelComic(
        issueNumber: issueNumber,
        dateAdded: dateAdded,
        name: name,
      ),
    ];

    return isList && size > 570
        ? Row(
            children: contentCard,
          )
        : Column(
            mainAxisSize: MainAxisSize.max,
            children: contentCard,
          );
  }
}
