
import '../../domain/repositories/authentication_repository.dart';
import '../datasource/local/app_local_datasource.dart';
import '../datasource/local/authentication_local_datasouce.dart';
import '../datasource/remote/authentication_remote_datasource.dart';


class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final AppLocalDataSource _appLocalDataSource;
  final AuthenticationRemoteDataSource _authenticationRemoteDataSource;
  final AuthenticationLocalDataSource _authenticationLocalDataSource;

  AuthenticationRepositoryImpl(
    this._appLocalDataSource,
    this._authenticationRemoteDataSource,
    this._authenticationLocalDataSource,
  );
}
