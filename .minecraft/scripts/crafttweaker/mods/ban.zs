#priority 10
#loader crafttweaker
import crafttweaker.item.IItemStack;


var onlyBanList as IItemStack[] = [
    //appliedenergistics2 Mod
    <appliedenergistics2:material:39>,
    <appliedenergistics2:material:15>,
    <appliedenergistics2:material:13>,
    <appliedenergistics2:material:14>,
    <appliedenergistics2:material:19>,

    //storagedrawers Mod
    <storagedrawers:basicdrawers>,
    <storagedrawers:basicdrawers:2>,
    <storagedrawers:basicdrawers:1>,
    <storagedrawers:basicdrawers:3>,
    <storagedrawers:basicdrawers:4>,
    <storagedrawers:customdrawers>,
    <storagedrawers:customdrawers:1>,
    <storagedrawers:customdrawers:2>,
    <storagedrawers:customdrawers:3>,
    <storagedrawers:customdrawers:4>,
    <storagedrawers:framingtable>
];

for onlyBanItem in onlyBanList {
    recipes.remove(onlyBanItem);
}

furnace.remove(<astralsorcery:itemcraftingcomponent:1>);
