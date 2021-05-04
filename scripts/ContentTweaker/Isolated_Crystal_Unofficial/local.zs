#loader contenttweaker
import scripts.ContentTweaker.Isolated_Crystal_Unofficial.ICU_Material.materialList;
import scripts.ContentTweaker.Isolated_Crystal_Unofficial.ICU_Item.registerItemNames;
import scripts.ContentTweaker.Isolated_Crystal_Unofficial.ICU_Block.registerBlocks;

function local(unlocalName as string, localName as string) {
    game.setLocalization("zh_cn", unlocalName, localName);
}

local("tile.contenttweaker.glass.name", "光学玻璃");
local("tile.contenttweaker.quartz_sand.name", "石英砂");
local("tile.contenttweaker.becoming_starlight_block.name", "云墨方块");
local("gas.titanium_tetrachloride_gas", "三氯化钛");
local("gas.silicon_tetrachloride_gas", "三氯化硅");
local("fluid.titanium_tetrachloride_gas", "液态三氯化钛");
local("fluid.silicon_tetrachloride_gas", "液态三氯化硅");
local("contenttweaker.part.tiny_dust_icu", "%s粉尘");

for materialName in materialList.values {
    local("base.material." + materialName[0].toLowerCase(), materialName[1]);
}

for itemName, localName in registerItemNames {
    local("item.contenttweaker." + itemName + ".name", localName);
}

for blockName, localName in registerBlocks {
    local("tile.contenttweaker." + blockName + ".name", localName);
}