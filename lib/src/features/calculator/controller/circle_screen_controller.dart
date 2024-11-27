part of '../screen/circle_screen.dart';

mixin CircleScreenController on State<CircleScreen> {
  late final TextEditingController controllerD;
  late final TextEditingController controllerS;
  late final TextEditingController controllerL;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    controllerD = TextEditingController();
    controllerS = TextEditingController();
    controllerL = TextEditingController();
  }

  @override
  void dispose() {
    controllerD.dispose();
    controllerS.dispose();
    controllerL.dispose();
    super.dispose();
  }
}
