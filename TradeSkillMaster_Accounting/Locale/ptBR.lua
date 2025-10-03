-- ------------------------------------------------------------------------------ --
--                           TradeSkillMaster_Accounting                          --
--           http://www.curse.com/addons/wow/tradeskillmaster_accounting          --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

-- TradeSkillMaster_Accounting Locale - ptBR
-- Please use the localization app on CurseForge to update this
-- http://wow.curseforge.com/addons/TradeSkillMaster_Accounting/localization/

local L = LibStub("AceLocale-3.0"):NewLocale("TradeSkillMaster_Accounting", "ptBR")
if not L then return end

L = L or {}
L["%s ago"] = "%s atrás"
L["_ Hr _ Min ago"] = "_ Hr _ Min atrás"
--[[Translation missing --]]
L["|cffff0000IMPORTANT:|r When TSM_Accounting last saved data for this realm, it was too big for WoW to handle, so old data was automatically trimmed in order to avoid corruption of the saved variables. The last %s of %s data has been preserved."] = "|cffff0000IMPORTANT:|r When TSM_Accounting last saved data for this realm, it was too big for WoW to handle, so old data was automatically trimmed in order to avoid corruption of the saved variables. The last %s of %s data has been preserved."
--[[Translation missing --]]
L["Accounting has not yet collected enough information for this tab. This is likely due to not having recorded enough data points or not seeing any significant fluctuations (over 1k gold) in your gold on hand."] = "Accounting has not yet collected enough information for this tab. This is likely due to not having recorded enough data points or not seeing any significant fluctuations (over 1k gold) in your gold on hand."
L["Activity Type"] = "Tipo de Atividade"
L["All"] = "Todos"
L["Amount"] = "Quantidade"
L["Aucs"] = "Aucs"
L["Average Prices:"] = "Preços Médios:"
--[[Translation missing --]]
L["Avg Buy"] = "Avg Buy"
L["Avg Buy Price"] = "Preço de Compra Médio"
L["Avg Resale Profit"] = "Lucro de Revenda Médio"
--[[Translation missing --]]
L["Avg Sale"] = "Avg Sale"
L["Avg Sell Price"] = "Preço de Venda Médio"
L["Back to Previous Page"] = "Voltar à Página Anterior"
L["Balance"] = "Balanço"
--[[Translation missing --]]
L[ [=[Below is a graph of the your character's gold on hand over time.

The x-axis is time and goes from %s to %s
The y-axis is thousands of gold.]=] ] = [=[Below is a graph of the your character's gold on hand over time.

The x-axis is time and goes from %s to %s
The y-axis is thousands of gold.]=]
L["Bought"] = "Comprado"
L["Buyer/Seller"] = "Comprador/Vendedor"
L["Cancelled"] = "Cancelado"
L["Cancelled Since Last Sale:"] = "Cancelado desde Última Venda:"
--[[Translation missing --]]
L["Character to Graph"] = "Character to Graph"
--[[Translation missing --]]
L["Character/Guild to Graph"] = "Character/Guild to Graph"
L["Clear Old Data"] = "Limpar Dados Antigos"
L["Click for a detailed report on this item."] = "Clique para um relatório detalhado sobre este item."
L["Click this button to permanently remove data older than the number of days selected in the dropdown."] = "Clique neste botão para remover permanentemente dados mais antigos que o número de dias selecionado na lista."
L["Data older than this many days will be deleted when you click on the button to the right."] = "Dados mais antigos que esta quantidade de dias serão removidos quando você clicar no botão à direita."
L["Days:"] = "Dias:"
L["DD/MM/YY HH:MM"] = "DD/MM/YY HH:MM"
L["Display Grey Items in Sales"] = "Mostrar itens cinza em Vendas"
--[[Translation missing --]]
L["Display Money Transfers"] = "Display Money Transfers"
--[[Translation missing --]]
L["Don't Prompt to Record Trades"] = "Don't Prompt to Record Trades"
L["Earned Per Day:"] = "Obtidos Por Dia:"
L["Expenses"] = "Despesas"
L["Expired"] = "Expirado"
L["Expired Since Last Sale:"] = "Expirado desde Última Venda:"
L["Failed Auctions"] = "Leilões falhos"
--[[Translation missing --]]
L["Failed Since Last Sale"] = "Failed Since Last Sale"
L["Failed Since Last Sale (Expired/Cancelled):"] = "Falhas desde última venda (Expirado/Cancelado):"
L["General Options"] = "Opções Gerais"
L["Gold Earned:"] = "Ouro Obtido:"
L["Gold Spent:"] = "Ouro Gasto:"
L["Group"] = "Grupo"
--[[Translation missing --]]
L["If checked, Money Transfers will be included in income / expense and summary. Accounting will still track these if disabled but will not show them."] = "If checked, Money Transfers will be included in income / expense and summary. Accounting will still track these if disabled but will not show them."
--[[Translation missing --]]
L["If checked, poor quality items will be shown in sales data. They will still be included in gold earned totals on the summary tab regardless of this setting"] = "If checked, poor quality items will be shown in sales data. They will still be included in gold earned totals on the summary tab regardless of this setting"
--[[Translation missing --]]
L["If checked, the average purchase price that shows in the tooltip will be the average price for the most recent X you have purchased, where X is the number you have in your bags / bank / guild vault. Otherwise, a simple average of all purchases will be used."] = "If checked, the average purchase price that shows in the tooltip will be the average price for the most recent X you have purchased, where X is the number you have in your bags / bank / guild vault. Otherwise, a simple average of all purchases will be used."
--[[Translation missing --]]
L["If checked, the number of cancelled auctions since the last sale will show as up as failed auctions in an item's tooltip. if no sales then the total number of cancelled auctions will be shown."] = "If checked, the number of cancelled auctions since the last sale will show as up as failed auctions in an item's tooltip. if no sales then the total number of cancelled auctions will be shown."
--[[Translation missing --]]
L["If checked, the number of expired auctions since the last sale will show as up as failed auctions in an item's tooltip. if no sales then the total number of expired auctions will be shown."] = "If checked, the number of expired auctions since the last sale will show as up as failed auctions in an item's tooltip. if no sales then the total number of expired auctions will be shown."
--[[Translation missing --]]
L[ [=[If checked, the number you have purchased and the average purchase price will show up in an item's tooltip.

Note: Vendor purchases will not be shown.]=] ] = [=[If checked, the number you have purchased and the average purchase price will show up in an item's tooltip.

Note: Vendor purchases will not be shown.]=]
--[[Translation missing --]]
L[ [=[If checked, the number you have sold and the average sale price will show up in an item's tooltip.

Note: Vendor sales will not be shown.]=] ] = [=[If checked, the number you have sold and the average sale price will show up in an item's tooltip.

Note: Vendor sales will not be shown.]=]
--[[Translation missing --]]
L["If checked, the sale rate will be shown in item tooltips. sale rate is calculated as total sold / (total sold + total expired + total cancelled)."] = "If checked, the sale rate will be shown in item tooltips. sale rate is calculated as total sold / (total sold + total expired + total cancelled)."
L["If checked, whenever you buy or sell any quantity of a single item via trade, Accounting will display a popup asking if you want it to record that transaction."] = "Se marcado, sempre que você comprar ou vender qualquer quantidade de um único item através de troca, Accounting  irá exibir um pop-up perguntando se você quer gravar essa transação."
L["If checked, you won't get a popup confirmation about whether or not to track trades."] = "Se marcado, você não verá uma janela de confirmação sobre a existência ou não de controlar trocas."
L["Item Name"] = "Nome do Item"
L["Items"] = "Itens"
L["Items/Resale Price Format"] = "Formato de Preço de Itens/Revenda"
--[[Translation missing --]]
L["Last %d Days"] = "Last %d Days"
L["Last Purchased:"] = "Última compra:"
L["Last Sold:"] = "Último venda"
L["Market Value"] = "Valor de Mercado"
L["Market Value Source"] = "Fonte do Valor de Mercado"
--[[Translation missing --]]
L["Max Buy Price"] = "Max Buy Price"
--[[Translation missing --]]
L["Max Sell Price"] = "Max Sell Price"
--[[Translation missing --]]
L["Min Buy Price"] = "Min Buy Price"
--[[Translation missing --]]
L["Min Sell Price"] = "Min Sell Price"
L["MM/DD/YY HH:MM"] = "MM/DD/YY HH:MM"
L["None"] = "Nenhum"
L["none"] = "nenhum"
L["Other Income"] = "Última renda"
--[[Translation missing --]]
L["Other Player"] = "Other Player"
--[[Translation missing --]]
L["Per Item"] = "Per Item"
L["Player"] = "Jogador"
L["Player Gold"] = "Ouro do jogador"
L["Profit Per Day:"] = "Lucro por dia:"
L["Profit:"] = "Lucro:"
L["Purchase Data"] = "Dados de Compra"
--[[Translation missing --]]
L["Purchased (Min/Avg/Max Price):"] = "Purchased (Min/Avg/Max Price):"
L["Purchased (Total Price):"] = "Compra (Preço total):"
L["Purchases"] = "Compras"
L["Quantity"] = "Quantidade"
L["Quantity Bought:"] = "Quantidade Comprada:"
L["Quantity Sold:"] = "Quantidade Vendida:"
L["Rarity"] = "Raridade"
L["Remove Old Data (No Confirmation)"] = "Remover Dados Antigos (Sem Confirmação)"
L["Removed a total of %s old records and %s items with no remaining records."] = "Um total de %s registros antigos foram removidos e %s itens não possuem registros restantes."
--[[Translation missing --]]
L["Removed record."] = "Removed record."
L["Resale"] = "Revenda"
L["Revenue"] = "Rendimento"
L["Sale Data"] = "Dados de Venda"
--[[Translation missing --]]
L["Sale Rate:"] = "Sale Rate:"
L["Sales"] = "Vendas"
L["Search"] = "Pesquisar"
L["Select how you would like prices to be shown in the \"Items\" and \"Resale\" tabs; either average price per item or total value."] = "Selecione como você gostaria que os preços sejam exibidos nas abas \"Itens\" e \"Revenda\"; o preço médio por item ou o valor total."
L["Select what format Accounting should use to display times in applicable screens."] = "Selecione em qual formato a Contabilidade deve exibir horas nas telas aplicáveis."
L["Select where you want Accounting to get market value info from to show in applicable screens."] = "Selecione onde você deseja que a Contabilidade pegue a informação de valor de mercado para exibir nas telas aplicáveis."
--[[Translation missing --]]
L["Shift-Right-Click to delete this record."] = "Shift-Right-Click to delete this record."
--[[Translation missing --]]
L["Show cancelled auctions since last sale in item tooltips"] = "Show cancelled auctions since last sale in item tooltips"
--[[Translation missing --]]
L["Show expired auctions since last sale in item tooltips"] = "Show expired auctions since last sale in item tooltips"
L["Show purchase info in item tooltips"] = "Exibir informações de compra nas dicas dos itens"
L["Show sale info in item tooltips"] = "Exibir informações de venda nas dicas dos itens"
--[[Translation missing --]]
L["Show Sale Rate in item tooltips"] = "Show Sale Rate in item tooltips"
L["Sold"] = "Vendido"
L["Sold (Min/Avg/Max Price):"] = "Vendido (Preço Mín./Médio/Máx.):"
L["Sold (Total Price):"] = "Vendido (Preço Total):"
L["Source"] = "Origem"
L["Spent Per Day:"] = "Gasto Por Dia:"
L["Stack"] = "Pilha"
L["Sum of All Characters/Guilds"] = "Soma de Todos Personagens/Guildas"
L["Summary"] = "Sumário"
L["There is no purchase data for this item."] = "Não há dados de compra para este item."
L["There is no sale data for this item."] = "Não há dados de venda para este item."
L["Time"] = "Hora"
L["Time Format"] = "Formato de Hora"
--[[Translation missing --]]
L["Timeframe (Days)"] = "Timeframe (Days)"
--[[Translation missing --]]
L["Timeframe Filter"] = "Timeframe Filter"
L["Today"] = "Hoje"
L["Top Buyers:"] = "Compradores Principais:"
--[[Translation missing --]]
L["Top Expense by Gold / Quantity:"] = "Top Expense by Gold / Quantity:"
--[[Translation missing --]]
L["Top Income by Gold / Quantity:"] = "Top Income by Gold / Quantity:"
--[[Translation missing --]]
L["Top Item by Gold / Quantity:"] = "Top Item by Gold / Quantity:"
L["Top Sellers:"] = "Vendedores Principais:"
--[[Translation missing --]]
L["Total Buy"] = "Total Buy"
L["Total Buy Price"] = "Preço de Compra Total"
L["Total Price"] = "Preço Total"
--[[Translation missing --]]
L["Total Sale"] = "Total Sale"
L["Total Sale Price"] = "Preço de Venda Total"
L["Total Spent:"] = "Total Gasto:"
L["Total Value"] = "Valor Total"
L["Total:"] = "Total:"
--[[Translation missing --]]
L["Track Sales/Purchases via Trade"] = "Track Sales/Purchases via Trade"
--[[Translation missing --]]
L["TSM_Accounting detected that you just traded %s %s in return for %s. Would you like Accounting to store a record of this trade?"] = "TSM_Accounting detected that you just traded %s %s in return for %s. Would you like Accounting to store a record of this trade?"
L["Type"] = "Tipo"
--[[Translation missing --]]
L["Use Smart Average for Purchase Price"] = "Use Smart Average for Purchase Price"
L["Yesterday"] = "Ontem"
L[ [=[You can use the options below to clear old data. It is recommened to occasionally clear your old data to keep Accounting running smoothly. Select the minimum number of days old to be removed in the dropdown, then click the button.

NOTE: There is no confirmation.]=] ] = [=[Você pode utilizar as opções abaixo para limpar seus dados antigos. É recomendado que você limpe seus dados ocasionalmente para manter a Contabilidade rodando leve. Selecione o número de dias mínimo para se remover na lista, então clique no botão.

NOTA: Não há confirmação.]=]
L["YY/MM/DD HH:MM"] = "YY/MM/DD HH:MM"
