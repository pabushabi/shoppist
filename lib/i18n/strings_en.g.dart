///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	String get name => 'Name';
	String get desc => 'Description';
	String get couldBeDesc => 'There is could be description';
	String get current_count => 'Current count';
	String get max_count => 'Max count';
	late final TranslationsTagEn tag = TranslationsTagEn._(_root);
	String get save => 'Save';
	String get create_new => 'Create new item';
	String get create => 'Create';
	String get edit => 'Edit';
	String get empty => 'It`s too empty here, maybe create a new one?';
	String get deleted => 'Deleted';
	String get delete => 'Delete';
	String get undo => 'Undo';
	String get add => 'Add';
	late final TranslationsSettingsEn settings = TranslationsSettingsEn._(_root);
	String get cancel => 'Cancel';
	late final TranslationsColorsEn colors = TranslationsColorsEn._(_root);
	late final TranslationsSortEn sort = TranslationsSortEn._(_root);
	late final TranslationsPushEn push = TranslationsPushEn._(_root);
	late final TranslationsWidgetEn widget = TranslationsWidgetEn._(_root);
}

// Path: tag
class TranslationsTagEn {
	TranslationsTagEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get tag => 'Tag';
	String get add => 'Add new tag';
	String get enter_name => 'Name:';
	String get choose_color => 'Color:';
	String get menu => 'Enter tag editing menu';
	String get enter => 'Enter';
}

// Path: settings
class TranslationsSettingsEn {
	TranslationsSettingsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get settings => 'Settings';
	String get system => 'System';
	String get language => 'Language';
	String get theme => 'Theme';
	String get family_code => 'Family code';
	String get enter_code => 'Enter new family code';
	String get note_code => 'Note: all old items you added will stay in old family and wont be transfderred to new';
}

// Path: colors
class TranslationsColorsEn {
	TranslationsColorsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get red => 'Red';
	String get pink => 'Pink';
	String get purple => 'Purple';
	String get deepPurple => 'Deep purple';
	String get indigo => 'Indigo';
	String get blue => 'Blue';
	String get lightBlue => 'Light blue';
	String get cyan => 'Cyan';
	String get teal => 'Teal';
	String get green => 'Green';
	String get lightGreen => 'Light green';
	String get lime => 'Lime';
	String get yellow => 'Yellow';
	String get amber => 'Amber';
	String get orange => 'Orange';
	String get deepOrange => 'Deep orange';
	String get brown => 'Brown';
	String get blueGrey => 'Blue grey';
}

// Path: sort
class TranslationsSortEn {
	TranslationsSortEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get alphabet => 'Alphabet';
	String get type => 'Type';
	String get none => 'None';
}

// Path: push
class TranslationsPushEn {
	TranslationsPushEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get turn_on => 'Turn on notifications';
	String get is_empty => 'Notify me when stocks are almost out';
	String get reports => 'Daily reports';
	String get time_of_reports => 'Time of daily reports';
	String get attention => 'Pay attention to ';
	String get ran_out => 'ran out';
	String get left => 'left';
	String get productsRanOut => 'Products are running out';
	String get daily_report => 'Daily report';
}

// Path: widget
class TranslationsWidgetEn {
	TranslationsWidgetEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get wowEmpty => 'Wow, it`s empty...';
	String get goodWork => 'Good work!';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'name': return 'Name';
			case 'desc': return 'Description';
			case 'couldBeDesc': return 'There is could be description';
			case 'current_count': return 'Current count';
			case 'max_count': return 'Max count';
			case 'tag.tag': return 'Tag';
			case 'tag.add': return 'Add new tag';
			case 'tag.enter_name': return 'Name:';
			case 'tag.choose_color': return 'Color:';
			case 'tag.menu': return 'Enter tag editing menu';
			case 'tag.enter': return 'Enter';
			case 'save': return 'Save';
			case 'create_new': return 'Create new item';
			case 'create': return 'Create';
			case 'edit': return 'Edit';
			case 'empty': return 'It`s too empty here, maybe create a new one?';
			case 'deleted': return 'Deleted';
			case 'delete': return 'Delete';
			case 'undo': return 'Undo';
			case 'add': return 'Add';
			case 'settings.settings': return 'Settings';
			case 'settings.system': return 'System';
			case 'settings.language': return 'Language';
			case 'settings.theme': return 'Theme';
			case 'settings.family_code': return 'Family code';
			case 'settings.enter_code': return 'Enter new family code';
			case 'settings.note_code': return 'Note: all old items you added will stay in old family and wont be transfderred to new';
			case 'cancel': return 'Cancel';
			case 'colors.red': return 'Red';
			case 'colors.pink': return 'Pink';
			case 'colors.purple': return 'Purple';
			case 'colors.deepPurple': return 'Deep purple';
			case 'colors.indigo': return 'Indigo';
			case 'colors.blue': return 'Blue';
			case 'colors.lightBlue': return 'Light blue';
			case 'colors.cyan': return 'Cyan';
			case 'colors.teal': return 'Teal';
			case 'colors.green': return 'Green';
			case 'colors.lightGreen': return 'Light green';
			case 'colors.lime': return 'Lime';
			case 'colors.yellow': return 'Yellow';
			case 'colors.amber': return 'Amber';
			case 'colors.orange': return 'Orange';
			case 'colors.deepOrange': return 'Deep orange';
			case 'colors.brown': return 'Brown';
			case 'colors.blueGrey': return 'Blue grey';
			case 'sort.alphabet': return 'Alphabet';
			case 'sort.type': return 'Type';
			case 'sort.none': return 'None';
			case 'push.turn_on': return 'Turn on notifications';
			case 'push.is_empty': return 'Notify me when stocks are almost out';
			case 'push.reports': return 'Daily reports';
			case 'push.time_of_reports': return 'Time of daily reports';
			case 'push.attention': return 'Pay attention to ';
			case 'push.ran_out': return 'ran out';
			case 'push.left': return 'left';
			case 'push.productsRanOut': return 'Products are running out';
			case 'push.daily_report': return 'Daily report';
			case 'widget.wowEmpty': return 'Wow, it`s empty...';
			case 'widget.goodWork': return 'Good work!';
			default: return null;
		}
	}
}

