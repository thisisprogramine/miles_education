
import '../../domain/repositories/app_repository.dart';
import '../datasource/local/app_local_datasource.dart';

class AppRepositoryImpl extends AppRepository {
  final AppLocalDataSource _appLocalDataSource;

  AppRepositoryImpl(this._appLocalDataSource);

}
