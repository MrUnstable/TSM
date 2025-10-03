-- ------------------------------------------------------------------------------ --
--                           TradeSkillMaster_Vendoring                           --
--           http://www.curse.com/addons/wow/tradeskillmaster_vendoring           --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

-- TradeSkillMaster_Vendoring Locale - zhCN
-- Please use the localization app on CurseForge to update this
-- http://wow.curseforge.com/addons/tradeskillmaster_vendoring/localization/

local L = LibStub("AceLocale-3.0"):NewLocale("TradeSkillMaster_Vendoring", "zhCN")
if not L then return end

L["AH"] = "拍卖行"
L["Alts"] = "角色" -- Needs review
L["Alts AH"] = "角色拍卖行" -- Needs review
L[" and "] = "和"
L["Automatically Sell Vendor trash"] = "自动贩卖垃圾物品"
L["Batch Size"] = "批量大小" -- Needs review
L["BOEs"] = "装备绑定物品" -- Needs review
L["Buy"] = "购买"
L["Buyback"] = "回购"
L["Buy Selected Groups"] = "购买选中分组"
L["Buy Settings"] = "购买设置"
L["Cancel"] = "取消"
L["Chat Message Options"] = "聊天信息选项"
L["Clear Filters"] = "清除筛选"
L["Click on this row to remove this item from the permanent ignore list."] = "点击这一排来从永久忽略列表中移除这件物品。" -- Needs review
L["Click this button to automatically buy for groups which you have selected."] = "点击此按钮来自动购买选中的分组。"
L["Click this button to automatically sell for groups which you have selected."] = "点击这个按钮来自动卖出选中分组。"
L["Collected: %s"] = "已收集：%s"
L["Cost"] = "价值"
L["Could not vendor due to not having free bag space available to split a stack of items."] = "不能卖出因为背包中没有空位用来拆分堆叠。"
L["Default Vendoring Page"] = "默认Vendoring 页面"
L["Destroy Value"] = "分解价值"
L["Display Total Money Received"] = "显示总接收钱数" -- Needs review
L["Do not sell an item if its destroy value meets or exceeds this amount"] = "如果分解价值大于等于这个数字则不卖出商品"
L["Do not sell an item if its market value meets or exceeds this amount"] = "如果市场价值大于等于这个数字则不卖出商品"
L["Enable Buying"] = "允许购买" -- Needs review
L["Enable Selling"] = "允许卖店" -- Needs review
L["Filters >>"] = "筛选 >>"
L["Formula for an item's destroy value"] = "物品摧毁价值方案" -- Needs review
L["Formula for an item's market value"] = "物品市场价格方案"
L["General"] = "通用"
L["General Settings"] = "通用选项"
L["Here you can select groups with TSM_Vendoring operations to be automatically bought or sold."] = "在这里你可以选择分组的TSM_Vendoring操作来自动购买或出售。" -- Needs review
L["Hide Grouped Items"] = "隐藏分组物品"
L["Hide Soulbound Items"] = "隐藏绑定物品"
L["Hold shift to repair with guild bank"] = "按住shift来修复工会银行" -- Needs review
L["If checked, soulbound items will be sold"] = "如果勾选，绑定物品将被出售"
L["If checked, the total amount of gold received will be shown at the end of automatically selling."] = "如果勾选，得到的总钱数将在自动卖出的最后显示。" -- Needs review
L["If checked, the Vendoring tab of merchant windows will be the default tab."] = "如果勾选，Vendoring的商店标签将作为默认标签" -- Needs review
L["If checked, this operation will be considered when clicking 'Buy Groups'"] = "如果勾选，这个操作将被加入“购买分组”"
L["If checked, this operation will be considered when clicking 'Sell Groups'"] = "如果勾选，这个操作将被加入“出售分组”"
L["If checked, vendoring will automatically sell any grey items in your inventory when you visit a merchant."] = "如果勾选，访问商店时vendoring将自动出售灰色物品。"
L["Ignored Item"] = "忽略物品"
L["Ignore List"] = "忽略列表"
L["Ignoring all %s permanently. You can undo this in the Vendoring options."] = "永久忽略所有%s。你可以在Vendoring选项中取消。"
L["Ignoring all %s this session (until your UI is reloaded)."] = "在这段时间忽略所有%s（直到重载界面）。"
L["Item"] = "物品"
L["Keeping %d."] = "正在保持%d." -- Needs review
L["Keep Quantity"] = "保持数量"
L["Mail"] = "信"
L["Make Vendoring Default Merchant Tab"] = "作为Vendoring默认商店标签" -- Needs review
L["Market Value"] = "市场价"
L["Max"] = "最高"
L["Max Destroy Value"] = "最高摧毁价"
L["Max Destroy Value ('0c' to disable)"] = "最高摧毁价值（“0c”到取消）" -- Needs review
L["Max Market Value"] = "最高市场价"
L["Max Market Value ('0c' to disable)"] = "最高市场价（“0c”到取消）"
L["Min Expires"] = "最短期限"
L["Number of items to sell at a time when QuickSelling"] = "当快速出售时一次出售的物品数量" -- Needs review
L["Okay"] = "好的"
L["Only sell an item after it has expired this many times"] = "在这个次数后只出售一件物品" -- Needs review
L["Potential"] = "潜在"
L["Quantity to keep in your bags"] = "保持在背包的数量" -- Needs review
L["Quick Sell"] = "快速出售"
L["Quick Sell Settings"] = "快速出售设置"
L["Removed %s from the permanent ignore list."] = "从永久忽略列表移除%s 。"
L["Repair"] = "修复" -- Needs review
L["Restocking to %d."] = "正在补充到%d." -- Needs review
L["Restock Quantity"] = "补货数量"
L["Sell after expired auctions"] = "拍卖过期后出售"
L["Sell All"] = "出售所有"
L["Selling after %d expired auctions"] = "在 %d 拍卖过期后出售"
L["Selling always"] = "永远出售"
L["Selling if "] = "出售，如果" -- Needs review
L["Selling soulbound items."] = "出售绑定物品。"
L["Sell Only:"] = "仅出售："
L["Sell Selected Groups"] = "出售选中分组"
L["Sell Settings"] = "出售设置"
L["Sell soulbound items"] = "出售绑定物品"
L["%sLeft-Click|r to ignore an item for this session. Hold %sshift|r to ignore permanently. You can remove items from permanent ignore in the Vendoring options."] = "%s左键|r  来忽略物品一段时间。按住 %sshift|r 来永久忽略。你可以在Vendoring选项中从永久忽略列表中移除物品。" -- Needs review
L["Sources to Include in Restock"] = "来源包括补货" -- Needs review
L["Specifies the default page that will show when you select the TSM_Vendoring tab."] = "当选择TSM_Vendoring标签时将显示指定默认页面。" -- Needs review
L["%s%sdestroy value is below %s"] = "%s%s分解价值是下列%s" -- Needs review
L["%s%smarket value is below %s"] = "%s%s市场价值是下列%s"
L["%s%smarket value is below %s and destroy value is below %s"] = "%s%s市场价值是下列%s和分解价值是下列%s"
L["Stack"] = "堆叠"
L["These buttons change what is shown in the merchant frame. You can view what the merchant is selling, buyback any items you have sold, automatically buy and sell items in groups, and quickly sell items."] = "这些按钮会改变商店插件的显示效果。你可以观察商店出售的物品，回购已出售物品，自动购买和出售分组中的物品，快速卖出物品。" -- Needs review
L[ [=[The 'Sell All' button will sell all items listed above. The 'Trash' button will sell grey items.  The 'BOEs' button will sell bind-on-equip items listed above.

Make sure you review the list before selling the first time.]=] ] = [=[“出售所有”按钮将出售上面列出的所有物品。“垃圾”按钮将出售所有灰色物品。“装绑”按钮将出售上面列出的所有装绑物品。

在第一次出售前请务必再三确认清单。]=]
L["This is where the items in your inventory are listed. Items that appear here have evaluated to be worth less than your thresholds determined in the options."] = "这是你库存物品的列表。已估价并超过你设置的门坎的物品会显示在这里。"
L[ [=[This is where the items the merchant has for sale are listed.

Items with a red number are things that you already know or cannot use.

Just like the default UI, you may right click to buy a single item, or shift-left click to buy multiples.]=] ] = [=[这是列出的已估价物品的位置。

红色数字的物品是已知或没有使用过的。

跟系统默认一样，可以右键购买一件物品，或shift左键购买多件物品。]=] -- Needs review
L["This is where you can buyback items from the merchant.  Right click on an item to buy it back."] = "这是你可以回购物品的位置。右键点击购回。"
L["Trash"] = "垃圾"
L["TSM Groups"] = "TSM分组"
L["Vendor"] = "商店" -- Needs review
L["Vendoring operations contain settings for easy vendoring of items."] = "Vendoring操作包括简单简单物品的出售" -- Needs review
L["Vendoring Settings"] = "Vendoring设置" -- Needs review
L["Vendoring will take into account items from these sources when calculating how much to restock"] = "Vendoring在计算补货数量时将考虑这些来源" -- Needs review
L["When buying, restock to this amount"] = "购买时，补货到这个账户" -- Needs review
