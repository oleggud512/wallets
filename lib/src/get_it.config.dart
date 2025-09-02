// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ads_pay_app/src/core/infrastructure/data_sources/firebase_user_data_source.dart'
    as _i569;
import 'package:ads_pay_app/src/features/auth/application/use_cases/delete_account_use_case.dart'
    as _i233;
import 'package:ads_pay_app/src/features/auth/application/use_cases/get_current_user_use_case.dart'
    as _i523;
import 'package:ads_pay_app/src/features/auth/application/use_cases/refresh_user_use_case.dart'
    as _i566;
import 'package:ads_pay_app/src/features/auth/application/use_cases/send_verification_mail_use_case.dart'
    as _i437;
import 'package:ads_pay_app/src/features/auth/application/use_cases/sign_in_with_email_and_password_use_case.dart'
    as _i908;
import 'package:ads_pay_app/src/features/auth/application/use_cases/sign_out_use_case.dart'
    as _i159;
import 'package:ads_pay_app/src/features/auth/application/use_cases/sign_up_with_email_and_password_use_case.dart'
    as _i642;
import 'package:ads_pay_app/src/features/auth/domain/repositories/auth_repository.dart'
    as _i595;
import 'package:ads_pay_app/src/features/auth/infrastructure/repositories/firebase_auth_repository_impl.dart'
    as _i991;
import 'package:ads_pay_app/src/features/history/application/use_cases/delete_history_node_use_case.dart'
    as _i800;
import 'package:ads_pay_app/src/features/history/application/use_cases/make_transaction_use_case.dart'
    as _i233;
import 'package:ads_pay_app/src/features/history/application/use_cases/update_history_node_description.dart'
    as _i671;
import 'package:ads_pay_app/src/features/history/domain/repositories/history_repository.dart'
    as _i665;
import 'package:ads_pay_app/src/features/history/infrastructure/firebase_history_repository_impl.dart'
    as _i468;
import 'package:ads_pay_app/src/features/tags/application/use_cases/add_tag_use_case.dart'
    as _i570;
import 'package:ads_pay_app/src/features/tags/application/use_cases/delete_tag_use_case.dart'
    as _i965;
import 'package:ads_pay_app/src/features/tags/application/use_cases/fetch_tag_use_case.dart'
    as _i401;
import 'package:ads_pay_app/src/features/tags/application/use_cases/watch_tags_use_case.dart'
    as _i1037;
import 'package:ads_pay_app/src/features/tags/domain/repositories/tags_repository.dart'
    as _i824;
import 'package:ads_pay_app/src/features/tags/infrastructure/repositories/firebase_tags_repository_impl.dart'
    as _i643;
import 'package:ads_pay_app/src/features/wallets/application/use_cases/add_wallet_use_case.dart'
    as _i494;
import 'package:ads_pay_app/src/features/wallets/application/use_cases/delete_wallet_use_case.dart'
    as _i121;
import 'package:ads_pay_app/src/features/wallets/application/use_cases/update_wallet_description.dart'
    as _i740;
import 'package:ads_pay_app/src/features/wallets/application/use_cases/watch_wallet_use_case.dart'
    as _i177;
import 'package:ads_pay_app/src/features/wallets/application/use_cases/watch_wallets_use_case.dart'
    as _i666;
import 'package:ads_pay_app/src/features/wallets/domain/repositories/wallets_repository.dart'
    as _i165;
import 'package:ads_pay_app/src/features/wallets/external/data_sources/currency_provider_impl.dart'
    as _i406;
import 'package:ads_pay_app/src/features/wallets/infrastructure/data_sources/currency_provider.dart'
    as _i1021;
import 'package:ads_pay_app/src/features/wallets/infrastructure/repositories/firebase_wallets_repository_impl.dart'
    as _i178;
