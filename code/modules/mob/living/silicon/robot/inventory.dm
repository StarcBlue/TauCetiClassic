//These procs handle putting s tuff in your hand. It's probably best to use these rather than setting stuff manually
//as they handle all relevant stuff like adding it to the player's screen and such

//Returns the thing in our active hand (whatever is in our active module-slot, in this case)
/mob/living/silicon/robot/get_active_hand()
	if(module_active)
		var/obj/item/W = SEND_SIGNAL(module_active, COMSIG_HAND_GET_ITEM)
		if(W)
			return W
	return module_active

// I'd rather do this then have something broken.
/mob/living/silicon/robot/get_inactive_hand()
	return module_active

/mob/living/silicon/robot/put_in_active_hand(obj/item/W)
	if(lying && !(W.flags & ABSTRACT))
		return FALSE
	if(!istype(W))
		return FALSE
	if(W.anchored)
		return FALSE
	if(module_active)
		return SEND_SIGNAL(module_active, COMSIG_HAND_PUT_IN, W, src)
	return FALSE

/mob/living/silicon/robot/put_in_inactive_hand(obj/item/W)
	return put_in_active_hand(W)

/mob/living/silicon/robot/put_in_hands(obj/item/W)
	if(!W)
		return FALSE
	if(put_in_active_hand(W))
		return TRUE
	else
		W.forceMove(get_turf(src))
		return FALSE

/mob/living/silicon/robot/drop_item(atom/T)
	if(module_active)
		return SEND_SIGNAL(module_active, COMSIG_HAND_DROP_ITEM, T, src)
	return FALSE

/mob/living/silicon/robot/remove_from_mob(obj/O, atom/T)
	if(!O)
		return FALSE
	if(!module_active || SEND_SIGNAL(module_active, COMSIG_HAND_GET_ITEM) != O)
		return FALSE

	return SEND_SIGNAL(module_active, COMSIG_HAND_DROP_ITEM, T, src)

/mob/living/silicon/robot/u_equip(obj/W)
	if(!W || (W != module_active))
		return 0
	uneq_active()
	return 1

/mob/living/silicon/robot/proc/unequip_module(obj/O)
	. = FALSE
	if(!O)
		return
	if(module_state_1 == O)
		if(istype(module_state_1,/obj/item/borg/sight))
			sight_mode &= ~module_state_1:sight_mode
		if (client)
			client.screen -= module_state_1
		contents -= module_state_1
		module_active = null
		module_state_1:loc = module //So it can be used again later
		module_state_1 = null
		inv1.icon_state = "inv1"
		. = TRUE
	else if(module_state_2 == O)
		if(istype(module_state_2,/obj/item/borg/sight))
			sight_mode &= ~module_state_2:sight_mode
		if (client)
			client.screen -= module_state_2
		contents -= module_state_2
		module_active = null
		module_state_2:loc = module
		module_state_2 = null
		inv2.icon_state = "inv2"
		. = TRUE
	else if(module_state_3 == O)
		if(istype(module_state_3,/obj/item/borg/sight))
			sight_mode &= ~module_state_3:sight_mode
		if (client)
			client.screen -= module_state_3
		contents -= module_state_3
		module_active = null
		module_state_3:loc = module
		module_state_3 = null
		inv3.icon_state = "inv3"
		. = TRUE
	if(.)
		hud_used.update_robot_modules_display()
		updateicon()

/mob/living/silicon/robot/proc/uneq_active()
	if(isnull(module_active))
		return
	unequip_module(module_active)

/mob/living/silicon/robot/proc/uneq_all()
	module_active = null

	if(module_state_1)
		if(istype(module_state_1,/obj/item/borg/sight))
			sight_mode &= ~module_state_1:sight_mode
		if (client)
			client.screen -= module_state_1
		contents -= module_state_1
		module_state_1:loc = module
		module_state_1 = null
		inv1.icon_state = "inv1"
	if(module_state_2)
		if(istype(module_state_2,/obj/item/borg/sight))
			sight_mode &= ~module_state_2:sight_mode
		if (client)
			client.screen -= module_state_2
		contents -= module_state_2
		module_state_2:loc = module
		module_state_2 = null
		inv2.icon_state = "inv2"
	if(module_state_3)
		if(istype(module_state_3,/obj/item/borg/sight))
			sight_mode &= ~module_state_3:sight_mode
		if (client)
			client.screen -= module_state_3
		contents -= module_state_3
		module_state_3:loc = module
		module_state_3 = null
		inv3.icon_state = "inv3"
	updateicon()

/mob/living/silicon/robot/proc/activated(obj/item/O)
	if(module_state_1 == O)
		return 1
	else if(module_state_2 == O)
		return 1
	else if(module_state_3 == O)
		return 1
	else
		return 0

