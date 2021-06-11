// OCCULUS ADD: Disables matchmaking from initialising, even though it's removed from the character setup. If playerdata fucks up in a way, it wont affect the player.

/datum/matchmaker/do_matchmaking()
    return