/obj/item/weapon/book/manual/wiki
	var/page_link = ""
	window_size = "970x710"

/obj/item/weapon/book/manual/wiki/attack_self()
	if(!dat)
		initialize_wikibook()
	return ..()

/obj/item/weapon/book/manual/wiki/proc/initialize_wikibook()
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
/obj/item/weapon/book/manual/wiki/engineering_guide
	name = "Engineering Textbook"
	icon_state = "book_engineering"
	author = "Engineering Encyclopedia"
	title = "Engineering Textbook"
	page_link = "Guide_to_Engineering"

/obj/item/weapon/book/manual/wiki/engineering_construction
	name = "Station Repairs and Construction"
	icon_state = "book_construction"
	author = "Engineering Encyclopedia"
	title = "Station Repairs and Construction"
	page_link = "Guide_to_Construction"

/obj/item/weapon/book/manual/wiki/engineering_atmos
	name = "Pipes and You: Getting To Know Your Scary Tools"
	icon_state = "book_atmos"
	author = "Maria Crash, Senior Atmospherics Technician"
	title = "Pipes and You: Getting To Know Your Scary Tools"
	page_link = "Guide_to_Atmospherics"

/obj/item/weapon/book/manual/wiki/engineering_hacking
	name = "Hacking"
	icon_state = "book_hacking"
	author = "Engineering Encyclopedia"
	title = "Hacking"
	page_link = "Guide_to_Hacking"

/obj/item/weapon/book/manual/wiki/engineering_singularity
	name = "Singularity Safety in Special Circumstances"
	icon_state = "book_singularity"
	author = "Engineering Encyclopedia"
	title = "Singularity Safety in Special Circumstances"
	page_link = "Guide_to_Singularity"

/obj/item/weapon/book/manual/wiki/engineering_supermatter
	name = "Supermatter Engine Operating Manual"
	icon_state = "book_supermatter"
	author = "Central Engineering Division"
	title = "Supermatter Engine Operating Manual"
	page_link = "Guide_to_Supermatter"

//science
/obj/item/weapon/book/manual/wiki/science_research
	name = "Research and Development 101"
	icon_state = "book_rnd"
	author = "Dr. L. Ight"
	title = "Research and Development 101"
	page_link = "Guide_to_Research_and_Development"

/obj/item/weapon/book/manual/wiki/science_robotics
	name = "Cyborgs for Dummies"
	icon_state = "book_borg"
	author = "XISC"
	title = "Cyborgs for Dummies"
	page_link = "Guide_to_Robotics"

//security
/obj/item/weapon/book/manual/wiki/security_ironparagraphs
	name = "Cobalt Aegis Paragraphs"
	desc = "A set of corporate guidelines for keeping order on privately-owned space assets."
	icon_state = "book_ironparagraphs"
	author = "Cobalt Aegis Security"
	title = "Cobalt Aegis Paragraphs"
	page_link = "Agreement"

/obj/item/weapon/book/manual/wiki/security_detective
	name = "The Film Noir: Proper Procedures for Investigations"
	icon_state = "book_forensics"
	author = "The Company"
	title = "The Film Noir: Proper Procedures for Investigations"
	page_link = "Guide_to_Forensics"

//medical
/obj/item/weapon/book/manual/wiki/medical_guide
	name = "Medical Diagnostics Manual"
	desc = "First, do no harm. A detailed medical practitioner's guide."
	icon_state = "book_medical"
	author = "Medical Journal, volume 1"
	title = "Medical Diagnostics Manual"
	page_link = "Guide_to_Medical"

/obj/item/weapon/book/manual/wiki/medical_chemistry
	name = "Chemistry Textbook"
	icon_state = "book"//TODO: Add icon
	author = "Medical Journal, volume 2"
	title = "Chemistry"
	page_link = "Guide_to_Chemistry"

//neotheology
/obj/item/weapon/book/manual/wiki/neotheology_cloning //TODO: Completely change this to be NT-oriented.
	name = "Cloning Rituals"
	icon_state = "book"//TODO: Add icon
	author = "The Church"
	title = "Cloning Rituals"
	page_link = "Guide_to_Cloning"

//service
/obj/item/weapon/book/manual/wiki/barman_recipes
	name = "Barman Recipes"
	icon_state = "book"
	author = "Sir John Rose"
	title = "Barman Recipes"
	page_link = "Guide_to_Food_and_Drinks"

/obj/item/weapon/book/manual/wiki/chef_recipes
	name = "Chef Recipes"
	icon_state = "chefbook"
	author = "Victoria Ponsonby"
	title = "Chef Recipes"
	page_link = "Guide_to_Food_and_Drinks"
