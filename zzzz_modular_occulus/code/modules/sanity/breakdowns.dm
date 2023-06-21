// Stat Loss breakdown, negative mirror of lesson learnt
/datum/breakdown/negative/forgotten
    name = "A Lesson Forgotten"
    duration = 0
    restore_sanity_post = 50

    start_messages = list(
        "Your experience weighs you down, each one making you worse",
        "Nothing in your mind clicks anymore, you feel more incompetent",
        "Your past mistakes haunt you, and they keep repeating",
        "You've forgotten what you've learned in the past",
        "Nothing makes sense anymore!"
    )

// This is like a negative mirror of A Lesson Learnt, stat loss is less harsh but still significant
/datum/breakdown/negative/forgotten/conclude()
    for(var/stat in ALL_STATS)
        holder.owner.stats.changeStat(stat, -rand(2,5))
    ..()