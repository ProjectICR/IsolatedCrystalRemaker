#priority 100
#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;

function createItem(name as string) {
    var item as Item = VanillaFactory.createItem(name);
    item.creativeTab = <creativetab:materials.base>;
    item.register();
}

static createIngotNames as string[string] = {
    "ingot_titanium" : "钛锭",
    "ingot_beryllium" : "铍锭",
    "ingot_germanium" : "锗锭",
    "ingot_cesium" : "铯锭",
    "ingot_indium" : "铟锭",
    "ingot_lightgold" : "亮金锭",
    "ingot_beryllium_aluminum_alloy" : "铍铝合金锭",
    "ingot_zirconium" : "锆锭",
    "ingot_solder_tin" : "焊锡锭",
    "ingot_adamantium" : "艾德曼合金锭",
};

static createItemNames as string[string] = {
    "gem_rutile" : "金红石",
    "ingot_dirt" : "泥砖",
    "ingot_china" : "陶瓷锭",
    "ingot_redstonedragon" : "红石浸渍龙锭",
    "ingot_stainless_titanium" : "防锈钛锭",
    "gear_titanium" : "钛齿轮",
    "rod_titanium" : "钛棒",
    "plate_titanium" : "钛板",
    "plate_zirconium" : "锆板",
    "denseplate_zirconium" : "致密锆板",
    "armorplate_zirconium" : "锆护甲板",
    "dust_china" : "碎瓷",
    "dust_rutile" : "金红石粉",
    "dust_stone_zirconium" : "锆石粉",
    "item_china" : "瓷土",
    "item_puresi" : "高纯硅",
    "item_crystalsi" : "单晶硅",
    "item_calculator" : "物品化运算元件",
    "integrated_circuit_logic" : "集成逻辑电路板",
    "integrated_circuit_engineer" : "集成工程电路板",
    "integrated_circuit_calculate" : "集成运算电路板",
    "integrated_circuit_transport" : "集成转换电路板",
    "integrated_circuit_empty" : "集成空电路板",
    "qed" : "QED符文",
    "tubebase" : "导管内衬物",
    "na_light" : "激光生成组件",
    "core_usb" : "USB核心",
    "core_time" : "时间核心",
    "blackhole" : "黑洞",
    "power_coil_gold" : "强化接受线圈",
    "stone_zirconium" : "锆石",
    "ultimate_essence" : "极限精华",
    "templet_transport" : "转换电路板",
    "power_coil_silver" : "强化传输线圈",
    "integrated_core_usb" : "集成USB核心",
    "processor_transport" : "转换处理器",
    "power_coil_electrum" : "强化传导线圈",
    "ircuit_board_transport" : "转换电路板",
    "glass_one_level" : "光学选矿透镜 LV.1",
    "glass_two_level" : "光学选矿透镜 LV.2",
    "glass_four_level" : "光学选矿透镜 LV.4",
    "glass_five_level" : "光学选矿透镜 LV.5",
    "glass_three_level" : "光学选矿透镜 LV.3",
    "glass_gradual_system" : "光学选矿系统"
};

for item in createItemNames {
    createItem(item);
}

for ingotName in createIngotNames {
    var dustName as string = ingotName.replace("ingot", "dust");
    var nuggetName as string = ingotName.replace("ingot", "nugget");
    if(ingotName in "cesium" || ingotName in "indium") {
        var smallDustName as string = ingotName.replace("ingot", "small_dust");
        var tinyDustName as string = ingotName.replace("ingot", "tiny_dust");
        createItem(smallDustName);
        createItem(tinyDustName);
    }
    createItem(ingotName);
    if(ingotName in "gold" || ingotName in  "beryllium_aluminum_alloy") continue;
    createItem(dustName);
    if(ingotName in "adamantium") continue;
    createItem(nuggetName);
}