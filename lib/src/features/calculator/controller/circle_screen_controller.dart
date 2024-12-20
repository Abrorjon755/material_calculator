part of '../screen/circle_screen.dart';

mixin CircleScreenController on State<CircleScreen> {
  late final TextEditingController controllerD;
  late final TextEditingController controllerS;
  late final TextEditingController controllerL;
  late final ScrollController scrollController;
  late final FocusNode focusNodeD;
  late final FocusNode focusNodeS;
  late final FocusNode focusNodeL;

  final _formKey = GlobalKey<FormState>();

  void focus() {
    if (focusNodeD.hasFocus || focusNodeS.hasFocus || focusNodeL.hasFocus) {
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
    controllerD = TextEditingController();
    controllerS = TextEditingController();
    controllerL = TextEditingController();
    focusNodeD = FocusNode()..addListener(focus);
    focusNodeS = FocusNode()..addListener(focus);
    focusNodeL = FocusNode()..addListener(focus);
    scrollController = ScrollController()..addListener(focus);
  }

  @override
  void dispose() {
    controllerD.dispose();
    controllerS.dispose();
    controllerL.dispose();
    focusNodeD.dispose();
    focusNodeS.dispose();
    focusNodeL.dispose();
    scrollController.dispose();
    super.dispose();
  }
}
