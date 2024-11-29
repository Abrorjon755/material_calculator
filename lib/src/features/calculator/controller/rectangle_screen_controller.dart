part of '../screen/rectangle_screen.dart';

mixin RectangleScreenController on State<RectangleScreen> {
  late final TextEditingController controllerA;
  late final TextEditingController controllerS;
  late final TextEditingController controllerL;
  late final ScrollController scrollController;
  late final FocusNode focusNodeA;
  late final FocusNode focusNodeS;
  late final FocusNode focusNodeL;

  final _formKey = GlobalKey<FormState>();

  void focus() {
    if (focusNodeA.hasFocus && focusNodeS.hasFocus && focusNodeL.hasFocus) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    controllerA = TextEditingController();
    controllerS = TextEditingController();
    controllerL = TextEditingController();
    focusNodeA = FocusNode();
    focusNodeS = FocusNode();
    focusNodeL = FocusNode();
    scrollController = ScrollController()..addListener(focus);
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
