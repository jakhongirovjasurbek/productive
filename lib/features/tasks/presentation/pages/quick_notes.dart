import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive/assets/icons.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/create/presentation/widgets/w_text_field.dart';
import 'package:productive/features/tasks/data/models/note_model.dart';

class QuickNotes extends StatefulWidget {
  const QuickNotes({Key? key}) : super(key: key);

  @override
  _QuickNotesState createState() => _QuickNotesState();
}

class _QuickNotesState extends State<QuickNotes> {
  late String title;
   QuillController _controller = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SvgPicture.asset(AppIcons.left),
            const Spacer(),
            Text(context.localization.quick_notes,
            style: context.style.fontSize24Weight700,
            ),
            const Spacer(),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20,left: 16,right: 16,bottom:
        MediaQuery.of(context).padding.bottom),
        child: Column(
          children: [
            TextField(
              focusNode: FocusNode(),
              maxLines: 2,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration.collapsed(
                  hintText: "dsfdsg",
              hintStyle: TextStyle(color: Colors.white)),
            ),
            Expanded(
                child: QuillEditor(
                  configurations: QuillEditorConfigurations(
                      textCapitalization: TextCapitalization.words,

                      textSelectionThemeData: const TextSelectionThemeData(
                          cursorColor: Colors.white,
                          selectionColor: Colors.white,
                          selectionHandleColor: Colors.grey
                      ), controller: _controller
                  ),
                  focusNode: FocusNode(descendantsAreTraversable: false),
                  scrollController: ScrollController(),
                )
            ),

            QuillToolbar(
              configurations: const QuillToolbarConfigurations(

              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(color: Colors.white,width: 0.2))

                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    QuillToolbarToggleCheckListButton(
                      controller: _controller,
                      options: QuillToolbarToggleCheckListButtonOptions(
                          iconTheme: QuillIconTheme(
                            iconButtonSelectedData: const IconButtonData(
                                color: Colors.red,
                                selectedIcon: Icon(Icons.add),
                                style: ButtonStyle()
                              // SvgPicture.asset(AppIcons.checkBox,color: Colors.red,)
                            ),
                            iconButtonUnselectedData: IconButtonData(
                                selectedIcon: SvgPicture.asset(AppIcons.checkedBox)
                            ),

                          )
                      ),
                    ),
                    QuillToolbarCustomButton(controller: _controller,
                      options: QuillToolbarCustomButtonOptions(
                          afterButtonPressed: (){
                            _controller.changes;
                          },
                          icon: SvgPicture.asset(AppIcons.picture)
                      ),
                    ),
                QuillToolbarCustomButton(controller: _controller,
                  options: QuillToolbarCustomButtonOptions(
                      afterButtonPressed: (){
                         print('worked');
                        _controller.copiedImageUrl = "image" as ImageUrl? ;
                      },
                    icon: SvgPicture.asset(AppIcons.picture)
                  ),),

                    // Text Color
                    QuillToolbarColorButton(
                      controller: _controller,
                      isBackground: false,
                      options: const QuillToolbarColorButtonOptions(
                        // dialogBarrierColor: Colors.white,
                        iconTheme: QuillIconTheme(
                          iconButtonUnselectedData: IconButtonData(
                            color: Colors.white,
                            disabledColor: Colors.white
                          ),
                          iconButtonSelectedData: IconButtonData(
                            color: Colors.yellow,
                          ),
                          iconButtonUnselectedStyle: ButtonStyle(

                          )
                        )
                      ),
                    ),


                    QuillToolbarToggleStyleButton(
                      controller: _controller,
                      attribute: Attribute.ul,
                    ),

                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
