part of '../screen/rectangle_screen.dart';

mixin RectangleScreenController on State<RectangleScreen> {
  late final TextEditingController controllerA;
  late final TextEditingController controllerS;
  late final TextEditingController controllerL;
  late final FocusNode focusNodeA;
  late final FocusNode focusNodeS;
  late final FocusNode focusNodeL;
  late final ScrollController scrollController;

  final _formKey = GlobalKey<FormState>();

  void focus() {
    if (focusNodeA.hasFocus || focusNodeS.hasFocus || focusNodeL.hasFocus) {
      Future.delayed(
        const Duration(milliseconds: 400),
        () {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeInOut,
          );
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    controllerA = TextEditingController();
    controllerS = TextEditingController();
    controllerL = TextEditingController();
    focusNodeA = FocusNode()..addListener(focus);
    focusNodeS = FocusNode()..addListener(focus);
    focusNodeL = FocusNode()..addListener(focus);
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    controllerA.dispose();
    controllerS.dispose();
    controllerL.dispose();
    focusNodeA.dispose();
    focusNodeS.dispose();
    focusNodeL.dispose();
    scrollController.dispose();
    super.dispose();
  }
}
