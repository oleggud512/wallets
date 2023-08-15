// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ads_pay_app/src/core/infrastructure/data_sources/firebase_user_data_source.dart'
    as _i15;
import 'package:ads_pay_app/src/features/auth/application/use_cases/delete_account_use_case.dart'
    as _i7;
import 'package:ads_pay_app/src/features/auth/application/use_cases/get_current_user_use_case.dart'
    as _i8;
import 'package:ads_pay_app/src/features/auth/application/use_cases/refresh_user_use_case.dart'
    as _i9;
import 'package:ads_pay_app/src/features/auth/application/use_cases/send_verification_mail_use_case.dart'
    as _i10;
import 'package:ads_pay_app/src/features/auth/application/use_cases/sign_in_with_email_and_password_use_case.dart'
    as _i11;
import 'package:ads_pay_app/src/features/auth/application/use_cases/sign_out_use_case.dart'
    as _i12;
import 'package:ads_pay_app/src/features/auth/application/use_cases/sign_up_with_email_and_password_use_case.dart'
    as _i13;
import 'package:ads_pay_app/src/features/auth/domain/repositories/auth_repository.dart'
    as _i3;
import 'package:ads_pay_app/src/features/auth/infrastructure/repositories/firebase_auth_repository_impl.dart'
    as _i4;
import 'package:ads_pay_app/src/features/history/application/use_cases/delete_history_node_use_case.dart'
    as _i29;
import 'package:ads_pay_app/src/features/history/application/use_cases/make_transaction_use_case.dart'
    as _i18;
import 'package:ads_pay_app/src/features/history/application/use_cases/update_history_node_description.dart'
    as _i21;
import 'package:ads_pay_app/src/features/history/domain/repositories/history_repository.dart'
    as _i16;
import 'package:ads_pay_app/src/features/history/infrastructure/firebase_history_repository_impl.dart'
    as _i17;
import 'package:ads_pay_app/src/features/tags/application/use_cases/add_tag_use_case.dart'
    as _i27;
import 'package:ads_pay_app/src/features/tags/application/use_cases/delete_tag_use_case.dart'
    as _i30;
import 'package:ads_pay_app/src/features/tags/application/use_cases/fetch_tag_use_case.dart'
    as _i32;
import 'package:ads_pay_app/src/features/tags/application/use_cases/watch_tags_use_case.dart'
    as _i24;
import 'package:ads_pay_app/src/features/tags/domain/repositories/tags_repository.dart'
    as _i19;
import 'package:ads_pay_app/src/features/tags/infrastructure/repositories/firebase_tags_repository_impl.dart'
    as _i20;
import 'package:ads_pay_app/src/features/wallets/application/use_cases/add_wallet_use_case.dart'
    as _i28;
import 'package:ads_pay_app/src/features/wallets/application/use_cases/delete_wallet_use_case.dart'
    as _i31;
import 'package:ads_pay_app/src/features/wallets/application/use_cases/update_wallet_description.dart'
    as _i33;
import 'package:ads_pay_app/src/features/wallets/application/use_cases/watch_wallet_use_case.dart'
    as _i25;
import 'package:ads_pay_app/src/features/wallets/application/use_cases/watch_wallets_use_case.dart'
    as _i26;
import 'package:ads_pay_app/src/features/wallets/domain/repositories/wallets_repository.dart'
    as _i22;
import 'package:ads_pay_app/src/features/wallets/external/data_sources/currency_provider_impl.dart'
    as _i6;
import 'package:ads_pay_app/src/features/wallets/infrastructure/data_sources/currency_provider.dart'
    as _i5;
import 'package:ads_pay_app/src/features/wallets/infrastructure/repositories/firebase_wallets_repository_impl.dart'
    as _i23;
