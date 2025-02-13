/obj/item/ammo_casing/energy
	name = "energy weapon lens"
	desc = "The part of the gun that makes the laser go pew."
	caliber = "energy"
	projectile_type = /obj/item/projectile/energy
	var/e_cost = 100 //The amount of energy a cell needs to expend to create this shot.
	var/select_name = "energy"
	var/mod_name = null
	var/fire_sound = 'sound/weapons/guns/gunpulse_laser.ogg'

/obj/item/ammo_casing/energy/laser
	projectile_type = /obj/item/projectile/beam
	select_name = "kill"

/obj/item/ammo_casing/energy/laser_pulse
	projectile_type = /obj/item/projectile/energy/laser
	select_name = "kill"
	e_cost = 50
	fire_sound = 'sound/weapons/guns/gunpulse_laser3.ogg'

/obj/item/ammo_casing/energy/laser/practice
	projectile_type = /obj/item/projectile/beam/practice
	select_name = "practice"

/obj/item/ammo_casing/energy/laser/scatter
	projectile_type = /obj/item/projectile/beam/scatter
	pellets = 5
	variance = 0.8
	select_name = "scatter"

/obj/item/ammo_casing/energy/laser/heavy
	projectile_type = /obj/item/projectile/beam/heavylaser
	select_name = "anti-vehicle"
	fire_sound = 'sound/weapons/guns/lasercannonfire.ogg'

/obj/item/ammo_casing/energy/laser/pulse
	projectile_type = /obj/item/projectile/beam/pulse
	e_cost = 200
	select_name = "DESTROY"
	fire_sound = 'sound/weapons/guns/gunpulse.ogg'

/obj/item/ammo_casing/energy/laser/omnitag
	projectile_type = /obj/item/projectile/beam/lasertag/omni
	select_name = "omnitag"

/obj/item/ammo_casing/energy/laser/bluetag
	projectile_type = /obj/item/projectile/beam/lasertag/blue
	fire_sound = 'sound/weapons/guns/lasertag.ogg'
	e_cost = 75
	select_name = "bluetag"

/obj/item/ammo_casing/energy/laser/redtag
	projectile_type = /obj/item/projectile/beam/lasertag/red
	fire_sound = 'sound/weapons/guns/lasertag.ogg'
	e_cost = 75
	select_name = "redtag"

/obj/item/ammo_casing/energy/bolt
	projectile_type = /obj/item/projectile/energy/bolt
	select_name = "bolt"
	fire_sound = 'sound/weapons/Genhit.ogg'

/obj/item/ammo_casing/energy/bolt/large
	projectile_type = /obj/item/projectile/energy/bolt/large
	select_name = "heavy bolt"

/obj/item/ammo_casing/energy/xray
	projectile_type = /obj/item/projectile/beam/xray
	e_cost = 50
	fire_sound = 'sound/weapons/guns/gunpulse_laser3.ogg'

/obj/item/ammo_casing/energy/electrode
	projectile_type = /obj/item/projectile/energy/electrode
	e_cost = 200
	select_name = "stun - electrode"
	fire_sound = 'sound/weapons/guns/gunpulse_taser.ogg'

/obj/item/ammo_casing/energy/stun
	projectile_type = /obj/item/projectile/beam/stun
	select_name = "stun"
	fire_sound = 'sound/weapons/guns/gunpulse_taser.ogg'
	e_cost = 50

/obj/item/ammo_casing/energy/electrode/gun
	fire_sound = 'sound/weapons/guns/gunpulse_stunrevolver.ogg'

/obj/item/ammo_casing/energy/stun/gun
	fire_sound = 'sound/weapons/guns/gunpulse_stunrevolver.ogg'

/obj/item/ammo_casing/energy/ion
	projectile_type = /obj/item/projectile/ion
	select_name = "ion"
	fire_sound = 'sound/weapons/guns/gunpulse_laser.ogg'

/obj/item/ammo_casing/energy/ion/small
	projectile_type = /obj/item/projectile/ion/small

/obj/item/ammo_casing/energy/declone
	projectile_type = /obj/item/projectile/energy/declone
	select_name = "declone"
	fire_sound = 'sound/weapons/guns/gunpulse3.ogg'

/obj/item/ammo_casing/energy/declone/light
	projectile_type = /obj/item/projectile/energy/declone/light

/obj/item/ammo_casing/energy/mindflayer
	projectile_type = /obj/item/projectile/beam/mindflayer
	select_name = "MINDFUCK"
	fire_sound = 'sound/weapons/guns/gunpulse_laser.ogg'

/obj/item/ammo_casing/energy/flora
	fire_sound = 'sound/effects/stealthoff.ogg'

/obj/item/ammo_casing/energy/flora/yield
	projectile_type = /obj/item/projectile/energy/florayield
	select_name = "increase yield"
	mod_name = "yield"

/obj/item/ammo_casing/energy/flora/mut
	projectile_type = /obj/item/projectile/energy/floramut
	select_name = "induce mutations"
	mod_name = "mut"

/obj/item/ammo_casing/energy/temp
	projectile_type = /obj/item/projectile/temp
	select_name = "freeze"
	e_cost = 250
	fire_sound = 'sound/weapons/guns/gunpulse3.ogg'

/obj/item/ammo_casing/energy/temp/hot
	projectile_type = /obj/item/projectile/temp/hot
	select_name = "bake"

/obj/item/ammo_casing/energy/meteor
	projectile_type = /obj/item/projectile/meteor
	select_name = "goddamn meteor"

/obj/item/ammo_casing/energy/toxin
	projectile_type = /obj/item/projectile/energy/phoron
	select_name = "phoron"
	fire_sound = 'sound/effects/stealthoff.ogg'

/obj/item/ammo_casing/energy/sniper
	projectile_type = /obj/item/projectile/beam/sniper
	select_name = "sniper"
	e_cost = 100
	fire_sound = 'sound/weapons/guns/marauder.ogg'

/obj/item/ammo_casing/energy/rails
	projectile_type = /obj/item/projectile/beam/rails
	select_name = "rails"
	e_cost = 100
	fire_sound = 'sound/weapons/guns/gunpulse_railgun.ogg'

/obj/item/ammo_casing/energy/pyrometer
	projectile_type = /obj/item/projectile/pyrometer
	select_name = "pyrometer (hue)"
	e_cost = 10
	fire_sound = 'sound/weapons/pyrometr_shot.ogg'

/obj/item/ammo_casing/energy/pyrometer/emagged
	projectile_type = /obj/item/projectile/pyrometer/emagged
	select_name = "pyrometer (overloaded)"
	e_cost = 1000

/obj/item/ammo_casing/energy/pyrometer/emagged/fire(atom/target, mob/living/user, params, distro, quiet)
	var/obj/item/weapon/gun/energy/pyrometer/pyro = loc
	BB.damage *= pyro.ML.rating
	return ..()

/obj/item/ammo_casing/energy/pyrometer/science_phoron
	projectile_type = /obj/item/projectile/pyrometer/science_phoron
	select_name = "pyrometer (phoron-oriented)"

/obj/item/ammo_casing/energy/pyrometer/engineering
	projectile_type = /obj/item/projectile/pyrometer/engineering
	select_name = "pyrometer (machinery)"

/obj/item/ammo_casing/energy/pyrometer/atmospherics
	projectile_type = /obj/item/projectile/pyrometer/atmospherics
	select_name = "pyrometer (atmospherics)"

/obj/item/ammo_casing/energy/pyrometer/medical
	projectile_type = /obj/item/projectile/pyrometer/medical
	select_name = "non-contact thermometer (medical)"
