import 'package:badges/badges.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:elearning/app/controller/NotificationController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget notificationIcon() {
  NotificationController notificationController = Get.find();
  return Builder(
    builder: (BuildContext context) {
      ThemeData themeData = Theme.of(context);
      return Obx(
        () => notificationController.notificationlist.length == 0
            ? Container()
            : CustomPopupMenu(
                child: Container(
                  child: Badge(
                      badgeContent: Text(
                        "${notificationController.notificationlist.length}",
                        style: TextStyle(color: Colors.white),
                      ),
                      child: Icon(Icons.notifications,
                          size: 35, color: Colors.white)),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
                ),
                menuBuilder: () => ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        // color: const Color(0xFF4C4C4C),
                        color: Colors.grey,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    child: IntrinsicWidth(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: notificationController.notificationlist
                            .map(
                              (item) => GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.grey,
                                  child: Dismissible(
                                    background: Container(
                                      color: Colors.red[200],
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      alignment:
                                          AlignmentDirectional.centerStart,
                                      child: Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.delete,
                                            color: Colors.black54,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 6.0),
                                            child: Text("Delete"),
                                          )
                                        ],
                                      ),
                                    ),
                                    onDismissed: (direction) {
                                      notificationController.notificationlist
                                          .remove(item);
                                    },
                                    key: UniqueKey(),
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          bottom: 1.0, top: 1.0),
                                      color: Colors.white,
                                      child: ListTile(
                                        leading: Icon(
                                            Icons.notifications_none_outlined),
                                        title: Text("${item.description}"),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ),
                pressType: PressType.singleClick,
                verticalMargin: -10,
                // controller: _controller,
              ),
      );
    },
  );
}
