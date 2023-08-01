// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ads_pay_app/src/core/infrastructure/data_sources/firebase_user_data_source.dart'
    as _i9;
import 'package:ads_pay_app/src/features/auth/application/use_cases/get_cur_user_uid_use_case.dart'
    as _i7;
import 'package:ads_pay_app/src/features/auth/domain/repositories/auth_repository.dart'
    as _i3;
import 'package:ads_pay_app/src/features/auth/infrastructure/repositories/firebase_auth_repository_impl.dart'
    as _i4;
import 'package:ads_pay_app/src/features/history/application/use_cases/make_transaction_use_case.dart'
    as _i12;
import 'package:ads_pay_app/src/features/history/domain/repositories/history_repository.dart'
    as _i10;
import 'package:ads_pay_app/src/features/history/infrastructure/firebase_history_repository_impl.dart'
    as _i11;
import 'package:ads_pay_app/src/features/wallets/application/use_cases/add_wallet_use_case.dart'
    as _i16;
import 'package:ads_pay_app/src/features/wallets/application/use_cases/delete_wallet_use_case.dart'
    as _i17;
import 'package:ads_pay_app/src/features/wallets/application/use_cases/watch_wallets_use_case.dart'
    as _i15;
import 'package:ads_pay_app/src/features/wallets/domain/repositories/wallets_repository.dart'
    as _i13;
import 'package:ads_pay_app/src/features/wallets/external/data_sources/currency_provider_impl.dart'
    as _i6;
import 'package:ads_pay_app/src/features/wallets/infrastructure/data_sources/currency_provider.dart'
    as _i5;
import 'package:ads_pay_app/src/features/wallets/infrastructure/repositories/firebase_wallets_repository_impl.dart'
    as _i14;
import 'package:ads_pay_app/src/router.dart' as _i8;
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
    gh.factory<_i7.GetCurUserUidUseCase>(
        () => _i7.GetCurUserUidUseCase(gh<_i3.AuthRepository>()));
    gh.singleton<_i8.AppRouter>(_i8.AppRouter(gh<_i3.AuthRepository>()));
    gh.singleton<_i9.FirebaseUserDataSource>(
        _i9.FirebaseUserDataSource(gh<_i7.GetCurUserUidUseCase>()));
    gh.singleton<_i10.HistoryRepository>(
        _i11.FirebaseHistoryRepositoryImpl(gh<_i9.FirebaseUserDataSource>()));
    gh.factory<_i12.MakeTransactionUseCase>(
        () => _i12.MakeTransactionUseCase(gh<_i10.HistoryRepository>()));
    gh.singleton<_i13.WalletsRepository>(
        _i14.FirebaseWalletsRepositoryImpl(gh<_i9.FirebaseUserDataSource>()));
    gh.factory<_i15.WatchWalletsUseCase>(
        () => _i15.WatchWalletsUseCase(gh<_i13.WalletsRepository>()));
    gh.factory<_i16.AddWalletUseCase>(
        () => _i16.AddWalletUseCase(gh<_i13.WalletsRepository>()));
    gh.factory<_i17.DeleteWalletUseCase>(
        () => _i17.DeleteWalletUseCase(gh<_i13.WalletsRepository>()));
    return this;
  }
}
