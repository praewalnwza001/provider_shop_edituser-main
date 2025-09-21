import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shop_edituser/providers/item_provider.dart';
import 'package:provider_shop_edituser/providers/user_profile_provider.dart';
import 'package:provider_shop_edituser/screens/edit_item_screen.dart';
import 'package:provider_shop_edituser/screens/edit_user_screen.dart';

class ItemListScreen extends StatelessWidget {
  static const routeName = '/';
  const ItemListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<UserProfileProvider>(
          builder: (context, UserProfileProvider, child) {
            return Text(
              'รายการสินค้า (ผู้ใช้: ${UserProfileProvider.username})',
            );
          },
        ),
      ),
      body: Consumer<ItemProvider>(
        builder: (context, itemProvider, child) {
          return ListView.builder(
            itemCount: itemProvider.items.length + 1, // +1 สำหรับปุ่ม
            itemBuilder: (context, ind) {
              if (ind == itemProvider.items.length) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 80,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(EditUserScreen.routeName);
                    },
                    child: const Text('แก้ไข Username'),
                  ),
                );
              }

              final item = itemProvider.items[ind];
              return ListTile(
                title: Text(item.name),
                subtitle: Text(item.description),
                trailing: Text('${item.price} บาท'),
                onTap: () {
                  Navigator.of(
                    context,
                  ).pushNamed(EditItemScreen.routeName, arguments: item.id);
                },
              );
            },
          );
        },
      ),
    );
  }
}