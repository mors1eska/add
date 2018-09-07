﻿//начало текста модуля
&НаКлиенте
Перем Ванесса;

&НаКлиенте
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,Транзакция,Параметр);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯОстанавливаюВыполнениеШаговПриПомещенииФайла()","ЯОстанавливаюВыполнениеШаговПриПомещенииФайла","Я останавливаю выполнение щагов при помещении файла");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ВторойШагПоместитВПеременнуюКонтекстСлужебноеЗначение(Парам01)","ВторойШагПоместитВПеременнуюКонтекстСлужебноеЗначение","Второй шаг поместит в переменную контекст служебное значение ""Тест""");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"НаТретьемШагеЯМогуОбратитьсяКЭтомуСлужебномуЗначению(Парам01)","НаТретьемШагеЯМогуОбратитьсяКЭтомуСлужебномуЗначению","на третьем шаге я могу обратиться к этому служебному значению ""Тест""");

	Возврат ВсеТесты;
КонецФункции

&НаКлиенте
Процедура ПередНачаломСценария() Экспорт
	
КонецПроцедуры

&НаКлиенте
Процедура ПередОкончаниемСценария() Экспорт
	
КонецПроцедуры



&НаКлиенте
Процедура ОбработкаПомещенияФайла(Результат, АдресХранилища, ВыбранноеИмяФайла, ДополнительныеПараметры) Экспорт
	Ванесса.ПродолжитьВыполнениеШагов();
КонецПроцедуры


&НаКлиенте
//Я останавливаю выполнение щагов при помещении файла
//@ЯОстанавливаюВыполнениеШаговПриПомещенииФайла()
Процедура ЯОстанавливаюВыполнениеШаговПриПомещенииФайла() Экспорт
	ИмяФайла = ПолучитьИмяВременногоФайла("txt");
	ЗТ = Новый ЗаписьТекста(ИмяФайла,"UTF-8",,Истина); 
	ЗТ.ЗаписатьСтроку(""); 
	ЗТ.Закрыть();
	
	
	АдресХранилища = "";
	Ванесса.ЗапретитьВыполнениеШагов();
	
	Оповещение = Вычислить("Новый ОписаниеОповещения(""ОбработкаПомещенияФайла"", ЭтотОбъект)");
	Выполнить("НачатьПомещениеФайла(Оповещение, АдресХранилища, ИмяФайла, Ложь, Новый УникальныйИдентификатор)"); 
КонецПроцедуры

&НаКлиенте
//Второй шаг поместит в переменную контекст служебное значение "Тест"
//@ВторойШагПоместитВПеременнуюКонтекстСлужебноеЗначение(Парам01)
Процедура ВторойШагПоместитВПеременнуюКонтекстСлужебноеЗначение(Парам01) Экспорт
	Контекст.Вставить(Парам01,Истина);
КонецПроцедуры

&НаКлиенте
//на третьем шаге я могу обратиться к этому служебному значению "Тест"
//@НаТретьемШагеЯМогуОбратитьсяКЭтомуСлужебномуЗначению(Парам01)
Процедура НаТретьемШагеЯМогуОбратитьсяКЭтомуСлужебномуЗначению(Парам01) Экспорт
	Ванесса.ПроверитьРавенство(Контекст.Тест,Истина,"В структуре Контекст есть значение тест");
КонецПроцедуры


//окончание текста модуля
