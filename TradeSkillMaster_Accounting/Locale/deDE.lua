-- ------------------------------------------------------------------------------ --
--                           TradeSkillMaster_Accounting                          --
--           http://www.curse.com/addons/wow/tradeskillmaster_accounting          --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

-- TradeSkillMaster_Accounting Locale - deDE
-- Please use the localization app on CurseForge to update this
-- http://wow.curseforge.com/addons/TradeSkillMaster_Accounting/localization/

local L = LibStub("AceLocale-3.0"):NewLocale("TradeSkillMaster_Accounting", "deDE")
if not L then return end

L["Accounting has not yet collected enough information for this tab. This is likely due to not having recorded enough data points or not seeing any significant fluctuations (over 1k gold) in your gold on hand."] = "Accounting hat bis jetzt noch nicht genug Informationen für diesen Tab gesammelt. Der Grund könnte sein, dass nicht genug Datensätze aufgezeichnet wurden oder dass keine signifikanten Schwankungen (über 1k Gold) bei deinem verfügbaren Gold erkannt wurden."
L["Activity Type"] = "Art der Aktivität"
L["All"] = "Alle"
L["Amount"] = "Betrag"
L["Aucs"] = "Aukt."
L["Average Prices:"] = "Durchschnittspreise:"
L["Avg Buy"] = "Ø Einkauf"
L["Avg Buy Price"] = "Ø Einkaufspreis"
L["Avg Resale Profit"] = "Ø Wiederverkaufsgewinn"
L["Avg Sale"] = "Ø Verkauf"
L["Avg Sell Price"] = "Ø Verkaufspreis"
L["Back to Previous Page"] = "Zurück zur vorherigen Seite"
L["Balance"] = "Bilanz"
L[ [=[Below is a graph of the your character's gold on hand over time.

The x-axis is time and goes from %s to %s
The y-axis is thousands of gold.]=] ] = [=[Das folgende Diagramm zeigt das Einkommen deines Charakters über einem gewissen Zeitraum.

Die X-Achse ist der Zeitraum von %s bis %s
Die Y-Achse ist die Goldmenge in Tausenderschritten.]=]
L["Bought"] = "Gekauft"
L["Buyer/Seller"] = "Käufer/Verkäufer"
L["Cancelled"] = "Abgebrochen"
L["Cancelled Since Last Sale:"] = "Abgebrochen seit ltz. Verkauf:"
L["|cffff0000IMPORTANT:|r When TSM_Accounting last saved data for this realm, it was too big for WoW to handle, so old data was automatically trimmed in order to avoid corruption of the saved variables. The last %s of %s data has been preserved."] = "|cffff0000WICHTIG:|r Als TSM_Accounting Daten für diesen Realm speichern wollte, wurde erkannt, dass sie zu groß für WoW sind, deshalb wurden alte Daten automatisch gekürzt, um eine Beschädigung der gespeicherten Variablen zu vermeiden."
L["Character/Guild to Graph"] = "Bezogen auf Charakter/Gilde"
L["Character to Graph"] = "Bezogen auf Charakter"
L["Clear Old Data"] = "Alte Daten löschen"
L["Click for a detailed report on this item."] = "Klicke auf dieses Item, um einen detaillierten Bericht anzuzeigen."
L["Click this button to permanently remove data older than the number of days selected in the dropdown."] = "Klicke auf diesen Button, um Daten unwiderruflich zu löschen, die älter sind als die ausgewählte Anzahl der Tage im Dropdown."
L["Data older than this many days will be deleted when you click on the button to the right."] = "Daten älter als diese Anzahl von Tagen werden gelöscht, wenn du auf den Button rechts klickst."
L["Days:"] = "Tage:"
L["DD/MM/YY HH:MM"] = "TT/MM/JJ SS:MM"
L["Display Grey Items in Sales"] = "Graue Items in Verkäufe anzeigen"
L["Display Money Transfers"] = "Goldüberweisungen anzeigen"
L["Don't Prompt to Record Trades"] = "Handelsaufzeichnung nicht nachfragen"
L["Earned Per Day:"] = "Einkommen pro Tag:"
L["Expenses"] = "Ausgaben"
L["Expired"] = "Abgelaufen"
L["Expired Since Last Sale:"] = "Abgelaufen seit ltz. Verkauf:"
L["Failed Auctions"] = "Erfolglose Auktionen"
L["Failed Since Last Sale"] = "Erfolglos seit ltz. Verkauf"
L["Failed Since Last Sale (Expired/Cancelled):"] = "Erfolglos seit ltz. Verkauf (Abgelaufen/Abgebrochen):"
L["General Options"] = "Allgemeine Optionen"
L["Gold Earned:"] = "Goldeinkommen:"
L["Gold Spent:"] = "Goldausgaben:"
L["Group"] = "Gruppe"
L["_ Hr _ Min ago"] = "vor _ St _ Min"
L["If checked, Money Transfers will be included in income / expense and summary. Accounting will still track these if disabled but will not show them."] = "Wenn aktiviert, werden Goldüberweisungen in Einkommen / Ausgaben und Zusammenfassung einbezogen. Accounting wird sie auch aufzeichnen, wenn diese Option deaktiviert ist, aber sie werden nicht angezeigt."
L["If checked, poor quality items will be shown in sales data. They will still be included in gold earned totals on the summary tab regardless of this setting"] = "Wenn aktiviert, werden Items mit schlechter Qualität in den Verkaufsdaten gezeigt. Sie werden immer in den Goldbilanzen auf der Zusammenfassung-Seite einbezogen, egal welche Einstellung gerade aktiv ist."
L["If checked, the average purchase price that shows in the tooltip will be the average price for the most recent X you have purchased, where X is the number you have in your bags / bank / guild vault. Otherwise, a simple average of all purchases will be used."] = "Wenn aktiviert, wird der durchschnittliche Einkaufspreis im Tooltip der Durchschnittspreis der letzten X Items in deinen Taschen / Bank / Gildentresor sein, die du gekauft hast. Ansonsten wird ein einfacher Durchschnitt von allen Einkäufen genommen."
L["If checked, the number of cancelled auctions since the last sale will show as up as failed auctions in an item's tooltip. if no sales then the total number of cancelled auctions will be shown."] = "Wenn aktiviert, wird die Anzahl abgebrochener Auktionen seit dem letzten Verkauf im Item-Tooltip als erfolglose Auktionen angezeigt. Falls es keine Verkäufe gab, wird die Gesamtanzahl abgebrochener Auktionen gezeigt."
L["If checked, the number of expired auctions since the last sale will show as up as failed auctions in an item's tooltip. if no sales then the total number of expired auctions will be shown."] = "Wenn aktiviert, wird die Anzahl abgelaufener Auktionen seit dem letzten Verkauf im Item-Tooltip als erfolglose Auktionen angezeigt. Falls es keine Verkäufe gab, wird die Gesamtanzahl abgelaufener Auktionen gezeigt."
L[ [=[If checked, the number you have purchased and the average purchase price will show up in an item's tooltip.

Note: Vendor purchases will not be shown.]=] ] = [=[Wenn aktiviert, wird die Anzahl der gekauften Items und der durchschnittliche Einkaufspreis im Item-Tooltip angezeigt.

Hinweis: Einkäufe beim Händler werden nicht angezeigt.]=]
L[ [=[If checked, the number you have sold and the average sale price will show up in an item's tooltip.

Note: Vendor sales will not be shown.]=] ] = [=[Wenn aktiviert, wird die Anzahl der verkauften Items und der durchschnittliche Verkaufspreis im Item-Tooltip angezeigt.

Hinweis: Verkäufe beim Händler werden nicht angezeigt.]=]
L["If checked, the sale rate will be shown in item tooltips. sale rate is calculated as total sold / (total sold + total expired + total cancelled)."] = "Wenn aktiviert, wird die Verkaufsrate im Item-Tooltip angezeigt. Die Verkaufsrate berechnet sich aus: Gesamtverkäufe / (Gesamtverkäufe + Gesamtabläufe + Gesamtabbrüche)"
L["If checked, whenever you buy or sell any quantity of a single item via trade, Accounting will display a popup asking if you want it to record that transaction."] = "Wenn aktiviert, wird Accounting jedesmal, wenn du eine beliebige Menge eines einzelnen Items via Handel kaufst oder verkaufst, nachfragen, ob diese Transaktion aufgezeichnet werden soll."
L["If checked, you won't get a popup confirmation about whether or not to track trades."] = "Wenn aktiviert, wirst du keine Bestätigungsabfrage bekommen, ob der Handel aufgezeichnet werden soll."
L["Item Name"] = "Name des Items"
L["Items"] = "Items"
L["Items/Resale Price Format"] = "Items/Wiederverkauf-Preisformat"
L["Last %d Days"] = "Ltz. %d Tage"
L["Last Purchased:"] = "Zuletzt eingekauft:"
L["Last Sold:"] = "Zuletzt verkauft:"
L["Market Value"] = "Marktwert"
L["Market Value Source"] = "Quelle des Marktwertes"
L["Max Buy Price"] = "Max Einkaufspreis"
L["Max Sell Price"] = "Max Verkaufspreis"
L["Min Buy Price"] = "Min Einkaufspreis"
L["Min Sell Price"] = "Min Verkaufspreis"
L["MM/DD/YY HH:MM"] = "MM/TT/JJ SS:MM"
L["none"] = "keine"
L["None"] = "Keine"
L["Other Income"] = "Sonstiges Einkommen"
L["Other Player"] = "Anderer Spieler"
L["Per Item"] = "Pro Item"
L["Player"] = "Spieler"
L["Player Gold"] = "Spielergold"
L["Profit:"] = "Gewinn:"
L["Profit Per Day:"] = "Gewinn pro Tag:"
L["Purchase Data"] = "Einkaufsdaten"
L["Purchased (Min/Avg/Max Price):"] = "Gekauft (Min/Ø/Max Preis):"
L["Purchased (Total Price):"] = "Gekauft (Gesamtpreis):"
L["Purchases"] = "Einkäufe"
L["Quantity"] = "Menge"
L["Quantity Bought:"] = "Einkaufsmenge:"
L["Quantity Sold:"] = "Verkaufsmenge:"
L["Rarity"] = "Seltenheit"
L["Removed a total of %s old records and %s items with no remaining records."] = "Insgesamt wurden %s alte Aufzeichnungen und %s Items ohne verbleibende Aufzeichnungen entfernt."
L["Removed record."] = "Aufzeichnung wurde entfernt."
L["Remove Old Data (No Confirmation)"] = "Alte Daten entfernen (ohne Bestätigung)"
L["Resale"] = "Wiederverkauf"
L["Revenue"] = "Einkommen"
L["%s ago"] = "vor %s"
L["Sale Data"] = "Verkaufsdaten"
L["Sale Rate:"] = "Verkaufsrate:"
L["Sales"] = "Verkäufe"
L["Search"] = "Suchen"
L["Select how you would like prices to be shown in the \"Items\" and \"Resale\" tabs; either average price per item or total value."] = "Entscheide, wie die Preise in den Tabs \"Items\" und \"Wiederverkauf\" angezeigt werden sollen; entweder Durchschnittspreis pro Item oder Gesamtwert."
L["Select what format Accounting should use to display times in applicable screens."] = "Entscheide, welches Format für Accounting-spezifische Zeitangaben benutzt werden soll."
L["Select where you want Accounting to get market value info from to show in applicable screens."] = "Entscheide, woher Accounting die Marktwertinformationen beziehen soll."
L["Shift-Right-Click to delete this record."] = "UMSCHALT-Rechtsklick, um diese Aufzeichnung zu löschen."
L["Show cancelled auctions since last sale in item tooltips"] = "Abgebrochene Auktionen seit letztem Verkauf im Item-Tooltip anzeigen"
L["Show expired auctions since last sale in item tooltips"] = "Abgelaufene Auktionen seit letztem Verkauf im Item-Tooltip anzeigen"
L["Show purchase info in item tooltips"] = "Einkaufsinfos im Item-Tooltip anzeigen"
L["Show sale info in item tooltips"] = "Verkaufsinfos im Item-Tooltip anzeigen"
L["Show Sale Rate in item tooltips"] = "Verkaufsrate im Item-Tooltip anzeigen"
L["Sold"] = "Verkauft"
L["Sold (Min/Avg/Max Price):"] = "Verkauft (Min/Ø/Max Preis):"
L["Sold (Total Price):"] = "Verkauft (Gesamtpreis):"
L["Source"] = "Quelle"
L["Spent Per Day:"] = "Ausgaben pro Tag:"
L["Stack"] = "Menge"
L["Summary"] = "Zusammenfassung"
L["Sum of All Characters/Guilds"] = "Summe aller Charaktere/Gilden"
L["There is no purchase data for this item."] = "Keine Einkaufsdaten für dieses Item gefunden."
L["There is no sale data for this item."] = "Keine Verkaufsdaten für dieses Item gefunden."
L["Time"] = "Zeit"
L["Time Format"] = "Zeitformat"
L["Timeframe (Days)"] = "Zeitraum (Tage)"
L["Timeframe Filter"] = "Zeitraum-Filter"
L["Today"] = "Heute"
L["Top Buyers:"] = "Top-Käufer:"
L["Top Expense by Gold / Quantity:"] = "Top-Ausgabe nach Gold / Quali:"
L["Top Income by Gold / Quantity:"] = "Top-Einkommen nach Gold / Quali:"
L["Top Item by Gold / Quantity:"] = "Top-Item nach Gold / Quali:"
L["Top Sellers:"] = "Top-Verkäufer:"
L["Total:"] = "Gesamt:"
L["Total Buy"] = "Gesamteinkauf"
L["Total Buy Price"] = "Gesamteinkaufspreis"
L["Total Price"] = "Gesamtpreis"
L["Total Sale"] = "Gesamtverkauf"
L["Total Sale Price"] = "Gesamtverkaufspreis"
L["Total Spent:"] = "Gesamtausgaben:"
L["Total Value"] = "Gesamtwert"
L["Track Sales/Purchases via Trade"] = "Ver-/Einkäufe via Handel aufzeichnen"
L["TSM_Accounting detected that you just traded %s %s in return for %s. Would you like Accounting to store a record of this trade?"] = "TSM_Accounting hat entdeckt, dass du %s %s im Austausch gegen %s gehandelt hast. Soll Accounting diesen Handel aufzeichnen?"
L["Type"] = "Typ"
L["Use Smart Average for Purchase Price"] = "Smarten Durchschn. für Einkaufspreis nutzen"
L["Yesterday"] = "Gestern"
L[ [=[You can use the options below to clear old data. It is recommened to occasionally clear your old data to keep Accounting running smoothly. Select the minimum number of days old to be removed in the dropdown, then click the button.

NOTE: There is no confirmation.]=] ] = [=[Du kannst die Optionen unten nutzen, um alte Daten zu löschen. Es wird empfohlen, gelegentlich deine alten Daten zu löschen, um einen reibungslosen Ablauf zu gewährleisten. Wähle die Anzahl der Tage im Dropdown aus, deren Daten behalten werden sollen, und klicke dann auf den Button.

HINWEIS: Es erfolgt keine Bestätigungsabfrage.]=]
L["YY/MM/DD HH:MM"] = "JJ/MM/TT SS:MM"
 