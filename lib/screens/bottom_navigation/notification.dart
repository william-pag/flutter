import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pag_flutter/components/components.dart';
import 'package:pag_flutter/config/response_dao.dart';
import 'package:pag_flutter/model/notification.dart';
import 'package:pag_flutter/service/notification/index.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  Future<ResponseDAO<List<NotificationShort>>> _getMyNotifications() async {
    return await NotificationService.shared.getMyNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(10),
      child: FutureBuilder<ResponseDAO<List<NotificationShort>>>(
        future: _getMyNotifications(),
        builder: (
          BuildContext context,
          AsyncSnapshot<ResponseDAO<List<NotificationShort>>> snapshot,
        ) {
          if (snapshot.hasData) {
            final notifications =
                snapshot.data?.data as List<NotificationShort>;
            return ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (BuildContext context, int index) {
                final notification = notifications[index];
                return _BoxNotification(
                  key: ValueKey(notification.id),
                  notification: notification,
                  index: index,
                );
              },
            );
          }

          return const Loading();
        },
      ),
    );
  }
}

class _BoxNotification extends StatelessWidget {
  final int index;
  final NotificationShort notification;
  const _BoxNotification({
    Key? key,
    required this.notification,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.grey[350],
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Text(subjectValues.reverse[notification.subject] ?? ''),
          ),
          Expanded(
            flex: 1,
            child: Text(
              DateFormat('dd-MM-yyyy').format(notification.updatedAt),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
