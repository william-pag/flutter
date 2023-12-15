import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pag_flutter/bloc/bloc.dart'
    show
        UsersBloc,
        UsersState,
        SelectUser,
        UsersLoading,
        NotificationLogBloc,
        LoadNotificationLog,
        NotificationLogState;
import 'package:pag_flutter/config/config.dart' show Progress;
import 'package:pag_flutter/constants/constants.dart'
    show CustomColor, CustomIcons;
import 'package:pag_flutter/model/model.dart' show UserModel, NotificationLog;
import 'package:pag_flutter/screens/screens.dart' show LoginScreen;

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
          create: (BuildContext _) => NotificationLogBloc()
            ..add(
              LoadNotificationLog(),
            ),
        ),
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
        Container(
          width: double.infinity, // Full width of the screen
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey), // Optional border
            borderRadius: BorderRadius.circular(5), // Optional border radius
          ),
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: BlocConsumer<UsersBloc, UsersState>(
            listener: (context, state) {
              if (state.status == Progress.error) {
                Navigator.of(context).pushNamed(LoginScreen.routeName);
              }
            },
            builder: (BuildContext context, UsersState state) {
              if (state.status == Progress.loaded) {
                return DropdownButton<UserModel>(
                  underline: Container(),
                  isExpanded: true, // Fill the width of the container
                  value: state.selectedUser,
                  onChanged: (UserModel? newValue) {
                    if (newValue != null) {
                      context.read<UsersBloc>().add(SelectUser(user: newValue));
                    }
                  },
                  icon: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: Colors.grey, // Border color
                          width: 2, // Border width
                        ),
                      ), // Optional border
                    ),
                    padding: const EdgeInsets.only(left: 5),
                    child: CustomIcons.shared.caretDown,
                  ),
                  items: state.users.map((UserModel user) {
                    return DropdownMenuItem<UserModel>(
                      key: Key(user.id.toString()),
                      value: user,
                      child: Text(
                        user.name,
                        style: const TextStyle(fontWeight: FontWeight.w400),
                      ),
                    );
                  }).toList(),
                );
              } else {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: CustomColor.themeRed,
                        strokeWidth: 2,
                      ),
                    ),
                  ),
                );
              }
            },
          ),
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
                    return _BoxReminder(notiLog: state.notiLogs[index]);
                  },
                  addAutomaticKeepAlives: false,
                  addRepaintBoundaries: false,
                );
              }
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: CustomColor.themeRed,
                      strokeWidth: 2,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _BoxReminder extends StatelessWidget {
  const _BoxReminder({
    required this.notiLog,
  });

  final NotificationLog notiLog;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey),
          left: BorderSide(color: Colors.grey),
          right: BorderSide(color: Colors.grey),
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
