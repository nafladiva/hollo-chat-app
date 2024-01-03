import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hollo/core/core.dart';

import '../cubit/cubit.dart';
import 'widgets/widgets.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  late ContactCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = ContactCubit()..getAllContact();
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
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Contact List',
            style: TStyles.sh1(),
          ),
        ),
        body: SingleChildScrollView(
          child: BlocBuilder<ContactCubit, ContactState>(
            builder: (context, state) {
              if (state.loadStatus.isLoading) {
                return const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              return Column(
                children: [
                  ...state.contactList.map(
                    (contact) => ContactItem(contact: contact),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
