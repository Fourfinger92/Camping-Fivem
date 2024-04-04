ConfigCamping = {}

ConfigCamping.wildesprobspawndings = {
    campingkit = {
        probs={
            {name = "prop_beach_fire", xOffset =-1.5, yOffset = -1.5, zOffset = -1.6, heading = 0.0, freezed = false, noOffset = false},
            {name = "prop_skid_tent_cloth", xOffset =-1.5, yOffset = -3.5, zOffset = -0.5, heading = 0.0, freezed = false, noOffset = true},
            {name = "prop_skid_chair_02", xOffset =-2.0, yOffset = 0.5, zOffset = -0.6, heading = 0.0, freezed = true, noOffset = true},
            {name = "prop_skid_chair_02", xOffset =-0.8, yOffset = 0.5, zOffset = -0.6, heading = 0.0, freezed = true, noOffset = true},        
        }, 
        areaausnahme = false,
    },
    
    campingkit1 = {
        probs={
            {name = "prop_beach_fire", xOffset =-1.5, yOffset = -1.5, zOffset = -1.6, heading = 0.0, freezed = false, noOffset = false},
            {name = "prop_skid_tent_01", xOffset =-1.5, yOffset = -3.5, zOffset = -0.5, heading = 0.0, freezed = false, noOffset = true},
            {name = "prop_skid_chair_01", xOffset =-2.0, yOffset = 0.5, zOffset = -0.6, heading = 0.0, freezed = true, noOffset = true},
            {name = "prop_skid_chair_01", xOffset =-0.8, yOffset = 0.5, zOffset = -0.6, heading = 0.0, freezed = true, noOffset = true},
            {name = "prop_coolbox_01", xOffset =-3.0, yOffset = -0.7, zOffset = -1.0, heading = 0.0, freezed = true, noOffset = false},        
        }, 
        areaausnahme = false,
    },
    
    campingkit2 = {
        probs={
            {name = "prop_beach_fire", xOffset =-1.5, yOffset = -1.5, zOffset = -1.6, heading = 0.0, freezed = false, noOffset = false},
            {name = "prop_skid_tent_03", xOffset =-2.0, yOffset = -3.5, zOffset = -0.5, heading = 0.0, freezed = false, noOffset = true},
            {name = "prop_skid_tent_03", xOffset =-0.1, yOffset = -3.5, zOffset = -0.5, heading = 0.0, freezed = false, noOffset = true},
            {name = "prop_skid_chair_02", xOffset =-2.0, yOffset = 0.5, zOffset = -0.6, heading = 0.0, freezed = true, noOffset = true},
            {name = "prop_skid_chair_02", xOffset =-0.8, yOffset = 0.5, zOffset = -0.6, heading = 0.0, freezed = true, noOffset = true},
            {name = "prop_skid_chair_02", xOffset =-3.2, yOffset = -1.5, zOffset = -0.6, heading = 90.0, freezed = true, noOffset = true},
            {name = "prop_skid_chair_02", xOffset =0.8, yOffset = -1.5, zOffset = -0.6, heading = -90.0, freezed = true, noOffset = true},
            {name = "prop_coolbox_01", xOffset =-3.0, yOffset = -0.7, zOffset = -1.0, heading = 0.0, freezed = true, noOffset = false},
               
        }, 
        areaausnahme = false,
    },

    campingkithunting = {
        probs={
            {name = "prop_beach_fire", xOffset =-1.5, yOffset = -1.5, zOffset = -1.6, heading = 0.0, freezed = false, noOffset = false},
            {name = "prop_skid_tent_01b", xOffset =-1.5, yOffset = -3.5, zOffset = -0.5, heading = 0.0, freezed = false, noOffset = true},
            {name = "prop_skid_chair_01", xOffset =-2.0, yOffset = 0.5, zOffset = -0.6, heading = 0.0, freezed = true, noOffset = true},
            {name = "prop_skid_chair_01", xOffset =-0.8, yOffset = 0.5, zOffset = -0.6, heading = 0.0, freezed = true, noOffset = true},
            {name = "hei_prop_carrier_crate_01a", xOffset =-3.5, yOffset = -3.0, zOffset = -1.0, heading = 0.0, freezed = true, noOffset = false}, 
            {name = "prop_coolbox_01", xOffset =-2.5, yOffset = -0.5, zOffset = -1.0, heading = 0.0, freezed = true, noOffset = false},       
        }, 
        areaausnahme = false,
    },
    chair1 = { --these chairs are like the grill only placable one at a time and can be put back in you inventory
        probs={
            {name = "prop_skid_chair_01", xOffset =-0.8, yOffset = 0.5, zOffset = -0.6, heading = 0.0, freezed = true, noOffset = true},        
        }, 
        areaausnahme = true,
    },

    chair2 = { --these chairs are like the grill only placable one at a time and can be put back in you inventory
        probs={
            {name = "prop_skid_chair_02", xOffset =-0.8, yOffset = 0.5, zOffset = -0.6, heading = 0.0, freezed = true, noOffset = true},        
        }, 
        areaausnahme = true,
    },
    grill = {    --do not delete. the ConfigCamping.grillfleisch is attached to this
        probs={
            {name = "prop_bbq_5", xOffset =-0.8, yOffset = 0.5, zOffset = -1.0, heading = 0.0, freezed = true, noOffset = true},        
        }, 
        areaausnahme = true,
    },
}

ConfigCamping.grillfleisch = {
    roastbeef= {ergebnis = {roastbeefgrill = 1}, emote = 'PROP_HUMAN_BBQ',probs = {`prop_bbq_5`,`prop_bbq_4`}},
    spareribs= {ergebnis = {spareribsgrill = 1}, emote = 'PROP_HUMAN_BBQ',probs = {`prop_bbq_5`,`prop_bbq_4`}},
    tomahawk= {ergebnis = {tomahawkgrill = 1}, emote = 'PROP_HUMAN_BBQ',probs = {`prop_bbq_5`,`prop_bbq_4`}},
    meat1= {ergebnis = {meat1grill = 1}, emote = 'PROP_HUMAN_BBQ',probs = {`prop_bbq_5`,`prop_bbq_4`}},
    meat2= {ergebnis = {meat2grill = 1}, emote = 'PROP_HUMAN_BBQ',probs = {`prop_bbq_5`,`prop_bbq_4`}},
    mais= {ergebnis = {maisgrill = 1}, emote = 'PROP_HUMAN_BBQ',probs = {`prop_bbq_5`,`prop_bbq_4`}},
    manmeat= {ergebnis = {manmeatgrill = 1}, emote = 'PROP_HUMAN_BBQ',probs = {`prop_bbq_5`,`prop_bbq_4`}},
}
