remote.add_interface("twitch_deathworld",{
    help_research = function (name, amount)
        local player = game.players[1];
        local force = player.force;
        local research = force.current_research;

        if research then
            local new_amount = force.research_progress + amount;
            if new_amount >= 1 then
                force.research_progress = 1;
                force.print({"", "[Twitch] ", name, " completed ", research.localised_name}, {0, 1, 0, 1});
            else
                force.research_progress = new_amount;
                force.print({"", "[Twitch] ", name, " contributed to ", research.localised_name}, {0, 1, 0, 1});
            end
            return "worked";
        end
        return "failed";
    end,

    hurt_research = function (name, amount)
        local player = game.players[1];
        local force = player.force;
        local research = force.current_research;

        if research then
            local new_amount = force.research_progress - amount;
            if new_amount <= 0 then
                force.research_progress = 0;
                force.print({"", "[Twitch] ", name, " completely reset ", research.localised_name}, {1, 0, 0, 1});
            else
                force.research_progress = new_amount;
                force.print({"", "[Twitch] ", name, " set back ", research.localised_name}, {1, 0, 0, 1});
            end
            return "worked";
        end
        return "failed";
    end
});