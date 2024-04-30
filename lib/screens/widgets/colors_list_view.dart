import 'package:flutter/material.dart';
import 'package:notes_app_hive_db/screens/widgets/color_picker_item.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

int currentSelectedIndex = 0;
const List<Color> colors = [
  Colors.blue,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.red,
  Colors.black,
  Colors.white30,
  Colors.pink,
  Colors.purple,
  Colors.grey,
  Colors.amber,
];

class _ColorsListViewState extends State<ColorsListView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 38,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: colors.length,
          itemBuilder: (_, index) => ColorPickerItem(
            isSelected: currentSelectedIndex == index,
            color: colors[index],
            onTap: () {
              setState(() {
                currentSelectedIndex = index;
              });
            },
          ),
          separatorBuilder: (_, __) => const SizedBox(width: 8),
        ),
      ),
    );
  }
}