import 'package:ads_pay_app/src/router.dart' as _i14;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> initialize({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.AuthRepository>(_i4.FirebaseAuthRepositoryImpl());
    await gh.singletonAsync<_i5.CurrencyProvider>(
      () => _i6.RootBundleCurrencyProviderImpl.init(),
      preResolve: true,
    );
    gh.factory<_i7.DeleteAccountUseCase>(
        () => _i7.DeleteAccountUseCase(gh<_i3.AuthRepository>()));
    gh.factory<_i8.GetCurrentUserUseCase>(
        () => _i8.GetCurrentUserUseCase(gh<_i3.AuthRepository>()));
    gh.factory<_i9.RefreshUserUseCase>(
        () => _i9.RefreshUserUseCase(gh<_i3.AuthRepository>()));
    gh.factory<_i10.SendVerificationMailUseCase>(
        () => _i10.SendVerificationMailUseCase(gh<_i3.AuthRepository>()));
    gh.factory<_i11.SignInWithEmailAndPasswordUseCase>(
        () => _i11.SignInWithEmailAndPasswordUseCase(gh<_i3.AuthRepository>()));
    gh.factory<_i12.SignOutUseCase>(
        () => _i12.SignOutUseCase(gh<_i3.AuthRepository>()));
    gh.factory<_i13.SignUpWithEmailAndPasswordUseCase>(
        () => _i13.SignUpWithEmailAndPasswordUseCase(gh<_i3.AuthRepository>()));
    gh.singleton<_i14.AppRouter>(_i14.AppRouter(gh<_i3.AuthRepository>()));
    gh.singleton<_i15.FirebaseUserDataSource>(
        _i15.FirebaseUserDataSource(gh<_i8.GetCurrentUserUseCase>()));
    gh.singleton<_i16.HistoryRepository>(
        _i17.FirebaseHistoryRepositoryImpl(gh<_i15.FirebaseUserDataSource>()));
    gh.factory<_i18.MakeTransactionUseCase>(
        () => _i18.MakeTransactionUseCase(gh<_i16.HistoryRepository>()));
    gh.singleton<_i19.TagsRepository>(
        _i20.FirebaseTagsRepositoryImpl(gh<_i15.FirebaseUserDataSource>()));
    gh.factory<_i21.UpdateHistoryNodeUseCase>(
        () => _i21.UpdateHistoryNodeUseCase(gh<_i16.HistoryRepository>()));
    gh.singleton<_i22.WalletsRepository>(
        _i23.FirebaseWalletsRepositoryImpl(gh<_i15.FirebaseUserDataSource>()));
    gh.factory<_i24.WatchTagsUseCase>(
        () => _i24.WatchTagsUseCase(gh<_i19.TagsRepository>()));
    gh.factory<_i25.WatchWalletUseCase>(
        () => _i25.WatchWalletUseCase(gh<_i22.WalletsRepository>()));
    gh.factory<_i26.WatchWalletsUseCase>(
        () => _i26.WatchWalletsUseCase(gh<_i22.WalletsRepository>()));
    gh.factory<_i27.AddTagUseCase>(
        () => _i27.AddTagUseCase(gh<_i19.TagsRepository>()));
    gh.factory<_i28.AddWalletUseCase>(
        () => _i28.AddWalletUseCase(gh<_i22.WalletsRepository>()));
    gh.factory<_i29.DeleteHistoryNodeUseCase>(
        () => _i29.DeleteHistoryNodeUseCase(gh<_i16.HistoryRepository>()));
    gh.factory<_i30.DeleteTagUseCase>(
        () => _i30.DeleteTagUseCase(gh<_i19.TagsRepository>()));
    gh.factory<_i31.DeleteWalletUseCase>(
        () => _i31.DeleteWalletUseCase(gh<_i22.WalletsRepository>()));
    gh.factory<_i32.FetchTagUseCase>(
        () => _i32.FetchTagUseCase(gh<_i19.TagsRepository>()));
    gh.factory<_i33.UpdateWalletDescriptionUseCase>(() =>
        _i33.UpdateWalletDescriptionUseCase(gh<_i22.WalletsRepository>()));
    return this;
  }
}
