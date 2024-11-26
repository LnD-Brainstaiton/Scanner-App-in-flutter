import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:scan_23/app/modules/main/model/menu_item.dart';

enum MenuCode { HOME, TOOLS}

extension MenuCodeExtensions on MenuCode {
  BottomNavItem toBottomNavItem(AppLocalizations appLocalization) {
    switch (this) {
      case MenuCode.HOME:
        return BottomNavItem(
          navTitle: appLocalization.bottomNavHome,
          iconSvgName: "ic_home.svg",
          menuCode: MenuCode.HOME,
        );
      case MenuCode.TOOLS:
        return BottomNavItem(
          navTitle: appLocalization.bottomNavTools,
          iconSvgName: "ic_home.svg",
          menuCode: MenuCode.TOOLS,
        );
    }
  }
}
