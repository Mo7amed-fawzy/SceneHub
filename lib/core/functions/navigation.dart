import 'package:go_router/go_router.dart';

void customNavigate(context, String varpath, {Object? extra}) {
  GoRouter.of(context).push(varpath, extra: extra);
  // دي بتبني التطبيق طبقه فوق طبقه push
}

void customReplacementNavigate(context, String varpath) {
  GoRouter.of(context).pushReplacement(varpath);
  // دي بتبني الطبقه الجديده والقديمه بتدمر pushReplacement
}
