// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ads_pay_app/src/core/infrastructure/data_sources/firebase_user_data_source.dart'
    as _i6;
import 'package:ads_pay_app/src/features/auth/application/use_cases/get_cur_user_uid_use_case.dart'
    as _i5;
import 'package:ads_pay_app/src/features/auth/domain/repositories/auth_repository.dart'
    as _i3;
import 'package:ads_pay_app/src/features/auth/infrastructure/repositories/firebase_auth_repository_impl.dart'
    as _i4;
import 'package:ads_pay_app/src/features/wallets/application/use_cases/delete_wallet_use_case.dart'
    as _i10;
import 'package:ads_pay_app/src/features/wallets/application/use_cases/watch_wallets_use_case.dart'
    as _i9;
import 'package:ads_pay_app/src/features/wallets/domain/repositories/wallets_repository.dart'
    as _i7;
import 'package:ads_pay_app/src/features/wallets/infrastructure/repositories/firebase_wallets_repository_impl.dart'
    as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt initialize({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.AuthRepository>(_i4.FirebaseAuthRepositoryImpl());
    gh.factory<_i5.GetCurUserUidUseCase>(
        () => _i5.GetCurUserUidUseCase(gh<_i3.AuthRepository>()));
    gh.singleton<_i6.FirebaseUserDataSource>(
        _i6.FirebaseUserDataSource(gh<_i5.GetCurUserUidUseCase>()));
    gh.singleton<_i7.WalletsRepository>(
        _i8.FirebaseWalletsRepositoryImpl(gh<_i6.FirebaseUserDataSource>()));
    gh.factory<_i9.WatchWalletsUseCase>(
        () => _i9.WatchWalletsUseCase(gh<_i7.WalletsRepository>()));
    gh.factory<_i10.DeleteWalletUseCase>(
        () => _i10.DeleteWalletUseCase(gh<_i7.WalletsRepository>()));
    return this;
  }
}
