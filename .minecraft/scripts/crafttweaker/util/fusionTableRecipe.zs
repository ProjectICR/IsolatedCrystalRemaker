#priority 50
#loader crafttweaker
import crafttweaker.item.IItemStack;
import crafttweaker.entity.IEntityDefinition;

import scripts.grassUtils.Logger;


zenClass FusionTableRecipe {
    val output as IEntityDefinition;
    val inputs as IItemStack[];
    val langkey as string;
    val nullAmount as int;
    val time as int;

    zenConstructor(output as IEntityDefinition, inputs as IItemStack[], time as int) {
        if(isNull(inputs) || isNull(output) || inputs.length != 4 || getNullAmount(inputs) == 4) {
            Logger.sendError("Create FusionTable Recipe Error");
        } else {
            this.time = time;
            this.output = output;
            this.inputs = inputs;
            this.nullAmount = getNullAmount(inputs);
            this.langkey = "icr.recipe.info." ~ output.name.toLowerCase();
        }
    }

    function matches(inputs as IItemStack[]) as bool {
        var stacks as IItemStack[] = [];
        if(this.nullAmount == getNullAmount(inputs)) {
            var unused as bool[] = [true, true, true, true];

            for i, input in this.inputs {
                if(isNull(input)) {
                    unused[i] = false;
                }
            }

            for input in inputs {
                if(unused[0] && this.inputs[0].matches(input)) {
                    unused[0] = false;
                    stacks += this.inputs[0];
                } else if(unused[1] && this.inputs[1].matches(input)) {
                    unused[1] = false;
                    stacks += this.inputs[1];
                } else if(unused[2] && this.inputs[2].matches(input)) {
                    unused[2] = false;
                    stacks += this.inputs[2];
                } else if(unused[3] && this.inputs[3].matches(input)) {
                    unused[3] = false;
                    stacks += this.inputs[3];
                }
            }
        }
        return stacks.length == (this.inputs.length - this.nullAmount);
    }

    function getOutput() as IEntityDefinition {
        return this.output;
    }

    function getInputs() as IItemStack[] {
        return this.inputs;
    }

    function getTime() as int {
        return this.time;
    }

    function getLangkey() as string {
        return this.langkey;
    }

    function getNullAmount(inputs as IItemStack[]) as int {
        var i as int = 0;

        for input in inputs {
            if(isNull(input)) {
                i += 1;
            }
        }
        return i;
    }

}

function newFusionTableRecipe(output as IEntityDefinition, inputs as IItemStack[], time as int) as FusionTableRecipe {
    return FusionTableRecipe(output, inputs, time);
}
