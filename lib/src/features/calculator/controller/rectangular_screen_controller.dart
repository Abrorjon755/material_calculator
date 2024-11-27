part of '../screen/rectangular_screen.dart';

mixin RectangularScreenController on State<RectangularScreen> {
  late final TextEditingController controllerA;
  late final TextEditingController controllerB;
  late final TextEditingController controllerS;
  late final TextEditingController controllerL;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    controllerA = TextEditingController();
    controllerB = TextEditingController();
    controllerS = TextEditingController();
    controllerL = TextEditingController();
  }

  @override
  void dispose() {
    controllerA.dispose();
    controllerB.dispose();
    controllerS.dispose();
    controllerL.dispose();
    super.dispose();
  }
}
