import 'package:flutter/material.dart';
import 'package:hollo/core/core.dart';
import 'package:hollo/features/chat/pages/pages.dart';

class PersonTile extends StatelessWidget {
  const PersonTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (context) => const ChatPage(),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundColor: MyColor.secondary,
                ),
                const SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nafla Diva',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TStyles.sh2(),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'How you doing?',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TStyles.p3(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
