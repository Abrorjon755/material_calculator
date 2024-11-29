import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../common/constants/constants.dart';
import '../../../common/style/app_images.dart';
import '../../../common/utils/extensions/context_extension.dart';
import '../../../common/widgets/my_dialog.dart';
import '../widgets/my_input.dart';

part '../controller/rectangular_screen_controller.dart';

class RectangularScreen extends StatefulWidget {
  const RectangularScreen({super.key});

  @override
  State<RectangularScreen> createState() => _RectangularScreenState();
}

class _RectangularScreenState extends State<RectangularScreen>
    with RectangularScreenController {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          scrolledUnderElevation: 0,
          elevation: 0,
          leading: CupertinoNavigationBarBackButton(
            color: context.colors.onSurface,
          ),
          leadingWidth: 60,
          title: Text(
            context.lang.rectangular,
            style: context.textTheme.titleLarge,
            overflow: TextOverflow.ellipsis,
          ),
          centerTitle: true,
        ),
        body: LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  controller: scrollController,
                  child: Column(
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          ),
                          color: context.colors.surface,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 30,
                              offset: const Offset(-20, -20),
                              color: context.colors.surfaceContainerLowest,
                            ),
                            BoxShadow(
                              blurRadius: 30,
                              offset: const Offset(20, 20),
                              color: context.colors.surfaceContainerHighest,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          ),
                          child: Image(
                            image:
                                const AssetImage(AppImages.rectangularExample),
                            colorBlendMode: BlendMode.modulate,
                            color: context.colors.secondary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      MyInput(
                        focusNode: focusNodeA,
                        hintText: context.lang.sideA,
                        controller: controllerA,
                        validator: (p0) {
                          if (controllerA.text.isEmpty) {
                            return context.lang.pleaseFill;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      MyInput(
                        focusNode: focusNodeB,
                        hintText: context.lang.sideB,
                        controller: controllerB,
                        validator: (p0) {
                          if (controllerB.text.isEmpty) {
                            return context.lang.pleaseFill;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      MyInput(
                        focusNode: focusNodeS,
                        hintText: context.lang.sideS,
                        controller: controllerS,
                        validator: (p0) {
                          if (controllerS.text.isEmpty) {
                            return context.lang.pleaseFill;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      MyInput(
                        focusNode: focusNodeL,
                        hintText: context.lang.length,
                        controller: controllerL,
                        validator: (p0) {
                          if (controllerL.text.isEmpty) {
                            return context.lang.pleaseFill;
                          }
                          return null;
                        },
                        isNext: false,
                      ),
                      SizedBox(
                          height: MediaQuery.viewPaddingOf(context).bottom),
                    ],
                  ),
                )),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            if (_formKey.currentState?.validate() ?? false) {
              const ro = 7850;
              final s = double.parse(controllerS.text.trim());
              final a = double.parse(controllerA.text.trim());
              final b = double.parse(controllerB.text.trim());
              final l = double.parse(controllerL.text.trim());
              final result = ro / 7850 * 0.0157 * s * (a + b - 2.86 * s) * l;
              Map<String, String> map = {
                "type": 'rectangular',
                "ro": ro.toString(),
                "s": s.toString(),
                "a": a.toString(),
                "b": b.toString(),
                "l": l.toString(),
                "result": result.toString(),
                "time": DateTime.now().millisecondsSinceEpoch.toString(),
              };
              List<String> list =
                  context.dependency.shp.getStringList(Constants.history) ?? [];
              list.add(jsonEncode(map));
              showDialog(
                context: context,
                builder: (context) => PopScope(
                  canPop: false,
                  child: MyDialog(result: result),
                ),
              );
              await context.dependency.shp
                  .setStringList(Constants.history, list);
            }
          },
          backgroundColor: context.colors.surface,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(30),
            ),
            side: BorderSide(
              color: context.colors.onSurface.withOpacity(.2),
            ),
          ),
          child: FaIcon(
            FontAwesomeIcons.check,
            color: context.colors.onSurface,
          ),
        ),
      ),
    );
  }
}
