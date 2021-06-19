#priority 20
#loader crafttweaker
import crafttweaker.data.IData;

import scripts.grassUtils.GrassUtils;


<contenttweaker:intermediate_product>.addAdvancedTooltip(function(item) {
    var tag as IData = item.tag;

    if(!isNull(tag.type)) {
        var isQuenching as IData = tag.quenching;
        var isTempering as IData = tag.tempering;

        var tempering as string = GrassUtils.i18n("icr.tooltip.info.only_tempering");
        var quenching as string = GrassUtils.i18nValued("icr.tooltip.info.state", [GrassUtils.i18n("icr.tooltip.info.only_quenching")]);


        if(!isNull(isQuenching) && isNull(isTempering) && isQuenching.asBool()) {
            return quenching;
        }

        if(!isNull(isTempering) && isNull(isQuenching) && isTempering.asBool()) {
            return GrassUtils.i18nValued("icr.tooltip.info.state", [tempering]);
        }

        if(!isNull(isQuenching) && !isNull(isTempering)) {
            return quenching + " " + tempering;
        }
    }

    return GrassUtils.i18nValued("icr.tooltip.info.state", [GrassUtils.i18n("icr.tooltip.info.nothing")]);
});