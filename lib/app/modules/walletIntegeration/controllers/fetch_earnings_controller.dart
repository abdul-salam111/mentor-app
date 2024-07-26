import 'package:get/get.dart';
import 'package:mentor_app/app/Utils/Utils.dart';
import 'package:mentor_app/app/models/payment/fetch_mentor_earnings_model.dart';
import 'package:mentor_app/app/repositories/wallet_repo.dart';

class FetchEarningsController extends GetxController {
  var isLoading = true.obs;
  var earnings = FetchMentorEarningsModel(
          id: 0, mentorId: 0, inEscrow: 0.0, available: 0.0, review: 0.0)
      .obs;
  var noRecordsFound = false.obs;
  WalletRepo walletRepository = WalletRepo();

  @override
  void onInit() {
    fetchPaymentDetails();
    super.onInit();
  }

  void fetchPaymentDetails() async {
    print(':: inside fetchPaymentDetails');
    try {
      isLoading(true);
      var data = await walletRepository.fetchPaymentDetials();
      if (data is FetchMentorEarningsModel) {
        earnings.value = data;
        noRecordsFound(false);
        print('::: Fetched Data: ${data}');
      } else if (data is FailedFetchMentorEarningsModel) {
        noRecordsFound(true);
        Utils.snakbar(title: "Info", body: data.message);
      }
    } catch (e) {
      Utils.snakbar(title: "Error", body: e.toString());
    } finally {
      isLoading(false);
    }
  }
}
