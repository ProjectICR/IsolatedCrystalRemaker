#loader crafttweaker
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

import scripts.grassUtils.RecipeUtils;

//钢锭
var ingotSteel as IIngredient = <ore:ingotSteel>;
//转换处理器
var processorTransport as IItemStack = <contenttweaker:processor_transport>;
//集成转换处理器
var integratedTransport as IItemStack = <contenttweaker:integrated_circuit_transport>;
//1k——me存储元件
var OneKStorageUnit as IItemStack = <appliedenergistics2:material:35>;
//4k——me存储元件
var fourKStorageUnit as IItemStack = <appliedenergistics2:material:36>;
//16k——me存储元件
var sixteenKStorageUnit as IItemStack= <appliedenergistics2:material:37>;
//防锈钛锭
var stainlessTitanium as IItemStack = <contenttweaker:stainlesstitanium_ingot>;
//石英玻璃
var quartzGlass as IItemStack = <appliedenergistics2:quartz_glass>;
//聚能石英玻璃
var vibrantQuartzGlass as IItemStack = <appliedenergistics2:quartz_vibrant_glass>;
//高纯福鲁伊克斯
var pureFluix as IItemStack = <appliedenergistics2:material:12>;
//镀钛陨石块
var titaniumSky as IItemStack = <contenttweaker:block_titanium_sky>;

