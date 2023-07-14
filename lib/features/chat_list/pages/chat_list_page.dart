import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../main_page/widgets/widgets.dart';
import '../cubit/cubit.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  late ChatListCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = ChatListCubit()..getChatList();
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
          child: BlocBuilder<ChatListCubit, ChatListState>(
            builder: (context, state) {
              if (state.loadStatus.isLoading) {
                return const CircularProgressIndicator();
              }

              if (state.loadStatus.isFailed) {
                return const Center(child: Text('ERROR'));
              }

              return Column(
                children: [
                  ...state.chatList.map(
                    (chat) => const PersonTile(),
                  ),
                  // ...List.generate(
                  //   8,
                  //   (index) => const PersonTile(),
                  // ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
