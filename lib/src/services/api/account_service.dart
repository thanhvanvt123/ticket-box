import 'package:ticket_box/src/common/endpoints.dart';
import 'package:ticket_box/src/models/account.dart';
import 'package:ticket_box/src/services/api/base_service.dart';

mixin IAccountService {
  Future<Account?> getAccountById(int id);
  Future<Account?> getAccountByEmail(String email, String password);
  Future<Account?> createAccount(Map<String, String> account);
  Future<bool> updateProfile(int id, Map<String, String> data);
  Future<List<Account>> getAccounts();
}

class AccountService extends BaseService<Account> implements IAccountService {
  @override
  String endpoint() {
    return Endpoints.accounts;
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return Account.fromJson(json);
  }

  @override
  Future<Account?> getAccountById(int id) {
    return getByIdBase(id);
  }

  @override
  Future<Account?> getAccountByEmail(String email, String password) {
    return postBase(
      {
        'email': email,
        'password': password,
      },
    );
  }
  @override
  Future<Account?> createAccount(Map<String, String> account) {
    return postBase(account);
  }

  @override
  Future<bool> updateProfile(int id, Map<String, String> data) {
    return putBase(id ,data);
  }

  @override
  Future<List<Account>> getAccounts() {
    return getAllBase({});
  }

}