var shapedRecipes as IIngredient[][][IItemStack] = {
    <appliedenergistics2:drive> : [
        [stainlessTitanium, <minecraft:chest>, stainlessTitanium],
        [<ore:crystalFluix>, <contenttweaker:integrated_core_usb>, <ore:crystalFluix>],
        [stainlessTitanium, <botania:storage>, stainlessTitanium]
    ],

    <appliedenergistics2:material:35> : [
        [<enderio:item_alloy_ingot:4>, <appliedenergistics2:material:10>, <enderio:item_alloy_ingot:4>],
        [<appliedenergistics2:material:10>, <appliedenergistics2:material:22>, <appliedenergistics2:material:10>],
        [<enderio:item_alloy_ingot:4>, <appliedenergistics2:material:10>, <enderio:item_alloy_ingot:4>]
    ], 

    <appliedenergistics2:material:36> : [
        [<ore:ingotInvar>, <appliedenergistics2:material:23>, <ore:ingotInvar>],
        [OneKStorageUnit, quartzGlass, OneKStorageUnit],
        [<ore:ingotInvar>, OneKStorageUnit, <ore:ingotInvar>]
    ],

    <appliedenergistics2:material:37> : [
        [<ore:ingotOsmium>, processorTransport, <ore:ingotOsmium>],
        [fourKStorageUnit, quartzGlass, fourKStorageUnit],
        [<ore:ingotOsmium>, fourKStorageUnit, <ore:ingotOsmium>]
    ], 

    <appliedenergistics2:material:38> : [
        [<ore:ingotLumium>, <appliedenergistics2:material:24>, <ore:ingotLumium>],
        [sixteenKStorageUnit, quartzGlass, sixteenKStorageUnit],
        [<ore:ingotLumium>, sixteenKStorageUnit, <ore:ingotLumium>]
    ], 

    <appliedenergistics2:controller> : [
        [titaniumSky, pureFluix, titaniumSky],
        [pureFluix, integratedTransport, pureFluix],
        [titaniumSky, pureFluix, titaniumSky]
    ], 

    <appliedenergistics2:interface> : [
        [stainlessTitanium, quartzGlass, stainlessTitanium],
        [<appliedenergistics2:part:240>, processorTransport, <appliedenergistics2:part:260>],
        [stainlessTitanium, quartzGlass, stainlessTitanium]
    ], 

    <appliedenergistics2:condenser> : [
        [stainlessTitanium, pureFluix, stainlessTitanium],
        [pureFluix, <storagedrawers:compdrawers>, pureFluix],
        [stainlessTitanium, pureFluix, stainlessTitanium]
    ], 

    <appliedenergistics2:energy_acceptor> : [
        [stainlessTitanium, quartzGlass, stainlessTitanium],
        [quartzGlass, <appliedenergistics2:material:7>, quartzGlass],
        [stainlessTitanium, quartzGlass, stainlessTitanium]
    ], 

    <appliedenergistics2:quartz_growth_accelerator> : [
        [<projecte:item.pe_harvest_god>, <appliedenergistics2:fluix_block>, <projecte:item.pe_harvest_god>],
        [vibrantQuartzGlass, <contenttweaker:titanium_gear>, vibrantQuartzGlass],
        [<projecte:item.pe_harvest_god>, <appliedenergistics2:fluix_block>, <projecte:item.pe_harvest_god>]  
    ], 

    <appliedenergistics2:crafting_unit> : [
        [stainlessTitanium, <contenttweaker:integrated_circuit_calculate>, stainlessTitanium],
        [<contenttweaker:integrated_circuit_logic>, <contenttweaker:integrated_circuit_engineer>, <contenttweaker:integrated_circuit_logic>],
        [stainlessTitanium, <contenttweaker:integrated_circuit_calculate>, stainlessTitanium]
    ],

    <appliedenergistics2:crafting_accelerator> : [
        [<ore:ingotLumium>, <contenttweaker:integrated_circuit_engineer>, <ore:ingotLumium>],
        [integratedTransport, <appliedenergistics2:crafting_unit>, integratedTransport],
        [<ore:ingotLumium>, <contenttweaker:integrated_circuit_engineer>, <ore:ingotLumium>]
    ],

    <appliedenergistics2:molecular_assembler> : [
        [<ore:ingotInvar>, quartzGlass, <ore:ingotInvar>],
        [<appliedenergistics2:material:44>, <contenttweaker:titanium_gear>, <appliedenergistics2:material:43>],
        [<ore:ingotInvar>, quartzGlass, <ore:ingotInvar>]
    ],

    <appliedenergistics2:inscriber> : [
        [<ore:ingotSteel>, <minecraft:sticky_piston>, <ore:ingotSteel>],
        [<appliedenergistics2:fluix_block>, <thermalfoundation:storage_alloy:2>, <ore:ingotSteel>],
        [<ore:ingotSteel>, <minecraft:piston>, <ore:ingotSteel>]
    ],

    <appliedenergistics2:charger> : [
        [<ore:ingotSteel>, <thermalfoundation:material:514>, <ore:ingotSteel>],
        [<ore:ingotSteel>, <appliedenergistics2:fluix_block>, vibrantQuartzGlass],
        [<ore:ingotSteel>, <thermalfoundation:material:513>, <ore:ingotSteel>]
    ],

    <appliedenergistics2:quantum_ring> : [
        [stainlessTitanium, <contenttweaker:integrated_circuit_logic>, stainlessTitanium],
        [integratedTransport, <appliedenergistics2:energy_cell>, <appliedenergistics2:part:76>],
        [stainlessTitanium, <appliedenergistics2:material:24>, stainlessTitanium]
    ],

    <appliedenergistics2:material:28> * 2 : [
        [<appliedenergistics2:material:24>, stainlessTitanium, null],
        [<ore:dustRedstone>, <contenttweaker:integrated_circuit_calculate>, <extrautils2:ingredients:9>],
        [<appliedenergistics2:material:24>, stainlessTitanium, null]
    ],

    <appliedenergistics2:material:25> * 2 : [
        [<appliedenergistics2:material:22>, stainlessTitanium, null],
        [<ore:dustRedstone>, <appliedenergistics2:material:23>, <extrautils2:ingredients:9>],
        [<appliedenergistics2:material:22>, stainlessTitanium, null]
    ],

    <appliedenergistics2:part:300> : [
        [stainlessTitanium, <appliedenergistics2:material:7>, null],
        [<appliedenergistics2:material:44>, <appliedenergistics2:material:7>, <extrautils2:ingredients:8>],
        [stainlessTitanium, <appliedenergistics2:material:7>, null]
    ],

    <appliedenergistics2:part:320> : [
        [stainlessTitanium, <appliedenergistics2:material:7>, null],
        [<appliedenergistics2:material:43>, <appliedenergistics2:material:7>, <extrautils2:ingredients:8>],
        [stainlessTitanium, <appliedenergistics2:material:7>, null]
    ],

    <appliedenergistics2:part:260> : [
        [stainlessTitanium, <appliedenergistics2:material:43>, stainlessTitanium],
        [stainlessTitanium, <minecraft:piston>, stainlessTitanium],
        [null, <extrautils2:redstoneclock>, null]
    ],

    <appliedenergistics2:part:240> : [
        [stainlessTitanium, <appliedenergistics2:material:44>, stainlessTitanium],
        [stainlessTitanium, <minecraft:sticky_piston>, stainlessTitanium],
        [null, <extrautils2:redstoneclock>, null]
    ],

    <appliedenergistics2:part:460> : [
        [<appliedenergistics2:part:56>, stainlessTitanium, <appliedenergistics2:part:56>],
        [stainlessTitanium, <contenttweaker:integrated_circuit_engineer>, stainlessTitanium],
        [<appliedenergistics2:material:12>, <appliedenergistics2:material:12>, <appliedenergistics2:material:12>]
    ],

    <appliedenergistics2:part:180> : [
        [null, <minecraft:quartz>, <contenttweaker:glass>],
        [stainlessTitanium, <contenttweaker:beryllium_dust>, <contenttweaker:glass>],
        [null, <minecraft:quartz>, <contenttweaker:glass>]
    ]
};

for output, inputBox in shapedRecipes {
    RecipeUtils.recipeTweak(true, output, inputBox);
}
