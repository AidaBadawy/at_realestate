import 'package:aisu_realestate/services/listing_service.dart';
import 'package:aisu_realestate/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:aisu_realestate/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:aisu_realestate/ui/views/home/home_view.dart';
import 'package:aisu_realestate/ui/views/listings/add_listings_view.dart';
import 'package:aisu_realestate/ui/views/payment/add_payment_view.dart';
import 'package:aisu_realestate/ui/views/startup/startup_view.dart';
import 'package:aisu_realestate/ui/views/tenants/add_tenant_tab/add_tenants_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:aisu_realestate/ui/views/wrapper/wrapper_view.dart';
import 'package:aisu_realestate/ui/views/listings/listings_view.dart';
import 'package:aisu_realestate/ui/views/tenants/tenants_view.dart';
import 'package:aisu_realestate/ui/views/payment/payment_view.dart';
import 'package:aisu_realestate/ui/views/reports/reports_view.dart';
import 'package:aisu_realestate/ui/views/settings/settings_view.dart';
import 'package:aisu_realestate/ui/bottom_sheets/document/document_sheet.dart';
import 'package:aisu_realestate/ui/dialogs/confirm/confirm_dialog.dart';
import 'package:aisu_realestate/ui/views/login/login_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: WrapperView),
    MaterialRoute(page: ListingsView),
    MaterialRoute(page: TenantsView),
    MaterialRoute(page: PaymentView),
    MaterialRoute(page: ReportsView),
    MaterialRoute(page: SettingsView),
    MaterialRoute(page: AddListingsView),
    MaterialRoute(page: AddTenantsView),
    CustomRoute(page: AddPaymentView),
    MaterialRoute(page: LoginView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ListingService),

    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    StackedBottomsheet(classType: DocumentSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    StackedDialog(classType: ConfirmDialog),
// @stacked-dialog
  ],
)
class App {}
