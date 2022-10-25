import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:larifood_app/app/modules/search/models/user_search.dart';
import 'package:larifood_app/app/routes/routes.dart';

class UserComponent extends StatelessWidget {
  final UserSearch user;
  const UserComponent({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    // String imageUrl =
    //     "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80";
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.ANOTHER_PROFILE, arguments: [
          {'id': user.id}
        ]);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: user.avatar == null
                      ? const Icon(
                          Icons.abc,
                          size: 50,
                        )
                      : Image.network(
                          user.avatar!,
                          width: 100,
                        ),
                ),
              const  SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.username,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      Text(
                        user.name,
                        style: const TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
