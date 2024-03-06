import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive/assets/icons.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/notes/presentation/list_item.dart';

import '../../../assets/colors.dart';

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
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios, color: context.colors.white
          ,)),
        title: Text(
          context.localization.notes,
          style: context.style.fontSize24Weight700
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
            context.localization.books,
              style:context.style.fontSize18Weight600.copyWith(color: context.colors.createTaskTime)
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child:SvgPicture.asset(context.icons.greenbook) ,
                  height: 100,
                  width: 100,
                ),
                Container(
                  child: SvgPicture.asset(context.icons.redbook),
                  height: 100,
                  width: 100,
                ),
                Container(
                  child: SvgPicture.asset(context.icons.plusbook),
                  height: 100,
                  width: 100,
                )
                
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      context.localization.quick_notes,
                      style:context.style.fontSize18Weight600.copyWith(color: context.colors.createTaskTime)
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Container(
                    decoration:  BoxDecoration(
                      color: context.colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.add),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildNotesList(),
            const SizedBox(height: 100),
          ],
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
          style: context.style.fontSize16Weight500.copyWith(color: context.colors.black),
        ),
      ],
    );
  }

  Widget _buildNotesList() {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 24),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: titles.length,
      itemBuilder: (context, index) {
        return ListItem(
          title: titles[index],
          image: images[index],
          desc: desc[index],
          date:context.localization.day3,
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
