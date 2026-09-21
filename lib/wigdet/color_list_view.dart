import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/add_notes_cubit/add_notes_cubit.dart';
import 'package:notes/models/notes_model.dart';
import 'package:notes/wigdet/color_items.dart';

class ColorListView extends StatefulWidget {
  const ColorListView({super.key, this.note});
  final NotesModel? note;

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
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
                BlocProvider.of<AddNotesCubit>(context).color = colors[index];

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
