import 'package:flutter/material.dart';
import 'package:notes/models/notes_model.dart';
import 'package:notes/wigdet/color_items.dart';

class EditColorListView extends StatefulWidget {
  const EditColorListView({super.key, this.note});
  final NotesModel? note;

  @override
  State<EditColorListView> createState() => _EditColorListViewState();
}

class _EditColorListViewState extends State<EditColorListView> {
  List<Color> colors = [
    Color(0xffa31621),
    Color(0xff3F7CAC),
    Color(0xff95afba),
    Color(0xffbdc4a7),
    Color(0xffd5e1a3),
    Color(0xffe2f89c),
  ];
  int currentColor = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30 * 2,
      child: ListView.builder(
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GestureDetector(
              onTap: () {
                currentColor = index;
                widget.note!.color = colors[index].toARGB32();
                setState(() {});
              },
              child: ColorItems(
                isactive: currentColor == index ? true : false,
                color: colors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
