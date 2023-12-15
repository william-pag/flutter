import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pag_flutter/bloc/notification_log/notification_log_bloc.dart';
import 'package:pag_flutter/bloc/users/users_bloc.dart';
import 'package:pag_flutter/components/dropdown_select/all_users.dart';
import 'package:pag_flutter/components/loading.dart';
import 'package:pag_flutter/config/enum.dart';
import 'package:pag_flutter/model/notification_log.dart';
import 'package:pag_flutter/model/user.dart';

class Reminder extends StatelessWidget {
  const Reminder({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext _) => UsersBloc()..add(UsersLoading()),
        ),
        BlocProvider(
          create: (BuildContext _) =>
              NotificationLogBloc()..add(LoadNotificationLog()),
        )
      ],
      child: const _Reminder(),
    );
  }
}

class _Reminder extends StatelessWidget {
  const _Reminder();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownSelectAllUsers(
          onChangeValue: (UserModel user) {
            context.read<NotificationLogBloc>().add(
                  FilterNotificationLog(user: user),
                );
          },
        ),
        Expanded(
          flex: 1,
          child: BlocConsumer<NotificationLogBloc, NotificationLogState>(
            listener: (BuildContext context, NotificationLogState state) {},
            builder: (BuildContext context, NotificationLogState state) {
              if (state.status == Progress.loaded) {
                return ListView.builder(
                  itemCount: state.notiLogs.length,
                  itemBuilder: (context, index) {
                    return _BoxReminder(
                      notiLog: state.notiLogs[index],
                      index: index,
                    );
                  },
                  addAutomaticKeepAlives: false,
                  addRepaintBoundaries: false,
                );
              }

              return const Loading();
            },
          ),
        ),
      ],
    );
  }
}

class _BoxReminder extends StatelessWidget {
  final int index;
  final NotificationLog notiLog;
  const _BoxReminder({
    required this.notiLog,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border(
          top: index == 0
              ? const BorderSide(color: Colors.grey)
              : BorderSide.none,
          left: const BorderSide(color: Colors.grey),
          right: const BorderSide(color: Colors.grey),
          bottom: const BorderSide(color: Colors.grey),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                notiLog.toName,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[700],
                ),
              ),
              Text(
                DateFormat('dd-MM-yyyy').format(notiLog.createdAt),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[700],
                ),
              ),
            ],
          ),
          Text(
            notiLog.subject,
            style: const TextStyle(color: Colors.black, fontSize: 12),
          ),
          ModifiedContentText(content: notiLog.content),
        ],
      ),
    );
  }
}

class ModifiedContentText extends StatefulWidget {
  final String content;

  const ModifiedContentText({
    super.key,
    required this.content,
  });

  @override
  State<ModifiedContentText> createState() => _ModifiedContentTextState();
}

class _ModifiedContentTextState extends State<ModifiedContentText> {
  bool isReadMore = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: !isReadMore
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Bidi.stripHtmlIfNeeded(widget.content).trim(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isReadMore = true;
                    });
                  },
                  child: const Text(
                    '...(readmore)',
                    style: TextStyle(
                        fontSize: 10,
                        color: Color.fromRGBO(0, 33, 83, 1),
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            )
          : Stack(
              fit: StackFit.loose,
              children: [
                Html(data: widget.content),
                Positioned(
                  right: 0,
                  top: 5,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isReadMore = false;
                      });
                    },
                    child: const Text(
                      'x',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
