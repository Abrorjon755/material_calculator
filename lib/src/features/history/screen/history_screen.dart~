import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../common/utils/extensions/context_extension.dart';
import '../../../common/widgets/my_dialog.dart';
import '../provider/history_provider.dart';
import '../widgets/my_text.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HistoryModel>(
      builder: (BuildContext context, value, Widget? child) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            scrolledUnderElevation: 0,
            leadingWidth: 60,
            leading: CupertinoNavigationBarBackButton(
              color: context.colors.onSurface,
            ),
            title: Text(
              context.lang.history,
              style: context.textTheme.titleLarge,
              overflow: TextOverflow.ellipsis,
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () => value.deleteAll(context),
                icon: FaIcon(
                  FontAwesomeIcons.trash,
                  color: context.colors.error,
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
          body: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: value.list.length,
            itemBuilder: (context, index) {
              Map<String, Object?> map = jsonDecode(value.list[index]);
              DateTime time = DateTime.fromMillisecondsSinceEpoch(
                int.parse(map["time"].toString()),
              );
              return SizedBox(
                height: 150,
                child: InkWell(
                  overlayColor: WidgetStateColor.transparent,
                  onTap: () => showDialog(
                    context: context,
                    builder: (context) => PopScope(
                      canPop: false,
                      child: MyDialog(
                        result: double.parse(map["result"].toString()),
                      ),
                    ),
                  ),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: context.colors.surface,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(40),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: context.colors.surfaceContainerLowest,
                          blurRadius: 30,
                          offset: const Offset(-20, -20),
                        ),
                        BoxShadow(
                          color: context.colors.surfaceContainerHighest,
                          blurRadius: 30,
                          offset: const Offset(20, 20),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(40),
                      ),
                      child: Slidable(
                        direction: Axis.horizontal,
                        endActionPane: ActionPane(
                          extentRatio: 1 / 2.5,
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) =>
                                  value.delete(index, context),
                              icon: FontAwesomeIcons.trash,
                              autoClose: true,
                              backgroundColor: context.colors.error,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Image(
                              image: AssetImage(
                                  "assets/images/${map['type']}_example.jpg"),
                              colorBlendMode: BlendMode.modulate,
                              color: context.colors.secondary,
                              fit: BoxFit.fitHeight,
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    MyText(
                                      text: map['a'],
                                      name: context.lang.sideA,
                                    ),
                                    MyText(
                                      text: map['b'],
                                      name: context.lang.sideB,
                                    ),
                                    MyText(
                                      text: map['d'],
                                      name: context.lang.sideD,
                                    ),
                                    MyText(
                                      text: map['s'],
                                      name: context.lang.sideS,
                                    ),
                                    MyText(
                                      text: map['l'],
                                      name: context.lang.length,
                                    ),
                                    const Spacer(),
                                    Text(
                                      "${time.hour}:${time.minute} || ${time.day}.${time.month}.${time.year}",
                                      style: context.textTheme.bodySmall,
                                      textAlign: TextAlign.right,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: 25),
          )),
    );
  }
}
