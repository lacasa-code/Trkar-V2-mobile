import 'package:flutter/material.dart';
import 'package:textfield_tags/textfield_tags.dart';
import '../extensions/string.dart';
import '../themes/screen_utility.dart';

class RegisterTagsField extends StatelessWidget {
  const RegisterTagsField({
    Key? key,
    this.controller,
    this.validator,
    this.hintText,
    this.initialTags,
    this.thinBorder = true,
    this.contentPadding,
    this.noLocalLabelText,
    this.noLocalHintText,
    this.labelText,
    this.removePadding = false,
  }) : super(key: key);
  final TextfieldTagsController? controller;
  final String? Function(String?)? validator;
  final String? hintText;
  final List<String>? initialTags;
  final bool thinBorder;
  final EdgeInsetsGeometry? contentPadding;
  final String? noLocalLabelText;
  final String? noLocalHintText;
  final String? labelText;
  final bool removePadding;
  @override
  Widget build(BuildContext context) {
    return TextFieldTags(
      textfieldTagsController: controller,
      initialTags: initialTags,
      // textSeparators: const [' ', ','],
      letterCase: LetterCase.normal,
      validator: validator,
      inputfieldBuilder: (context, tec, fn, error, onChanged, onSubmitted) {
        return ((context, sc, tags, onTagDelete) {
          return Padding(
            padding: removePadding
                ? EdgeInsets.zero
                : const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            // padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: tec,
              focusNode: fn,
              decoration: InputDecoration(
                contentPadding: contentPadding,
                counterText: '',
                filled: true,
                fillColor: Colors.white,
                labelText: noLocalLabelText ?? labelText?.translate,
                hintText: noLocalHintText ?? hintText?.translate,
                labelStyle: TextStyle(
                  color: thinBorder
                      ? MainStyle.newGreyColor.withOpacity(0.6)
                      : MainStyle.darkGreyColor,
                ),
                hintStyle: TextStyle(
                  color: thinBorder
                      ? MainStyle.newGreyColor.withOpacity(0.6)
                      : MainStyle.darkGreyColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(thinBorder ? 12 : 25),
                  borderSide: BorderSide(
                    width: thinBorder ? 1 : 2,
                    color: thinBorder
                        ? MainStyle.lightGreyColor
                        : MainStyle.darkGreyColor,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(thinBorder ? 12 : 25),
                  borderSide: BorderSide(
                    width: thinBorder ? 1 : 2,
                    color: thinBorder
                        ? MainStyle.lightGreyColor
                        : MainStyle.darkGreyColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(thinBorder ? 12 : 25),
                  borderSide: BorderSide(
                    width: thinBorder ? 1 : 2,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                isDense: true,
                // border: const OutlineInputBorder(
                //   borderSide: BorderSide(
                //     color: Color.fromARGB(255, 74, 137, 92),
                //     width: 3.0,
                //   ),
                // ),
                // focusedBorder: const OutlineInputBorder(
                //   borderSide: BorderSide(
                //     color: Color.fromARGB(255, 74, 137, 92),
                //     width: 3.0,
                //   ),
                // ),
                // helperText: 'Enter language...',
                // helperStyle: const TextStyle(
                //   color: Color.fromARGB(255, 74, 137, 92),
                // ),
                // hintText: hintText?.translate,
                errorText: error,
                prefixIconConstraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.74),
                prefixIcon: tags.isNotEmpty
                    ? SingleChildScrollView(
                        controller: sc,
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: tags.map((String tag) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                              color: Theme.of(context).primaryColor,
                            ),
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  child: Text(
                                    '#$tag',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  onTap: () {
                                    print("$tag selected");
                                  },
                                ),
                                const SizedBox(width: 4.0),
                                InkWell(
                                  child: const Icon(
                                    Icons.cancel,
                                    size: 14.0,
                                    color: Color.fromARGB(255, 233, 233, 233),
                                  ),
                                  onTap: () {
                                    onTagDelete(tag);
                                  },
                                )
                              ],
                            ),
                          );
                        }).toList()),
                      )
                    : null,
              ),
              onChanged: onChanged,
              onSubmitted: onSubmitted,
            ),
          );
        });
      },
    );
  }
}
