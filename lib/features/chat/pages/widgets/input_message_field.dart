import 'package:flutter/material.dart';
import 'package:hollo/core/core.dart';
import 'package:hollo/services/service.dart';
import 'package:hollo/shared/shared.dart';

class InputMessageField extends StatefulWidget {
  const InputMessageField({
    super.key,
    required this.contact,
  });

  final UserMdl contact;

  @override
  State<InputMessageField> createState() => _InputMessageFieldState();
}

class _InputMessageFieldState extends State<InputMessageField> {
  String? message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        12,
        12,
        12,
        MediaQuery.of(context).viewInsets.bottom + 12,
      ),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: MyTextField(
              fillColor: MyColor.primary.withOpacity(0.15),
              hintText: 'Send a message...',
              onChanged: (val) {
                setState(() {
                  message = val;
                });
              },
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () async {
              if (message != null) {
                await ZegoService.sendMessage(message!, widget.contact.uid);

                setState(() {
                  message = null;
                });
              }
            },
            child: const Icon(
              Icons.send,
              color: MyColor.primary,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
