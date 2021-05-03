#loader crafttweaker
import crafttweaker.item.IItemStack;

var banList as IItemStack[] = [
    //botania Mod
    <botania:runealtar>,
    <botania:manaresource:12>,
    <botania:corporeaindex>,
    <botania:alchemycatalyst>,
    <botania:rfgenerator>,
    <botania:corporeaspark>,

    //enderio Mod
    <enderio:item_basic_capacitor:*>,
    <enderio:block_slice_and_splice>,
    <enderio:block_painter>,

    //draconicevolution Mod
    <draconicevolution:draconic_core>,
    <draconicevolution:wyvern_energy_core>,
    <draconicevolution:wyvern_core>,
    <draconicevolution:awakened_core>,
    <draconicevolution:chaotic_core>,

    //appliedenergistics2 Mod
    <appliedenergistics2:material:39>,
    <appliedenergistics2:material:35>,
    <appliedenergistics2:material:36>,
    <appliedenergistics2:material:37>,
    <appliedenergistics2:material:38>,
    <appliedenergistics2:drive>,
    <appliedenergistics2:material:15>,
    <appliedenergistics2:material:13>,
    <appliedenergistics2:material:14>,
    <appliedenergistics2:material:19>,
    <appliedenergistics2:controller>,
    <appliedenergistics2:interface>,
    <appliedenergistics2:condenser>,
    <appliedenergistics2:energy_acceptor>,
    <appliedenergistics2:quartz_growth_accelerator>,
    <appliedenergistics2:crafting_unit>,
    <appliedenergistics2:crafting_accelerator>,
    <appliedenergistics2:molecular_assembler>,
    <appliedenergistics2:inscriber>,
    <appliedenergistics2:charger>,
    <appliedenergistics2:quantum_ring>,
    <appliedenergistics2:material:28>,
    <appliedenergistics2:material:25>,
    <appliedenergistics2:part:300>,
    <appliedenergistics2:part:260>,
    <appliedenergistics2:part:320>,
    <appliedenergistics2:part:460>,
    <appliedenergistics2:part:240>,
    <appliedenergistics2:part:180>,

    //compactmachines Mod
    <compactmachines3:fieldprojector>,
    <compactmachines3:psd>,

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

for banItem in banList {
    recipes.remove(banItem);
}

furnace.remove(<astralsorcery:itemcraftingcomponent:1>);