/obj/machinery/vending/boyarka
	name = "Boyarishnik vending machine"
	desc = "������������������ ������� ��� ������������������ ������! ����� 49 ������� �������! ����� �� ����������!"
	density = FALSE
	icon = 'code/white/hule/boyareeshneek/boyarka.dmi'
	icon_state = "boyarka"
	icon_vend = "boyarka"
	product_ads = "���������-���������!;����������� ���������!;����� �� 49 ������� �������!"
	product_slogans = "��������� ��� ������!"

	products = list(/obj/item/reagent_containers/food/drinks/boyarishnik = 3)

	contraband = list(/obj/item/reagent_containers/food/drinks/boyarishnik = 5)

	premium = list(/obj/item/reagent_containers/food/drinks/boyarishnik = 50)

	refill_canister = null

	armor = list(melee = 100, bullet = 100, laser = 100, energy = 100, bomb = 100, bio = 100, rad = 100, fire = 100, acid = 100)
	resistance_flags = FIRE_PROOF

/obj/machinery/vending/boyarka/New()
	name = "[pick("Boyarka24","Boyarin24","Boyarishnik24", "BoyarkaPlus", "BoyarinPlus", "BoyarishnikPlus", "BoyarkaForte", "BoyarinForte", "BoyarishnikForte")]"

/datum/reagent/consumable/ethanol/boyarka
	name = "Boyarishnik"
	id = "boyarka"
	description = "Number one drink AND fueling choice for Russians worldwide."
	color = "#0064C8"
	boozepwr = 100
	taste_description = "berry alcohol"
	glass_icon_state = "boyarka_bottle"
	glass_name = "boyarishnik bottle"
	glass_desc = "The glass contain boyarishnik."
	shot_glass_icon_state = "shotglassclear"

/datum/reagent/consumable/ethanol/boyarka/on_mob_life(mob/living/M)
	if(prob(7.5))
		M.adjustToxLoss(2*REM, 0)
		M.blur_eyes(35)
		M.set_eye_damage(30)
		. = 1
	..()

	if(prob(5))
		M.set_drugginess(50)
		M.adjustBrainLoss(3*REM, 150)
	..()

	if(prob(5))
		M.hallucination += 4
		M.adjustToxLoss(5*REM, 0)
		M.Sleeping(40, 0)
		return ..()

	if(prob(4))
		M.set_eye_damage(100)
		M.Sleeping(300, 0)
		return ..()

	if(prob(3))
		if(ishuman(M))
			var/mob/living/carbon/human/H = M
			if(!H.undergoing_cardiac_arrest() && H.can_heartattack())
				H.set_heartattack(TRUE)
				if(H.stat == CONSCIOUS)
					H.visible_message("<span class='userdanger'>[H] clutches at [H.p_their()] chest as if [H.p_their()] heart stopped!</span>")
			else
				H.losebreath += 10
				H.adjustOxyLoss(rand(5,25), 0)
				. = 1

	if(prob(2.5))
		M.damageoverlaytemp = 60
		M.update_damage_hud()
		M.blur_eyes(3)
		M.Sleeping(40, 0)
		return ..()

	if(prob(0.3))
		M.gib()
	return ..()

	if(prob(2.5))		//�������� �������� ����
		if(iscarbon(M))
			var/mob/living/carbon/N = M
			N.hal_screwyhud = SCREWYHUD_HEALTHY
		M.adjustBruteLoss(-0.25*REM, 0)
		M.adjustFireLoss(-0.25*REM, 0)
		..()
		. = 1

	if(prob(0.1))
		M.reagents.remove_all_type(/datum/reagent/toxin, 5*REM, 0, 1)
		M.setCloneLoss(0, 0)
		M.setOxyLoss(0, 0)
		M.radiation = 0
		M.heal_bodypart_damage(5,5, 0)
		M.adjustToxLoss(-5, 0)
		M.hallucination = 0
		M.setBrainLoss(0)
		M.remove_all_disabilities()
		M.set_blurriness(0)
		M.set_blindness(0)
		M.SetKnockdown(0, 0)
		M.SetStun(0, 0)
		M.SetUnconscious(0, 0)
		M.dizziness = 0
		M.drowsyness = 0
		M.stuttering = 0
		M.slurring = 0
		M.confused = 0
		M.SetSleeping(0, 0)
		M.jitteriness = 0
		..()
		. = 1

/obj/item/reagent_containers/glass/bottle/boyarishnik //�� ��������(
	name = "Boyarishnik bottle"
	desc = "����������� ������� ������� �������� ������� ����."
	icon = 'code/white/hule/boyareeshneek/boyarka.dmi'
	icon_state = "boyarka_bottle"
	list_reagents = list("boyarka" = 30)
	amount_per_transfer_from_this = 10

/obj/item/reagent_containers/food/drinks/boyarishnik
	name = "Boyarishnik bottle"
	desc = "����������� ������� ������� �������� ������� ����."
	icon = 'code/white/hule/boyareeshneek/boyarka.dmi'
	icon_state = "boyarka_bottle"
	list_reagents = list("boyarka" = 30)
	foodtype = ALCOHOL