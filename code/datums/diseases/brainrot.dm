/datum/disease/brainrot
	name = "Brainrot"
	max_stages = 4
	spread = "On contact"
	spread_type = CONTACT_GENERAL
	cure = "Alkysine"
	cure_id = list("alkysine")
	agent = "Cryptococcus Cosmosis"
	affected_species = list(HUMAN)
	curable = 0
	cure_chance = 15//higher chance to cure, since two reagents are required
	desc = "This disease destroys the braincells, causing brain fever, brain necrosis and general intoxication."
	severity = "Major"

/datum/disease/brainrot/stage_act() //Removed toxloss because damaging diseases are pretty horrible. Last round it killed the entire station because the cure didn't work -- Urist
	..()
	switch(stage)
		if(2)
			if(prob(2))
				affected_mob.emote("blink")
			if(prob(2))
				affected_mob.emote("yawn")
			if(prob(2))
				to_chat(affected_mob, "<span class='warning'>Your don't feel like yourself.</span>")
			if(prob(5))
				affected_mob.adjustBrainLoss(1)
				affected_mob.updatehealth()
		if(3)
			if(prob(2))
				affected_mob.emote("stare")
			if(prob(2))
				affected_mob.emote("drool")
			if(prob(10) && affected_mob.getBrainLoss()<=98)//shouldn't retard you to death now
				affected_mob.adjustBrainLoss(2)
				affected_mob.updatehealth()
				if(prob(2))
					to_chat(affected_mob, "<span class='warning'>Your try to remember something important...but can't.</span>")
/*			if(prob(10))
				affected_mob.adjustToxLoss(3)
				affected_mob.updatehealth()
				if(prob(2))
					to_chat(affected_mob, "<span class='warning'>Your head hurts.</span>")*/
		if(4)
			if(prob(2))
				affected_mob.emote("stare")
			if(prob(2))
				affected_mob.emote("drool")
/*			if(prob(15))
				affected_mob.adjustToxLoss(4)
				affected_mob.updatehealth()
				if(prob(2))
					to_chat(affected_mob, "<span class='warning'>Your head hurts.</span>")*/
			if(prob(15) && affected_mob.getBrainLoss()<=98) //shouldn't retard you to death now
				affected_mob.adjustBrainLoss(3)
				affected_mob.updatehealth()
				if(prob(2))
					to_chat(affected_mob, "<span class='warning'>Strange buzzing fills your head, removing all thoughts.</span>")
			if(prob(3))
				affected_mob.visible_message("[affected_mob] suddenly collapses", self_message = "<span class='warning'>You lose consciousness...</span>")
				affected_mob.Paralyse(rand(5,10))
				if(prob(1))
					affected_mob.emote("snore")
			if(prob(15))
				affected_mob.AdjustStuttering(3)
	return
