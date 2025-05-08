import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:master_ifab/config/config.dart';

class DomusScreen extends StatelessWidget {
  const DomusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ifabApp')
      ),
       body: _DomusView(),
    );
  }
}

class _DomusView extends StatelessWidget {

  const _DomusView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder:(context, index) {
        final menuItem = appMenuItems[index];
        return _PropriumListTile(menuItem: menuItem);
      },
      );
  }
}

class _PropriumListTile extends StatelessWidget {

  final MenuItem menuItem;

  const _PropriumListTile({
    required this.menuItem
  });

  @override
  Widget build(BuildContext context) {

    final colorum = Theme.of(context).colorScheme;

    return ListTile(
      title: Text(menuItem.titulus),
      subtitle: Text(menuItem.subTitulus),
      leading: Icon(menuItem.icon, color: colorum.primary,),
      trailing: Icon(Icons.arrow_forward_ios_rounded),
      onTap: () {
        context.push(menuItem.link);
      },
    );
  }
}