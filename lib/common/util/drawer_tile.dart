import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loja_virtual/presentation/home/controllers/home.controller.dart';

class DrawerTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final int page;

  const DrawerTile({@required this.iconData, @required this.title, this.page});

  @override
  Widget build(BuildContext context) {
    final int currentpage = Get.find<HomeController>().currentPage;
    final Color color = Theme.of(context).primaryColor;
    return InkWell(
      onTap: () {
        Get.find<HomeController>().setPage(page);
      },
      child: SizedBox(
        height: 60,
        child: Row(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Icon(iconData,
                    size: 32,
                    color: currentpage == page ? color : Colors.grey)),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: currentpage == page ? color : Colors.grey,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
