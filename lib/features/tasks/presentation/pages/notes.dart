import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/tasks/data/models/note.dart';
import 'package:productive/features/tasks/presentation/bloc/notes_bloc.dart';

import '../widgets/list_item.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  List<String> titles = [
    "Commitment resource lecture",
    "Duas",
    "Commitment resource lecture",
    "Commitment resource lecture",
    "Duas",
  ];
  List<String> desc = [
    "We explained the definition of commitment and it..",
    "Allahuma aeni ealaa dikrika wa shukrika wa husn e..",
    "We explained the definition of commitmen..",
    "We explained the definition of commitment and it..",
    "Allahuma aeni ealaa dikrika wa shukrika wa husn e..",
  ];
  List<bool> audio = [false, false, true, false, false];
  List<String?> images = [
    null,
    null,
    "assets/images/node_picture.png",
    null,
    null
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: context.colors.mainDark,
        // elevation: 0,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: context.colors.white,
            )),
        title: Text(context.localization.notes,
            style: context.style.fontSize24Weight700),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocBuilder<NotesBloc, NotesState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(context.localization.books,
                    style: context.style.fontSize18Weight600
                        .copyWith(color: context.colors.createTaskTime)),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: SvgPicture.asset(context.icons.greenbook),
                    ),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: SvgPicture.asset(context.icons.redbook),
                    ),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: SvgPicture.asset(context.icons.plusbook),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Text(context.localization.quick_notes,
                            style: context.style.fontSize18Weight600.copyWith(
                                color: context.colors.createTaskTime)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: context.colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                if (state.activeStatus == NotesActiveStatus.loading)
                  const Padding(
                    padding: EdgeInsets.only(top: 200),
                    child: Center(
                      child: CupertinoActivityIndicator(
                        color: Colors.white,
                      ),
                    ),
                  )
                else if (state.activeStatus == NotesActiveStatus.error)
                   Padding(
                    padding: const EdgeInsets.only(top: 200),
                    child: Center(
                      child: Text(state.errorMessage!),
                    ),
                  )
                else
                  _buildNotesList(state.notes),
                const SizedBox(height: 100),
              ],
            );
          },
        ),
      ),
    );
  }

  Column _buildBookColumn(String iconPath, String label) {
    return Column(
      children: [
        SvgPicture.asset(
          iconPath,
          height: 91,
        ),
        Text(
          label,
          style: context.style.fontSize16Weight500
              .copyWith(color: context.colors.black),
        ),
      ],
    );
  }

  Widget _buildNotesList(List<NoteModel> notes) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 24),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return ListItem(
          title: notes[index].title,
          image: images[index],
          desc: notes[index].description,
          date: context.localization.day3,
          isAudio: audio[index],
          onDelete: () {
            setState(() {
              titles.removeAt(index);
              desc.removeAt(index);
              images.removeAt(index);
              audio.removeAt(index);
            });
          },
        );
      },
    );
  }
}
