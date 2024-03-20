import 'package:intl/intl.dart';

export '/services/localization/extention/locale_extention.dart';

extension IntNullableExtention on int? {
  String get count {
    if (this == null) {
      return '0';
    }
    if (this! > 1000) {
      return '${(this! / 1000).toStringAsFixed(1)}k';
    } else if (this! > 1000000) {
      return '${(this! / 1000000).toStringAsFixed(1)}m';
    } else if (this! > 1000000000) {
      return '${(this! / 1000000000).toStringAsFixed(1)}b';
    }

    return toString();
  }
}

extension DateTimeNullableExtention on DateTime? {
  String get timeAgo {
    if (this == null) {
      return '';
    }

    final diff = DateTime.now().difference(this!);
    if (diff.inDays > 365) {
      return '${(diff.inDays / 365).floor()}y';
    } else if (diff.inDays > 30) {
      return '${(diff.inDays / 30).floor()}m';
    } else if (diff.inDays > 7) {
      return '${(diff.inDays / 7).floor()}w';
    } else if (diff.inDays > 0) {
      return '${diff.inDays}d';
    } else if (diff.inHours > 0) {
      return '${diff.inHours}h';
    } else if (diff.inMinutes > 0) {
      return '${diff.inMinutes}m';
    } else if (diff.inSeconds > 0) {
      return '${diff.inSeconds}s';
    }
    return '';
  }

  String get timeWithAgo {
    if (this == null) {
      return '';
    }
    return '$timeAgo ago';
  }

  String get format {
    if (this == null) {
      return '';
    }
    return DateFormat('MM-dd-yyyy HH:mm').format(this!);
  }
}
