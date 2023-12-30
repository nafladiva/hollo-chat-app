import 'package:flutter/material.dart';
import 'package:hollo/core/my_color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hollo/features/contact/contact.dart';

import '../cubits/cubits.dart';
import '../helpers/helpers.dart';
import '../views/views.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late MainCubit mainCubit;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    mainCubit = MainCubit();
    tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: TabHelper.getIndex(
        mainCubit.state.tabType,
      ),
    );
    tabController.addListener(() {
      mainCubit.setTabByIndex(tabController.index);
    });
  }

  @override
  void dispose() {
    mainCubit.close();
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: mainCubit,
      child: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          return Scaffold(
            appBar: MainAppBar(tabController: tabController),
            floatingActionButton: Visibility(
              visible: state.isOnMessage,
              child: FloatingActionButton(
                child: const Icon(
                  Icons.add,
                  color: MyColor.text,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ContactPage(),
                    ),
                  );
                },
              ),
            ),
            body: TabBarView(
              controller: tabController,
              children: const [
                // ChatListPage(),
                Scaffold(
                  body: Center(),
                ),
                Center(child: Text('friendss')),
              ],
            ),
          );
        },
      ),
    );
  }
}
