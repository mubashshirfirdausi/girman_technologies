enum PopUpMenuItemName { search, website, linkedIn, contact }

extension PopUpMenuItemNameExtension on PopUpMenuItemName {
  String get name {
    switch (this) {
      case PopUpMenuItemName.search:
        return 'SEARCH';
      case PopUpMenuItemName.website:
        return 'WEBSITE';
      case PopUpMenuItemName.linkedIn:
        return 'LINKEDIN';
      case PopUpMenuItemName.contact:
        return 'CONTACT';
    }
  }
}
