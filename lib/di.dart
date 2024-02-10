import 'package:tiger_fortune_app/domain/use_cases/impl/balance_case_impl.dart';
import 'package:tiger_fortune_app/domain/use_cases/interfaces/balance_case.dart';
import 'package:tiger_fortune_app/data/repository/balance_repo.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';
import 'package:tiger_fortune_app/data/repository/balance_repo_impl.dart';

class DI {
  static DI? instance;

  late BalanceRepository balanceRepository;
  late BalanceCase balanceCase;

  DI._();

  static DI getInstance() {
    return instance ?? (instance = DI._());
  }

  Future<void> init() async {
    final directory = await getApplicationSupportDirectory();
    Hive.init(directory.path);
    balanceRepository = BalanceRepositoryImpl(await Hive.openBox('balance'));
    balanceCase = BalanceCaseImpl(balanceRepository);
  }
}
