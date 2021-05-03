#priority 100
#loader crafttweaker
import crafttweaker.world.IWorld;
import crafttweaker.player.IPlayer;
import crafttweaker.util.Position3f;
import crafttweaker.world.IBlockPos;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.entity.IEntityItem;

import mods.ctutils.utils.Math;

function getItemRecipeNameWithUnderline(item as IItemStack) as string {
    if(isNull(item)) return "Invalid";
    var id as string = item.definition.id.split(":")[1];
    var meta as int = item.metadata;
    return (meta == 0) ? id : (id + "_" + meta);
}

function addShapedRecipe(recipeBox as IIngredient[][][IItemStack]) {
    for out, inputBox in recipeBox {
        recipes.addShaped(getItemRecipeNameWithUnderline(out), out, inputBox);
    }
}

function addShapelessRecipe(recipeBox as IIngredient[][IItemStack]) {
    for out, inputBox in recipeBox {
        recipes.addShapeless(getItemRecipeNameWithUnderline(out), out, inputBox);
    }
}

function getSpecialBlockPos(x as double, y as double, z as double) as IBlockPos {
    return Position3f.create(Math.floor(x), Math.floor(y), Math.floor(z)).asBlockPos();
}

function spawnItemInWorld(world as IWorld, pos as IBlockPos, item as IItemStack) {
    world.spawnEntity(item.createEntityItem(world, pos));
}