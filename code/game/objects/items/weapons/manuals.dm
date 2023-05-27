/*********************MANUALS (BOOKS)***********************/

/obj/item/book/manual
	icon = 'icons/obj/library.dmi'
	due_date = 0 // Game time in 1/10th seconds
	unique = TRUE   // FALSE - Normal book, TRUE - Should not be treated as normal book, unable to be copied, unable to be modified


/obj/item/book/manual/chef_recipes
	name = "Chef Recipes"
	icon_state = "cooked_book"
	author = "Victoria Ponsonby"
	title = "Chef Recipes"

	dat = {"<html>
				<head>
				<style>
				h1 {font-size: 18px; margin: 15px 0px 5px;}
				h2 {font-size: 15px; margin: 15px 0px 5px;}
				h3 {font-size: 13px; margin: 15px 0px 5px;}
				li {margin: 2px 0px 2px 15px;}
				ul {margin: 5px; padding: 0px;}
				ol {margin: 5px; padding: 0px 15px;}
				body {font-size: 13px; font-family: Verdana;}
				</style>
				</head>
				<body>

				<h1>Food for Dummies</h1>
				Here is a guide on basic food recipes and also how to not poison your customers accidentally.

				<h3>Basics:</h3>
				Knead an egg and some flour to make dough. Bake that to make a bun or flatten and cut it.

				<h3>Burger:</h3>
				Put a bun and some meat into the microwave and turn it on. Then wait.

				<h3>Bread:</h3>
				Put some dough and an egg into the microwave and then wait.

				<h3>Waffles:</h3>
				Add two lumps of dough and 10 units of sugar to the microwave and then wait.

				<h3>Popcorn:</h3>
				Add 1 corn to the microwave and wait.

				<h3>Meat Steak:</h3>
				Put a slice of meat, 1 unit of salt, and 1 unit of pepper into the microwave and wait.

				<h3>Meat Pie:</h3>
				Put a flattened piece of dough and some meat into the microwave and wait.

				<h3>Boiled Spaghetti:</h3>
				Put the spaghetti (processed flour) and 5 units of water into the microwave and wait.

				<h3>Donuts:</h3>
				Add some dough and 5 units of sugar to the microwave and wait.

				<h3>Fries:</h3>
				Add one potato to the processor, then bake them in the microwave.


				</body>
			</html>
			"}


/obj/item/book/manual/barman_recipes
	name = "Barman Recipes"
	icon_state = "barbook"
	author = "Sir John Rose"
	title = "Barman Recipes"

	dat = {"<html>
				<head>
				<style>
				h1 {font-size: 18px; margin: 15px 0px 5px;}
				h2 {font-size: 15px; margin: 15px 0px 5px;}
				h3 {font-size: 13px; margin: 15px 0px 5px;}
				li {margin: 2px 0px 2px 15px;}
				ul {margin: 5px; padding: 0px;}
				ol {margin: 5px; padding: 0px 15px;}
				body {font-size: 13px; font-family: Verdana;}
				</style>
				</head>
				<body>

				<h1>Drinks for Dummies</h1>
				Here's a guide for some basic drinks.

				<h3>Black Russian:</h3>
				Mix vodka and Kahlua into a glass.

				<h3>Cafe Latte:</h3>
				Mix milk and coffee into a glass.

				<h3>Classic Martini:</h3>
				Mix vermouth and gin into a glass.

				<h3>Gin Tonic:</h3>
				Mix gin and tonic into a glass.

				<h3>Grog:</h3>
				Mix rum and water into a glass.

				<h3>Irish Cream:</h3>
				Mix cream and whiskey into a glass.

				<h3>The Manly Dorf:</h3>
				Mix ale and beer into a glass.

				<h3>Mead:</h3>
				Mix enzyme, water, and sugar into a glass.

				<h3>Screwdriver:</h3>
				Mix vodka and orange juice into a glass.

				</body>
			</html>
			"}

/////Consider Everything from this point down an Occulus Change/////

/obj/item/book/manual/nuclear
	name = "Fission Mailed: Nuclear Sabotage 101"
	desc = "An information manual for mercenary operatives on the usage of nuclear devices to destroy whatever might need a nuke. How did this get here?."
	icon_state = "book_nuclear"
	author = "Syndicate"
	title = "Fission Mailed: Nuclear Sabotage 101"

	dat = {"<html>
				<head>
				<style>
				h1 {font-size: 21px; margin: 15px 0px 5px;}
				h2 {font-size: 15px; margin: 15px 0px 5px;}
				li {margin: 2px 0px 2px 15px;}
				ul {margin: 5px; padding: 0px;}
				ol {margin: 5px; padding: 0px 15px;}
				body {font-size: 13px; font-family: Verdana;}
				</style>
				</head>
				<body>
				<h1>Nuclear Explosives 101</h1>
				Hello and thank you for choosing the Syndicate for your nuclear information needs. Today's crash course will deal with the operation of a Nuclear Fission Device.<br><br>

				First and foremost, DO NOT TOUCH ANYTHING UNTIL THE BOMB IS IN PLACE. Pressing any button on the compacted bomb will cause it to extend and bolt itself into place. If this is done, to unbolt it, one must completely log in, which at this time may not be possible.<br>

				<h2>To make the nuclear device functional</h2>
				<ul>
					<li>Place the nuclear device in the designated detonation zone.</li>
					<li>Extend and anchor the nuclear device from its interface.</li>
					<li>Insert the nuclear authorisation disk into the slot.</li>
					<li>Type the numeric authorisation code into the keypad. This should have been provided.<br>
					<b>Note</b>: If you make a mistake, press R to reset the device.
					<li>Press the E button to log on to the device.</li>
				</ul><br>

				You now have activated the device. To deactivate the buttons at anytime, for example when you've already prepped the bomb for detonation, remove the authentication disk OR press R on the keypad.<br><br>
				Now the bomb CAN ONLY be detonated using the timer. Manual detonation is not an option. Toggle off the SAFETY.<br>
				<b>Note</b>: You wouldn't believe how many Operatives with doctorates have forgotten this step.<br><br>

				So use the - - and + + to set a detonation time between 5 seconds and 10 minutes. Then press the timer toggle button to start the countdown. Now remove the authentication disk so that the buttons deactivate.<br>
				<b>Note</b>: THE BOMB IS STILL SET AND WILL DETONATE<br><br>

				Now before you remove the disk, if you need to move the bomb, you can toggle off the anchor, move it, and re-anchor.<br><br>

				Remember the order:<br>
				<b>Disk, Code, Safety, Timer, Disk, RUN!</b><br><br>
				Intelligence Analysts believe that normal corporate procedure is for the Captain to secure the nuclear authentication disk.<br><br>

				Good luck!
				</body>
			</html>
			"}


/obj/item/book/manual/wiki
	var/page_link = ""
	window_size = "970x710"
	bad_type = /obj/item/book/manual/wiki

/obj/item/book/manual/wiki/attack_self()
	if(!dat)
		initialize_wikibook()
	return ..()

/obj/item/book/manual/wiki/proc/initialize_wikibook()
	if(config.wikiurl)
		dat = {"
			<html><head>
			<style>
				iframe {
					display: none;
				}
			</style>
			</head>
			<body>
			<script type="text/javascript">
				function pageloaded(myframe) {
					document.getElementById("loading").style.display = "none";
					myframe.style.display = "inline";
    			}
			</script>
			<p id='loading'>You start skimming through the manual...</p>
			<iframe width='100%' height='97%' onload="pageloaded(this)" src="[config.wikiurl]/[page_link]_Eris[config.language]?printable=yes&remove_links=1" frameborder="0" id="main_frame"></iframe>
			</body>
			</html>
			"}

//engineering
/obj/item/book/manual/wiki/engineering_guide
	name = "Engineering Textbook"
	icon_state = "book_engineering"
	author = "Engineering Encyclopedia"
	title = "Engineering Textbook"
	page_link = "Guide_to_Engineering"

/obj/item/book/manual/wiki/engineering_construction
	name = "Station Repairs and Construction"
	icon_state = "book_construction"
	author = "Engineering Encyclopedia"
	title = "Station Repairs and Construction"
	page_link = "Guide_to_Construction"

/obj/item/book/manual/wiki/engineering_atmos
	name = "Pipes and You: Getting To Know Your Scary Tools"
	icon_state = "book_atmos"
	author = "Maria Crash, Senior Atmospherics Technician"
	title = "Pipes and You: Getting To Know Your Scary Tools"
	page_link = "Guide_to_Atmospherics"

/obj/item/book/manual/wiki/engineering_hacking
	name = "Hacking"
	icon_state = "book_hacking"
	author = "Engineering Encyclopedia"
	title = "Hacking"
	page_link = "Guide_to_Hacking"

/obj/item/book/manual/wiki/engineering_singularity
	name = "Singularity Safety in Special Circumstances"
	icon_state = "book_singularity"
	author = "Engineering Encyclopedia"
	title = "Singularity Safety in Special Circumstances"
	page_link = "Guide_to_Singularity"

/obj/item/book/manual/wiki/engineering_supermatter
	name = "Supermatter Engine Operating Manual"
	icon_state = "book_supermatter"
	author = "Central Engineering Division"
	title = "Supermatter Engine Operating Manual"
	page_link = "Guide_to_Supermatter"

//science
/obj/item/book/manual/wiki/science_research
	name = "Research and Development 101"
	icon_state = "book_rnd"
	author = "Dr. L. Ight"
	title = "Research and Development 101"
	page_link = "Guide_to_Research_and_Development"

/obj/item/book/manual/wiki/science_robotics
	name = "Cyborgs for Dummies"
	icon_state = "book_borg"
	author = "XISC"
	title = "Cyborgs for Dummies"
	page_link = "Guide_to_Robotics"

//security
/obj/item/book/manual/wiki/security_ironparagraphs
	name = "Cobalt Aegis Paragraphs"  // Occulus Edit - Remove Eris corp. reference
	desc = "A set of corporate guidelines for keeping order on privately-owned space assets."
	icon_state = "book_ironparagraphs"
	author = "Cobalt Aegis Security"
	title = "Cobalt Aegis Paragraphs"
	page_link = "Agreement"

/obj/item/book/manual/wiki/security_detective
	name = "The Film Noir: Proper Procedures for Investigations"
	icon_state = "book_forensics"
	author = "The Company"
	title = "The Film Noir: Proper Procedures for Investigations"
	page_link = "Guide_to_Forensics"

//medical
/obj/item/book/manual/wiki/medical_guide
	name = "Medical Diagnostics Manual"
	desc = "First, do no harm. A detailed medical practitioner's guide."
	icon_state = "book_medical"
	author = "Medical Journal, volume 1"
	title = "Medical Diagnostics Manual"
	page_link = "Guide_to_Medical"

/obj/item/book/manual/wiki/medical_chemistry
	name = "Chemistry Textbook"
	icon_state = "book"//TODO: Add icon
	author = "Medical Journal, volume 2"
	title = "Chemistry"
	page_link = "Guide_to_Chemistry"

//neotheology
/obj/item/book/manual/wiki/neotheology_cloning //TODO: Completely change this to be NT-oriented.
	name = "Cloning Rituals"
	icon_state = "book"//TODO: Add icon
	author = "The Church"
	title = "Cloning Rituals"
	page_link = "Guide_to_Cloning"

//service
/obj/item/book/manual/wiki/barman_recipes
	name = "Barman Recipes"
	icon_state = "book"
	author = "Sir John Rose"
	title = "Barman Recipes"
	page_link = "Guide_to_Food_and_Drinks"

/obj/item/book/manual/wiki/chef_recipes
	name = "Chef Recipes"
	icon_state = "chefbook"
	author = "Victoria Ponsonby"
	title = "Chef Recipes"
	page_link = "Guide_to_Food_and_Drinks"

/obj/item/paper/enginenotes
	name = "paper- 'Engine Setup Guide'"
	icon_state = "paper_words_crumpled"
	info = {"Quick reminder if you're setting up the engine, follow these steps.
	<br>
	1. Four cans of !!PLASMA!! into both the hot(core) and cold(pipes outside) loops, set the pumps that say 'port to-' on and at max.
	<br>
	2. Set the three pumps that are connected to the cooling loop just fore of the emitter on and at max.
	<br>
	3. DO NOT TOUCH THE OMNI FILTERS BEHIND THE BLAST DOORS!
	<br>
	4. Either hook up a can to the port where all the filtered gasses end up, or set up 'waste to wasting' just outside the blast doors. If you hook up the can don't forget to change it, if you vent the waste gasses remember to set up the pump downstairs so it's actually vented.
	<br>
	5. Turn on the emitter, shut the blast doors to the core, set the engine SMES units to max imput/output.
	<br>
	6. DON'T FORGET TO TWEAK THE RCON SETTINGS!"}

/obj/item/paper/forensicguide
	name = "paper- 'CSI Basics'"
	icon_state = "paper_words_crumpled"
	info = {"Small refresher for our newer forensics contractors and how not to fuck up an investigation scene.
	<br>
	1. Remember that the dusting kit is for fingerprints, the tweezers are for any fibers you might find, and the swab kit for any bodily fluids. Remember to use the luminol spray and UV light if you think it was mopped up.
	<br>
	2. Don't touch ANYTHING you don't need to and make sure your bonehead ops haven't.
	<br>
	3. The microscope should tell you almost anything you need, the rest is for you to figure out. Good luck."}

/obj/item/book/manual/security_aegisparagraphs //Occulus edit
	name = "Cobalt Aegis Paragraphs"
	desc = "A set of corporate guidelines for keeping order on privately-owned space assets."
	icon_state = "book_ironparagraphs"
	author = "Cobalt Aegis Security"
	title = "Cobalt Aegis Paragraphs"

	dat = {"<html>
				<head>
				<style>
				h1 {font-size: 18px; margin: 15px 0px 5px;}
				h2 {font-size: 15px; margin: 15px 0px 5px;}
				h3 {font-size: 13px; margin: 15px 0px 5px;}
				li {margin: 2px 0px 2px 15px;}
				ul {margin: 5px; padding: 0px;}
				ol {margin: 5px; padding: 0px 15px;}
				body {font-size: 13px; font-family: Verdana;}
				</style>
				</head>
				<body>

				<h1>Overview</h1>
				The Northern Light's regulations exist as a guideline for what is and isn't allowed aboard the vessel. While none of this is legally binding within Sol or other space. Command and by extension, Aegis is free to enforce these regulations as they see fit to maintain a functioning vessel.

				<h1>Minor Violations:</h1>

				<b>Minor trespassing into areas not granted by ID access</b> - 600cr paid to the trespassed department in question.<br>
				<br>
				<b>Theft of property belonging to another employee or company</b> - 600cr paid to offended department/item returned.<br>
				<br>
				<b>Possession of a Contraband Item</b> - confiscation with re-compensation within reason.<br>
				<br>
				<b>Possession of lethal munitions without registration/reason</b> - confiscation with re-compensation within reason.<br>
				<br>
				<b>Vandalism</b> - 600cr fine<br>
				<br>
				<b>Animal cruelty</b> - 800cr fine<br>

				<h1>Moderate Violations:</h1>

				<b>Major tresspass into areas of high security</b> - Detainment followed by questioning pending command orders.<br>
				<br>
				<b>Minor neglect of Duty</b> - 1000cr fine, command notified.<br>
				<br>
				<b>Assault with capability</b> - Detainment followed by questioning + 2000cr fine.<br>
				<br>
				<b>Battery</b> - Detainment followed by questioning, command notified for further resolution if needed.<br>

				<h1>Major Violations:</h1>

				<b>Aggravated battery</b> - Detainment pending command orders.<br>
				<br>
				<b>Battery of command staff</b> - Detainment pending command orders<br>
				<br>
				<b>Major Neglect of Duty(Resulting in major injury/damage)</b> - Detainment pending command orders.<br>
				<br>
				<b>Manslaughter(death without intent)</b> - Detainment pending command orders.<br>
				<br>
				<b>Major theft of dangerous property</b> - Detainment pending command orders.<br>
				<br>
				<b>Murder</b> - Detainment pending command orders.<br>
				<br>
				<b>Sabotage of ship synthetics</b> - Detainment with crew rights waived, pending command orders.<br>

				<h1>Omega Violations:</h1>

				<b>Sabotage of the ship</b> - Immediate crew status revocation.<br>
				<br>
				<b>Neglect of Duty during Code Delta</b> - Immediate crew status revocation, immediate detainment up to including lethal force.<br>
				<br>
				<b>Mass Murder(2+ victims)</b> - Immediate crew status revocation, lethal force recommended.<br>
				<br>
				<b>Allegiance to a hostile collective(Known Terrorists, political extremists, etc)</b> - Immediate crew status revocation.<br>
				<br>
				<b>Inability or refusal to remain detained</b> - Immediate crew status revocation, detainment by most extreme methods, including lethal force.<br>


				</body>
			</html>
			"}
