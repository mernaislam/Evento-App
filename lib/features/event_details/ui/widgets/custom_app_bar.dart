import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';

final ScrollController scrollController = ScrollController();

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  double _scrollPosition = 0;
  Color _color = Colors.transparent;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      scrollController.addListener(() {
        setState(() {
          _scrollPosition = scrollController.position.pixels;
          _color = _scrollPosition < 300
              ? Colors.transparent
              : Theme.of(context).scaffoldBackgroundColor;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: _color,
      actions: [
        SvgPicture.asset(
          'assets/icons/heart.svg',
          width: 35,
          color: Theme.of(context).textTheme.bodyLarge!.color,
        ),
        const SizedBox(
          width: 20,
        ),
        InkWell(
          onTap: (){
            Share.share('https://eventoappdemo.page.link/eventdetails');
          },
          child: SvgPicture.asset(
            'assets/icons/share.svg',
            width: 35,
            color: Theme.of(context).textTheme.bodyLarge!.color,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
