import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hollo/core/my_color.dart';
import 'package:hollo/core/text_styles.dart';
import 'package:hollo/features/auth/cubits/auth_cubit.dart';

class UsernameBox extends StatelessWidget {
  const UsernameBox({
    super.key,
    required this.username,
  }) : isDark = false;

  const UsernameBox.dark({
    super.key,
    required this.username,
  }) : isDark = true;

  final String username;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();

    return Container(
      width: 200,
      padding: const EdgeInsets.symmetric(
        horizontal: 17,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: isDark
            ? MyColor.secondary.withOpacity(0.4)
            : Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Username',
                  style: TStyles.p5(
                    color: isDark ? MyColor.text : MyColor.lightText,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  username,
                  style: TStyles.sh2(
                    color: isDark ? MyColor.text : MyColor.lightText,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 40),
          InkWell(
            onTap: () async {
              await Clipboard.setData(
                ClipboardData(text: authCubit.state.user?.username ?? ''),
              );
              await Fluttertoast.showToast(msg: 'Username copied!');
            },
            child: Icon(
              Icons.copy,
              size: 20,
              color: isDark ? MyColor.primary : MyColor.lightText,
            ),
          ),
        ],
      ),
    );
  }
}
