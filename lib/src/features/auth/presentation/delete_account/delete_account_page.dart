import 'package:ads_pay_app/src/core/common/constants/sizes.dart';
import 'package:ads_pay_app/src/core/presentation/localization/locale_keys.g.dart';
import 'package:ads_pay_app/src/features/auth/application/use_cases/delete_account_use_case.dart';
import 'package:ads_pay_app/src/features/auth/presentation/login_form/login_form_bloc.dart';
import 'package:ads_pay_app/src/features/auth/presentation/login_form/login_form_widget.dart';
import 'package:ads_pay_app/src/get_it.dart';
import 'package:ads_pay_app/src/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class DeleteAccountPage extends StatelessWidget {
  const DeleteAccountPage({super.key});

  Future<void> onDeleteAccountButton(BuildContext context) async {
    final bloc = context.read<LoginFormBloc>();
    if (!bloc.state.isValid) return;
    final res = await getIt<DeleteAccountUseCase>()(
      bloc.state.email.value, 
      bloc.state.password.value
    );
    res.map((right) => AutoRouter.of(context).replaceAll([const WalletsRoute()]));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginFormBloc(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(title: Text(context.tr(LocaleKeys.deleteAccount))),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  Text(context.tr(LocaleKeys.deleteAccountMessage)),
                  h8gap,
                  const LoginFormWidget(),
                  FilledButton(
                    onPressed: () => onDeleteAccountButton(context), 
                    child: Text(context.tr(LocaleKeys.deleteAccount))
                  )
                ]
              ),
            )
          );
        }
      ),
    );
  }
}