//Helper procs for cyborg modules on the UI.
//These are hackish but they help clean up code elsewhere.

//module_selected(module) - Checks whether the module slot specified by "module" is currently selected.
/mob/living/silicon/robot/proc/module_selected(module) //Module is 1-3
	return module == get_selected_module()

//module_active(module) - Checks whether there is a module active in the slot specified by "module".
/mob/living/silicon/robot/proc/module_active(module) //Module is 1-3
	if(module < 1 || module > 3) return 0

	switch(module)
		if(1)
			if(module_state_1)
				return 1
		if(2)
			if(module_state_2)
				return 1
		if(3)
			if(module_state_3)
				return 1
	return 0

//get_selected_module() - Returns the slot number of the currently selected module.  Returns 0 if no modules are selected.
/mob/living/silicon/robot/proc/get_selected_module()
	if(module_state_1 && module_active == module_state_1)
		return 1
	else if(module_state_2 && module_active == module_state_2)
		return 2
	else if(module_state_3 && module_active == module_state_3)
		return 3

	return 0

//select_module(module) - Selects the module slot specified by "module"
/mob/living/silicon/robot/proc/select_module(module) //Module is 1-3
	if(module < 1 || module > 3) return

	if(!module_active(module)) return

	switch(module)
		if(1)
			if(module_active != module_state_1)
				inv1.icon_state = "inv1 +a"
				inv2.icon_state = "inv2"
				inv3.icon_state = "inv3"
				module_active = module_state_1
				return
		if(2)
			if(module_active != module_state_2)
				inv1.icon_state = "inv1"
				inv2.icon_state = "inv2 +a"
				inv3.icon_state = "inv3"
				module_active = module_state_2
				return
		if(3)
			if(module_active != module_state_3)
				inv1.icon_state = "inv1"
				inv2.icon_state = "inv2"
				inv3.icon_state = "inv3 +a"
				module_active = module_state_3
				return
	return

//deselect_module(module) - Deselects the module slot specified by "module"
/mob/living/silicon/robot/proc/deselect_module(module) //Module is 1-3
	if(module < 1 || module > 3) return

	switch(module)
		if(1)
			if(module_active == module_state_1)
				inv1.icon_state = "inv1"
				module_active = null
				return
		if(2)
			if(module_active == module_state_2)
				inv2.icon_state = "inv2"
				module_active = null
				return
		if(3)
			if(module_active == module_state_3)
				inv3.icon_state = "inv3"
				module_active = null
				return
	return

//toggle_module(module) - Toggles the selection of the module slot specified by "module".
/mob/living/silicon/robot/proc/toggle_module(module) //Module is 1-3
	if(module < 1 || module > 3) return

	if(module_selected(module))
		deselect_module(module)
	else
		if(module_active(module))
			select_module(module)
		else
			deselect_module(get_selected_module()) //If we can't do select anything, at least deselect the current module.
	return

//cycle_modules() - Cycles through the list of selected modules.
/mob/living/silicon/robot/proc/cycle_modules()
	var/slot_start = get_selected_module()
	if(slot_start) deselect_module(slot_start) //Only deselect if we have a selected slot.

	var/slot_num
	if(slot_start == 0)
		slot_num = 1
		slot_start = 2
	else
		slot_num = slot_start + 1

	while(slot_start != slot_num) //If we wrap around without finding any free slots, just give up.
		if(module_active(slot_num))
			select_module(slot_num)
			return
		slot_num++
		if(slot_num > 3) slot_num = 1 //Wrap around.

	return

/mob/living/silicon/robot/proc/activate_module(obj/item/O)
	if(!(locate(O) in src.module.modules) && O != src.module.emag)
		return
	if(activated(O))
		to_chat(src, "<span class='notice'>Already activated</span>")
		return
	if(!module_state_1)
		module_state_1 = O
		O.layer = ABOVE_HUD_LAYER
		O.plane = ABOVE_HUD_PLANE
		O.screen_loc = inv1.screen_loc
		contents += O
		if(istype(module_state_1,/obj/item/borg/sight))
			sight_mode |= module_state_1:sight_mode
	else if(!module_state_2)
		module_state_2 = O
		O.layer = ABOVE_HUD_LAYER
		O.plane = ABOVE_HUD_PLANE
		O.screen_loc = inv2.screen_loc
		contents += O
		if(istype(module_state_2,/obj/item/borg/sight))
			sight_mode |= module_state_2:sight_mode
	else if(!module_state_3)
		module_state_3 = O
		O.layer = ABOVE_HUD_LAYER
		O.plane = ABOVE_HUD_PLANE
		O.screen_loc = inv3.screen_loc
		contents += O
		if(istype(module_state_3,/obj/item/borg/sight))
			sight_mode |= module_state_3:sight_mode
	else
		to_chat(src, "<span class='notice'>You need to disable a module first!</span>")
