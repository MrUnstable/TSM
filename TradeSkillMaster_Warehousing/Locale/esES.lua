-- ------------------------------------------------------------------------------ --
--                          TradeSkillMaster_Warehousing                          --
--          http://www.curse.com/addons/wow/tradeskillmaster_warehousing          --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

-- TradeSkillMaster_Warehousing Locale - esES
-- Please use the localization app on CurseForge to update this
-- http://wow.curseforge.com/addons/TradeSkillMaster_Warehousing/localization/

local L = LibStub("AceLocale-3.0"):NewLocale("TradeSkillMaster_Warehousing", "esES")
if not L then return end

L["'%s' has a Warehousing operation of '%s' which no longer exists."] = "'%s' tiene una operación de Almacenamiento de '%s' que ya no existe."
L["Canceled"] = "Cancelado"
--Translation missing 
-- L["Deposit Reagents"] = ""
L["Displays realtime move data."] = "Muestra movimiento de datos en tiempo real."
L["Empty Bags"] = "Vaciar Bolsas"
L["Enable Restock"] = "Habilita Reposición"
L["Enable this to set the quantity to keep back in your bags"] = "Habilitar esta opción para establecer la cantidad a mantener en tus bolsas"
L["Enable this to set the quantity to keep back in your bank / guildbank"] = "Habilitar esta opción para establecer la cantidad a mantener en tu banco / banco de hermandad"
L["Enable this to set the quantity to move, if disabled Warehousing will move all of the item"] = "Habilitar esta opción para establecer la cantidad a mover, si está deshabilitado Almacenaje moverá todos los objetos"
L["Enable this to set the restock quantity"] = "Habilitar esta opción para establecer la cantidad a reponer"
--Translation missing 
-- L["Enable this to set the stack size multiple to be moved"] = ""
L["General"] = "General"
L["Gets items from the bank or guild bank matching the itemstring, itemID or partial text entered."] = "Obtiene objetos del banco o banco de hermandad coincidente con la cadena objeto, itemID o texto parcial introducido."
L["Invalid criteria entered."] = "Criterio introducido no válido."
L["Keep in Bags Quantity"] = "Mantener una Cantidad en las Bolsas"
L["Keep in Bank/GuildBank Quantity"] = "Mantener una Cantidad en el Banco/Banco de hermandad"
--Translation missing 
-- L["Lists the groups with warehousing operations. Left click to select/deselect the group, Right click to expand/collapse the group."] = ""
L["Move Data has been turned off"] = "Datos de movimientos apagados"
L["Move Data has been turned on"] = "Datos de movimientos activados"
L["Move Group to Bags"] = "Mover Grupo a las Bolsas"
L["Move Group to Bank"] = "Mover Grupo al Banco"
L["Move Quantity"] = "Cantidad de movimiento"
L["Move Quantity Settings"] = "Opciones de la Cantidad de Movimiento"
L["Nothing to Move"] = "Nada que Mover"
L["Nothing to Restock"] = "Nada que Reponer"
L["Preparing to Move"] = "Preparando para Mover"
--Translation missing 
-- L["Puts items matching the itemstring, itemID or partial text entered into the bank or guild bank."] = ""
L["Restock Bags"] = "Reponer Bolsas"
L["Restock Quantity"] = "Reponer Cantidad"
L["Restock Settings"] = "Opciones de Reposición"
L["Restocking"] = "Reposición"
L["Restore Bags"] = "Restablecer Bolsas"
L["Set Keep in Bags Quantity"] = "Establece la Cantidad que se mantiene en las Bolsas"
L["Set Keep in Bank Quantity"] = "Establece la Cantidad que se mantiene en el Banco"
L["Set Move Quantity"] = "Establece la Cantidad a Mover"
--Translation missing 
-- L["Set Stack Size for bags"] = ""
--Translation missing 
-- L["Stack Size Multiple"] = ""
--Translation missing 
-- L["There are no visible banks."] = ""
--Translation missing 
-- L["These will toggle between the module specific tabs."] = ""
--Translation missing 
-- L["This button will deposit all reagents to your reagent bank (if unlocked)."] = ""
--Translation missing 
-- L["This button will de-select all groups."] = ""
--Translation missing 
-- L["This button will empty the contents of your bags and move them all to the bank. It will remember what you moved so that you can use the restore button to put them back"] = ""
--Translation missing 
-- L["This button will move all items in the selected groups using the operation restock settings from the bank to your bags."] = ""
--Translation missing 
-- L["This button will move items in the selected groups from the bank to your bags."] = ""
--Translation missing 
-- L["This button will move items in the selected groups from your bags to the bank."] = ""
--Translation missing 
-- L["This button will restore the items to your bags from the last time you clicked empty bags."] = ""
--Translation missing 
-- L["This button will select all groups."] = ""
--Translation missing 
-- L["Warehousing operations contain settings for moving the items in a group. Type the name of the new operation into the box below and hit 'enter' to create a new Warehousing operation."] = ""
--Translation missing 
-- L["Warehousing will ensure this number remain in your bags when moving items to the bank / guildbank."] = ""
--Translation missing 
-- L["Warehousing will ensure this number remain in your bank / guildbank when moving items to your bags."] = ""
--Translation missing 
-- L["Warehousing will ensure this number remain in your bank / guildbank when restocking items to your bags."] = ""
--Translation missing 
-- L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags."] = ""
--Translation missing 
-- L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = ""
--Translation missing 
-- L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank."] = ""
--Translation missing 
-- L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank. Restock will maintain %d items in your bags."] = ""
--Translation missing 
-- L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bank/gbank > bags."] = ""
--Translation missing 
-- L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = ""
--Translation missing 
-- L["Warehousing will move a max of %d of each item in this group."] = ""
--Translation missing 
-- L["Warehousing will move a max of %d of each item in this group. Restock will maintain %d items in your bags."] = ""
--Translation missing 
-- L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags."] = ""
--Translation missing 
-- L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = ""
--Translation missing 
-- L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank."] = ""
--Translation missing 
-- L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank. Restock will maintain %d items in your bags."] = ""
--Translation missing 
-- L["Warehousing will move all of the items in this group keeping %d of each item back when bank/gbank > bags."] = ""
--Translation missing 
-- L["Warehousing will move all of the items in this group keeping %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = ""
--Translation missing 
-- L["Warehousing will move all of the items in this group."] = ""
--Translation missing 
-- L["Warehousing will move all of the items in this group. Restock will maintain %d items in your bags."] = ""
--Translation missing 
-- L["Warehousing will move this number of each item"] = ""
--Translation missing 
-- L["Warehousing will only move items in multiples of the stack size set when moving to your bags, this is useful for milling/prospecting etc to ensure you don't move items you can't process"] = ""
--Translation missing 
-- L["Warehousing will restock your bags up to this number of items"] = ""
