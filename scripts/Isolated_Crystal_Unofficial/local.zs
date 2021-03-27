#loader contenttweaker
import scripts.Isolated_Crystal_Unofficial.Isolated_Crystal_Unofficial_Item.createIngotNames;
import scripts.Isolated_Crystal_Unofficial.Isolated_Crystal_Unofficial_Item.createItemNames;
import scripts.Isolated_Crystal_Unofficial.Isolated_Crystal_Unofficial_Block.createBlocks;

function local(unlocalName as string, localName as string) {
    game.setLocalization("zh_cn", unlocalName, localName);
}

local("tile.contenttweaker.glass.name", "光学玻璃");
local("tile.contenttweaker.quartz_sand.name", "石英砂");
local("item.contenttweaker.small_dust_cesium.name", "小搓铯粉");
local("item.contenttweaker.small_dust_indium.name", "小搓铟粉");
local("item.contenttweaker.tiny_dust_cesium.name", "铯粉尘");
local("item.contenttweaker.tiny_dust_indium.name", "铟粉尘");
local("gas.titanium_tetrachloride_gas", "三氯化钛");
local("gas.silicon_tetrachloride_gas", "三氯化硅");
local("fluid.titanium_tetrachloride_gas", "液态三氯化钛");
local("fluid.silicon_tetrachloride_gas", "液态三氯化硅");

for ingotName, localName in createIngotNames {
    var dustName as string = ingotName.replace("ingot", "dust");
    var nuggetName as string = ingotName.replace("ingot", "nugget");
    local("item.contenttweaker." + ingotName + ".name", localName);
    local("item.contenttweaker." + dustName + ".name", localName.replace("锭", "粉"));
    local("item.contenttweaker." + nuggetName + ".name", localName.replace("锭", "粒"));
}

for itemName, localName in createItemNames {
    local("item.contenttweaker." + itemName + ".name", localName);
}

for blockName, localName in createBlocks {
    local("tile.contenttweaker." + blockName + ".name", localName);
}