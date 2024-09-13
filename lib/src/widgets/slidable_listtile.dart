import 'package:crud/src/constants/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableListtile extends ConsumerWidget {
  final void Function(BuildContext)? update;
  final void Function(BuildContext)? delete;
  final String title;
  final String subtitle;

  const SlidableListtile({
    super.key,
    this.update,
    this.delete,
    required this.subtitle,
    required this.title,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Slidable(
      key: const ValueKey(0),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            flex: 1,
            onPressed: delete,
            backgroundColor: const Color.fromARGB(255, 255, 0, 0),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: kDelete,
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            // An action can be bigger than the others.
            flex: 1,
            onPressed: update,
            backgroundColor: const Color.fromARGB(255, 0, 81, 255),
            foregroundColor: Colors.white,
            icon: Icons.update,
            label: kUpdate,
          ),
        ],
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
