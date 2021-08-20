#priority 5
#loader crafttweaker
import crafttweaker.data.IData;
import crafttweaker.damage.IDamageSource;


recipes.addShaped("recipe_shares_time", <minecraft:shears>, [
    [null, <ore:plankWood>],
    [<ore:plankWood>, null]
], function(out, ins, cInfo) {
    var data as IData = cInfo.player.data.PlayerPersisted;

    return cInfo.player.health > 19.5 && (isNull(data) || (isNull(data.shares_time) || !isNull(data.shares_time) && data.shares_time.asInt() <= 3)) ? out : null;
}, function(out, cInfo, player) {
    var data as IData = player.data.PlayerPersisted;

    if(!player.world.remote) {
        player.attackEntityFrom(IDamageSource.createPlayerDamage(player), 19.5);

        if(isNull(data.shares_time)) {
            player.update({PlayerPersisted : {shares_time : 1}});
        } else {
            player.update({PlayerPersisted : {shares_time : data.shares_time.asInt() + 1}});
        }
    }
});