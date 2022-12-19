import 'package:flutter/material.dart';

class ThumbnailAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ThumbnailAppBar({
    super.key,
    required this.thmbnailUrl,
    required this.context,
  });

  final String thmbnailUrl;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(thmbnailUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(MediaQuery.of(context).size.width, 300);
}
