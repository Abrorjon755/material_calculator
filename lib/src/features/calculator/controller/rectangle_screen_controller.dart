part of '../screen/rectangle_screen.dart';

mixin RectangleScreenController on State<RectangleScreen> {
  late final TextEditingController controllerA;
  late final TextEditingController controllerS;
  late final TextEditingController controllerL;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    controllerA = TextEditingController();
    controllerS = TextEditingController();
    controllerL = TextEditingController();
  }

  @override
  void dispose() {
    controllerA.dispose();
    controllerS.dispose();
    controllerL.dispose();
    super.dispose();
  }
}
