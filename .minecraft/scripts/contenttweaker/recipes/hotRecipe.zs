#loader crafttweaker
import crafttweaker.oredict.IOreDictEntry;

import mods.tconstruct.Casting;

import scripts.grassUtils.StringHelper.getItemNameWithUnderline;


static materials as string[] = [
    "Steel",
    "Castediron",
    "Wroughtiron"
];


for material in materials {
    var plate as IOreDictEntry = oreDict.get("plate" ~ material);
    var ingot as IOreDictEntry = oreDict.get("ingot" ~ material);
    var rotor as IOreDictEntry = oreDict.get("rotor" ~ material);

    recipes.addShaped(getItemNameWithUnderline(rotor.firstItem), rotor.firstItem, [
        [null, plate, null],
        [plate, ingot, plate],
        [null, plate, null]
    ]);
}


Casting.addBasinRecipe(<contenttweaker:steel_hot_ingot>, <tconstruct:cast_custom>, <liquid:hot_steel>, 144, false, 200);
Casting.addBasinRecipe(<contenttweaker:steel_hot_plate>, <tconstruct:cast_custom:3>, <liquid:hot_steel>, 144, false, 200);