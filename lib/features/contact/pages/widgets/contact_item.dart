import 'package:flutter/material.dart';
import 'package:hollo/core/core.dart';
import 'package:hollo/features/chat/pages/pages.dart';
import 'package:hollo/shared/shared.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({
    super.key,
    required this.contact,
  });

  final UserMdl contact;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //TODO: start chat
        Navigator.pushReplacement(
          context,
          MaterialPageRoute<void>(
            builder: (context) => ChatPage(contact: contact),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 25,
              backgroundColor: MyColor.secondary,
            ),
            const SizedBox(width: 14),
            Text(
              contact.name,
              style: TStyles.sh2(),
            ),
          ],
        ),
      ),
    );
  }
}
