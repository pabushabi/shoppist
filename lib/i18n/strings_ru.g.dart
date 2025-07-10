///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsRu implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsRu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsRu _root = this; // ignore: unused_field

	@override 
	TranslationsRu $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsRu(meta: meta ?? this.$meta);

	// Translations
	@override String get name => 'Имя';
	@override String get desc => 'Описание';
	@override String get couldBeDesc => 'Здесь могло бы быть описание';
	@override String get current_count => 'Текущее кол-во:';
	@override String get max_count => 'Необходимо:';
	@override late final _TranslationsTagRu tag = _TranslationsTagRu._(_root);
	@override String get save => 'Сохранить';
	@override String get create_new => 'Создать новый элемент';
	@override String get create => 'Создать';
	@override String get edit => 'Редактировать';
	@override String get empty => 'Что-то пустовато тут, может создать что-нибудь?';
	@override String get deleted => 'Удален';
	@override String get delete => 'Удалить';
	@override String get undo => 'Отменить';
	@override String get add => 'Добавить';
	@override late final _TranslationsSettingsRu settings = _TranslationsSettingsRu._(_root);
	@override String get cancel => 'Отмена';
	@override late final _TranslationsColorsRu colors = _TranslationsColorsRu._(_root);
	@override late final _TranslationsSortRu sort = _TranslationsSortRu._(_root);
	@override late final _TranslationsPushRu push = _TranslationsPushRu._(_root);
	@override late final _TranslationsWidgetRu widget = _TranslationsWidgetRu._(_root);
}

// Path: tag
class _TranslationsTagRu implements TranslationsTagEn {
	_TranslationsTagRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get tag => 'Тэг';
	@override String get add => 'Добавить новый тэг';
	@override String get enter_name => 'Имя:';
	@override String get choose_color => 'Цвет:';
	@override String get menu => 'Меню редактирования тэгов';
	@override String get enter => 'Войти';
}

// Path: settings
class _TranslationsSettingsRu implements TranslationsSettingsEn {
	_TranslationsSettingsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get settings => 'Настройки';
	@override String get system => 'Системa';
	@override String get language => 'Язык';
	@override String get theme => 'Тема';
	@override String get family_code => 'Код семьи';
	@override String get enter_code => 'Введите новый код';
	@override String get note_code => 'Внимание: все ваши старые записи останутся в старой семье и не перенесутся в новую';
}

// Path: colors
class _TranslationsColorsRu implements TranslationsColorsEn {
	_TranslationsColorsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get red => 'Красный';
	@override String get pink => 'Розовый';
	@override String get purple => 'Фиолетовый';
	@override String get deepPurple => 'Тёмно фиолетовый';
	@override String get indigo => 'Индиго';
	@override String get blue => 'Синий';
	@override String get lightBlue => 'Светло синий';
	@override String get cyan => 'Голубой';
	@override String get teal => 'Бирюзовый';
	@override String get green => 'Зелёный';
	@override String get lightGreen => 'Светло зелёный';
	@override String get lime => 'Лаймовый';
	@override String get yellow => 'Жёлтый';
	@override String get amber => 'Янтарный';
	@override String get orange => 'Оранжевый';
	@override String get deepOrange => 'Тёмно оранжевый';
	@override String get brown => 'Коричнеый';
	@override String get blueGrey => 'Серый';
}

// Path: sort
class _TranslationsSortRu implements TranslationsSortEn {
	_TranslationsSortRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get alphabet => 'По алфавиту';
	@override String get type => 'По типу';
	@override String get none => 'Нет';
}

// Path: push
class _TranslationsPushRu implements TranslationsPushEn {
	_TranslationsPushRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get turn_on => 'Включить уведомления';
	@override String get is_empty => 'Уведомить, когда запасы почти кончились';
	@override String get reports => 'Ежедневные отчеты';
	@override String get time_of_reports => 'Время отчётов';
	@override String get attention => 'Обратите внимание на ';
	@override String get ran_out => 'кончилось';
	@override String get left => 'осталось';
	@override String get productsRanOut => 'Продукты заканчиваются';
	@override String get daily_report => 'Ежедневный отчёт';
}

// Path: widget
class _TranslationsWidgetRu implements TranslationsWidgetEn {
	_TranslationsWidgetRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get wowEmpty => 'Ух ты, ничего нет...';
	@override String get goodWork => 'Хорошая работа!';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsRu {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'name': return 'Имя';
			case 'desc': return 'Описание';
			case 'couldBeDesc': return 'Здесь могло бы быть описание';
			case 'current_count': return 'Текущее кол-во:';
			case 'max_count': return 'Необходимо:';
			case 'tag.tag': return 'Тэг';
			case 'tag.add': return 'Добавить новый тэг';
			case 'tag.enter_name': return 'Имя:';
			case 'tag.choose_color': return 'Цвет:';
			case 'tag.menu': return 'Меню редактирования тэгов';
			case 'tag.enter': return 'Войти';
			case 'save': return 'Сохранить';
			case 'create_new': return 'Создать новый элемент';
			case 'create': return 'Создать';
			case 'edit': return 'Редактировать';
			case 'empty': return 'Что-то пустовато тут, может создать что-нибудь?';
			case 'deleted': return 'Удален';
			case 'delete': return 'Удалить';
			case 'undo': return 'Отменить';
			case 'add': return 'Добавить';
			case 'settings.settings': return 'Настройки';
			case 'settings.system': return 'Системa';
			case 'settings.language': return 'Язык';
			case 'settings.theme': return 'Тема';
			case 'settings.family_code': return 'Код семьи';
			case 'settings.enter_code': return 'Введите новый код';
			case 'settings.note_code': return 'Внимание: все ваши старые записи останутся в старой семье и не перенесутся в новую';
			case 'cancel': return 'Отмена';
			case 'colors.red': return 'Красный';
			case 'colors.pink': return 'Розовый';
			case 'colors.purple': return 'Фиолетовый';
			case 'colors.deepPurple': return 'Тёмно фиолетовый';
			case 'colors.indigo': return 'Индиго';
			case 'colors.blue': return 'Синий';
			case 'colors.lightBlue': return 'Светло синий';
			case 'colors.cyan': return 'Голубой';
			case 'colors.teal': return 'Бирюзовый';
			case 'colors.green': return 'Зелёный';
			case 'colors.lightGreen': return 'Светло зелёный';
			case 'colors.lime': return 'Лаймовый';
			case 'colors.yellow': return 'Жёлтый';
			case 'colors.amber': return 'Янтарный';
			case 'colors.orange': return 'Оранжевый';
			case 'colors.deepOrange': return 'Тёмно оранжевый';
			case 'colors.brown': return 'Коричнеый';
			case 'colors.blueGrey': return 'Серый';
			case 'sort.alphabet': return 'По алфавиту';
			case 'sort.type': return 'По типу';
			case 'sort.none': return 'Нет';
			case 'push.turn_on': return 'Включить уведомления';
			case 'push.is_empty': return 'Уведомить, когда запасы почти кончились';
			case 'push.reports': return 'Ежедневные отчеты';
			case 'push.time_of_reports': return 'Время отчётов';
			case 'push.attention': return 'Обратите внимание на ';
			case 'push.ran_out': return 'кончилось';
			case 'push.left': return 'осталось';
			case 'push.productsRanOut': return 'Продукты заканчиваются';
			case 'push.daily_report': return 'Ежедневный отчёт';
			case 'widget.wowEmpty': return 'Ух ты, ничего нет...';
			case 'widget.goodWork': return 'Хорошая работа!';
			default: return null;
		}
	}
}

