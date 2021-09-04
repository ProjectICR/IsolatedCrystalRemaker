#priority 10
#loader crafttweaker
import mods.requious.Assembly;
import mods.requious.SlotVisual;
import mods.requious.ComponentFace;


var itemSlotVisual as SlotVisual = SlotVisual.itemSlot();
var allFace as ComponentFace = ComponentFace.all();
static ef as Assembly = <assembly:essences_fusion>;

ef.setItemSlot(2, 2, allFace, 64)
    .setAccess(true, false)
    .setGroup("inputL");

ef.setItemSlot(6, 2, allFace, 64)
    .setAccess(true, false)
    .setGroup("inputR");

ef.setItemSlot(4, 2, allFace, 64)
    .setAccess(false, true)
    .setHandAccess(false, true)
    .pushItem(1)
    .setGroup("output");

ef.setDurationSlot(3, 2)
    .setVisual(SlotVisual.arrowRight())
    .setGroup("timeL");

ef.setDurationSlot(5, 2)
    .setVisual(SlotVisual.arrowLeft())
    .setGroup("timeR");

ef.setJEIItemSlot(2, 2, "inputL", itemSlotVisual);

ef.setJEIItemSlot(6, 2, "inputR", itemSlotVisual);

ef.setJEIItemSlot(4, 2, "output", itemSlotVisual);

ef.setJEIDurationSlot(3, 2, "timeL", SlotVisual.arrowRight());

ef.setJEIDurationSlot(5, 2, "timeR", SlotVisual.arrowLeft());