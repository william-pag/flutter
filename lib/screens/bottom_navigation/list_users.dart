import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pag_flutter/bloc/summary_users/summary_users_bloc.dart';
import 'package:pag_flutter/components/loading.dart';
import 'package:pag_flutter/config/config.dart';
import 'package:pag_flutter/config/enum.dart';
import 'package:pag_flutter/config/http.dart';
import 'package:pag_flutter/model/user.dart';
import 'package:pag_flutter/screens/screens.dart';
import 'package:pag_flutter/service/service.dart';

class ListOfUsers extends StatelessWidget {
  const ListOfUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => SummaryUsersBloc()..add(LoadSummaryUsers()),
      )
    ], child: const _ListOfUsers());
  }
}

class _ListOfUsers extends StatelessWidget {
  const _ListOfUsers();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: BlocConsumer<SummaryUsersBloc, SummaryUsersState>(
        listener: (BuildContext _, SummaryUsersState state) {
          if (state.status == Progress.error) {
            Navigator.of(context).pushNamed(LoginScreen.routeName);
          }
        },
        builder: (BuildContext _, SummaryUsersState state) {
          if (state.status == Progress.loaded) {
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (BuildContext _, int index) {
                return _BoxSummaryUser(user: state.users[index], index: index);
              },
            );
          }
          return const Loading();
        },
      ),
    );
  }
}

class _BoxSummaryUser extends StatelessWidget {
  final int index;
  final SummaryUser user;
  const _BoxSummaryUser({
    required this.user,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return UserDetailDialog(userId: user.id);
            },
          );
        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                user.image,
                fit: BoxFit.fill,
                width: 40,
                height: 40,
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                  ),
                ),
                Text(
                  nameValuesTitle.reverse[user.title.name] ?? 'Title',
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class UserDetailDialog extends StatelessWidget {
  final int userId;
  const UserDetailDialog({super.key, required this.userId});

  Future<ResponseDAO<DetailUser>> _getDetailUser({required int id}) {
    return UserService.shared.getDetailedUser(
      token: HttpClient.shard.token,
      userId: userId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        alignment: Alignment.center,
        child: FutureBuilder<ResponseDAO<DetailUser>>(
          future: _getDetailUser(id: userId),
          builder: (
            BuildContext context,
            AsyncSnapshot<ResponseDAO<DetailUser>> snapshot,
          ) {
            if (snapshot.hasData) {
              final user = snapshot.data?.data! as DetailUser;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                          user.image,
                          fit: BoxFit.fill,
                          width: 60,
                          height: 60,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            user.name,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[800],
                            ),
                          ),
                          Text(
                            nameValuesTitle.reverse[user.title.name] ?? 'Title',
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(flex: 1, child: Text('Last Login:')),
                          Expanded(
                            flex: 3,
                            child: Text(
                              DateFormat('dd-MM-yyyy').format(user.lastLogin),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(flex: 1, child: Text('Email:')),
                          Expanded(
                            flex: 3,
                            child: Text(
                              user.email,
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(flex: 1, child: Text('Location:')),
                          Expanded(
                            flex: 3,
                            child: Text(
                              user.location.name,
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(flex: 1, child: Text('Department:')),
                          Expanded(
                            flex: 3,
                            child: Text(
                              user.department.name,
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(flex: 1, child: Text('Evaluator:')),
                          Expanded(
                            flex: 3,
                            child: Text(
                              user.evaluator.name,
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(flex: 1, child: Text('Strategy:')),
                          Expanded(
                            flex: 3,
                            child: Text(
                              user.strategy.name,
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(flex: 1, child: Text('Form:')),
                          Expanded(
                            flex: 3,
                            child: Text(
                              user.evaluationType.name,
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              );
            }
            return const Loading();
          },
        ),
      ),
    );
  }
}
