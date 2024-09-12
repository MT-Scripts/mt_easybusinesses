Businesses = Businesses or {}

-- All the options besides the job are optional, you can just delete them and it'll be disabled!
-- To create a new business just copy this file/code and create a new one on the businesses folder with a different name and job

Businesses[#Businesses + 1] = {
    job = 'realestate', -- The business job
    debug = true, -- Zones debug

    blip = { -- Business map blip
        coords = vec3(428.45, -775.05, 29.1),
        sprite = 58,
        color = 5,
        display = 4,
        scale = 0.8,
        label = "Pawn shop"
    },

    managements = { -- The business management locations
        { coords = vec3(432.85, -773.6, 29.4), radius = 0.45 },
    },

    stashes = { -- The business stashes
        {
            coords = vec3(430.0, -779.0, 29.6),
            radius = 0.65,
            minGrade = 0, -- Minimun grade needed to use the stash
            weight = 100, -- In KG
            slots = 50,
            label = "Stash test"
        },
        {
            coords = vec3(435.85, -771.8, 29.25),
            radius = 0.4,
            minGrade = 3, -- Minimun grade needed to use the stash
            weight = 100, -- In KG
            slots = 50,
            label = "Stash test locked"
        },
    },

    crafts = { -- The business crafts
        {
            coords = vec3(430.65, -773.0, 29.3),
            radius = 0.5,
            minGrade = 0, -- Minimun grade needed to use the craft
            label = "Test craft",
            items = {
                {
                    name = 'phone',
                    ingredients = {
                        copper = 1,
                    },
                }
            }
        },
    },

    shops = { -- The business shops
        {
            coords = vec3(430.75, -771.85, 29.4),
            radius = 0.25,
            minGrade = 0, -- Minimun grade needed to use the shop
            label = "Test shop",
            inventory = {
                { name = 'phone', price = 1 }
            }
        },
    },

    trays = { -- The business trays and showcases
        {
            coords = vec3(428.45, -775.05, 29.1),
            radius = 0.55,
            weight = 20, -- In KG
            slots = 10,
            includeTray = true, -- If true it'll active the tray stash
            includeShowcase = true, -- If true it'll active the showcase stash
            showcaseGrade = 0, -- Minimum grade to access the showcase
            trayLabel = "Test tray",
            showcaseLabel = "Test showcase"
        },
    },

    duty = { -- The business duty points
        { coords = vec3(428.5, -778.65, 30.2), radius = 0.3 },
    }
}