import 'package:ads_pay_app/src/router.dart' as _i589;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> initialize({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    await gh.singletonAsync<_i1021.CurrencyProvider>(
      () => _i406.RootBundleCurrencyProviderImpl.init(),
      preResolve: true,
    );
    gh.singleton<_i595.AuthRepository>(
        () => _i991.FirebaseAuthRepositoryImpl());
    gh.factory<_i159.SignOutUseCase>(
        () => _i159.SignOutUseCase(gh<_i595.AuthRepository>()));
    gh.factory<_i523.GetCurrentUserUseCase>(
        () => _i523.GetCurrentUserUseCase(gh<_i595.AuthRepository>()));
    gh.factory<_i908.SignInWithEmailAndPasswordUseCase>(() =>
        _i908.SignInWithEmailAndPasswordUseCase(gh<_i595.AuthRepository>()));
    gh.factory<_i437.SendVerificationMailUseCase>(
        () => _i437.SendVerificationMailUseCase(gh<_i595.AuthRepository>()));
    gh.factory<_i566.RefreshUserUseCase>(
        () => _i566.RefreshUserUseCase(gh<_i595.AuthRepository>()));
    gh.factory<_i233.DeleteAccountUseCase>(
        () => _i233.DeleteAccountUseCase(gh<_i595.AuthRepository>()));
    gh.factory<_i642.SignUpWithEmailAndPasswordUseCase>(() =>
        _i642.SignUpWithEmailAndPasswordUseCase(gh<_i595.AuthRepository>()));
    gh.singleton<_i569.FirebaseUserDataSource>(
        () => _i569.FirebaseUserDataSource(gh<_i523.GetCurrentUserUseCase>()));
    gh.singleton<_i824.TagsRepository>(() =>
        _i643.FirebaseTagsRepositoryImpl(gh<_i569.FirebaseUserDataSource>()));
    gh.singleton<_i589.AppRouter>(
        () => _i589.AppRouter(gh<_i595.AuthRepository>()));
    gh.factory<_i965.DeleteTagUseCase>(
        () => _i965.DeleteTagUseCase(gh<_i824.TagsRepository>()));
    gh.factory<_i570.AddTagUseCase>(
        () => _i570.AddTagUseCase(gh<_i824.TagsRepository>()));
    gh.factory<_i401.FetchTagUseCase>(
        () => _i401.FetchTagUseCase(gh<_i824.TagsRepository>()));
    gh.factory<_i1037.WatchTagsUseCase>(
        () => _i1037.WatchTagsUseCase(gh<_i824.TagsRepository>()));
    gh.singleton<_i165.WalletsRepository>(() =>
        _i178.FirebaseWalletsRepositoryImpl(
            gh<_i569.FirebaseUserDataSource>()));
    gh.singleton<_i665.HistoryRepository>(() =>
        _i468.FirebaseHistoryRepositoryImpl(
            gh<_i569.FirebaseUserDataSource>()));
    gh.factory<_i121.DeleteWalletUseCase>(
        () => _i121.DeleteWalletUseCase(gh<_i165.WalletsRepository>()));
    gh.factory<_i177.WatchWalletUseCase>(
        () => _i177.WatchWalletUseCase(gh<_i165.WalletsRepository>()));
    gh.factory<_i740.UpdateWalletDescriptionUseCase>(() =>
        _i740.UpdateWalletDescriptionUseCase(gh<_i165.WalletsRepository>()));
    gh.factory<_i494.AddWalletUseCase>(
        () => _i494.AddWalletUseCase(gh<_i165.WalletsRepository>()));
    gh.factory<_i666.WatchWalletsUseCase>(
        () => _i666.WatchWalletsUseCase(gh<_i165.WalletsRepository>()));
    gh.factory<_i233.MakeTransactionUseCase>(
        () => _i233.MakeTransactionUseCase(gh<_i665.HistoryRepository>()));
    gh.factory<_i800.DeleteHistoryNodeUseCase>(
        () => _i800.DeleteHistoryNodeUseCase(gh<_i665.HistoryRepository>()));
    gh.factory<_i671.UpdateHistoryNodeUseCase>(
        () => _i671.UpdateHistoryNodeUseCase(gh<_i665.HistoryRepository>()));
    return this;
  }
}
