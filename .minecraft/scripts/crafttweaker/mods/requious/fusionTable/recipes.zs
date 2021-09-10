#priority 5
#loader crafttweaker
import crafttweaker.world.IWorld;
import crafttweaker.entity.IEntity;
import crafttweaker.item.IItemStack;
import crafttweaker.world.IBlockPos;

import mods.requious.SlotVisual;
import mods.requious.AssemblyRecipe;
import mods.icrutils.support.CCTileInGame;

import scripts.crafttweaker.util.RequiousUtils;
import scripts.crafttweaker.mods.requious.fusionTable.fusionTable.ft;
import scripts.crafttweaker.util.fusionTableRecipe.FusionTableRecipe;
import scripts.crafttweaker.util.fusionTableRecipe.newFusionTableRecipe;

var FTRecipe as FusionTableRecipe[] = [
    newFusionTableRecipe(<entity:minecraft:sheep>, [RequiousUtils.getCrystal("victus"), RequiousUtils.getCrystal("victus"), <minecraft:mutton>, <minecraft:mutton>], 100)
];

for recipe in FTRecipe {
    var inputs as IItemStack[] = recipe.getInputs();
    var machineRecipe as AssemblyRecipe = AssemblyRecipe.create(function(container) {
        container.addWorldOutput(function(machine) {
            var world as IWorld = machine.world;
            var pos as IBlockPos = machine.pos;

            if(!world.remote && setEmptyToTile(world, pos)) {
                var entity as IEntity = recipe.getOutput().createEntity(world);
                entity.setNBT({fusion : true as bool});
                entity.setPosition(pos.up());
                world.spawnEntity(entity);
                return true;
            }
            return false;
        });
    }).requireWorldCondition("multi", function(machine) {
        var world as IWorld = machine.world;
        var pos as IBlockPos = machine.pos;
        var tiles as CCTileInGame[] = getCCTile(world, pos);

        if(!world.remote && !isNull(tiles)) {
            if(recipe.matches([tiles[0].stack, tiles[1].stack, tiles[2].stack, tiles[3].stack])) {
                return true;
            }
        }
        return false;
    }, 1)
    .requireDuration("time", recipe.getTime());

    var jeiRecipe as AssemblyRecipe = AssemblyRecipe.create(function(container) {
        container.addJEIInfo("output", recipe.getLangkey(), SlotVisual.infoSlot());
    })
    .requireItem("inputL", inputs[0])
    .requireItem("inputR", inputs[1])
    .requireItem("inputU", inputs[2])
    .requireItem("inputD", inputs[3]);

    ft.addRecipe(machineRecipe);
    ft.addJEIRecipe(jeiRecipe);
}

function getCCTile(world as IWorld, pos as IBlockPos) as CCTileInGame[] {
    var tiles as CCTileInGame[] = [];

    for blockPos in getAroundPos(pos) {
        if(!world.remote && isNull(world.getCCTileInGame(blockPos))) {
            return null;
        }
        tiles += world.getCCTileInGame(blockPos);
    }

    return tiles;
}

function setEmptyToTile(world as IWorld, pos as IBlockPos) as bool {
    for blockPos in getAroundPos((pos)) {
        var tile as CCTileInGame = world.getCCTileInGame(blockPos);

        if(isNull(tile)) {
            return false;
        } else {
            tile.setStackInInv(null);
        }
    }
    return true;
}

function getAroundPos(pos as IBlockPos) as IBlockPos[] {
    return [pos.north(3), pos.south(3), pos.west(3), pos.east(3)] as IBlockPos[];
}