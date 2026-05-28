data:extend({
    {
        type = "bool-setting",
        name = "chaos-messages-in-chat",
        setting_type = "runtime-per-user",
        default_value = true
    },
    {
        type = "int-setting",
        name = "chaos-refire-interval",
        setting_type = "runtime-global",
        default_value = 60,
        minimum_value = 5,
        maximum_value = 3600,
    },
    {
        type = "double-setting",
        name = "chaos-duration-multiplier",
        setting_type = "runtime-global",
        default_value = 1,
        minimum_value = 0.1,
        maximum_value = 10,
    },
    -- Effects
    {
        type = "bool-setting",
        name = "chaos-effect-disable-research",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-chart-random-area",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-clear-chart",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-rechart",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-chart-all",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-unchart-random-chunk",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-cease-fire-player",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-cease-fire-enemy",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-kill-all-units",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-random-spawn-position",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-reset-evolution",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-research-random-technology",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-random-technology-progress",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-enable-random-recipe",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-manual-mining-speed",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-manual-crafting-speed",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-laboratory-speed-modifier",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-laboratory-productivity-bonus",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-worker-robots-speed-modifier",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-worker-robots-battery-modifier",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-worker-robots-storage-bonus",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-research-progress-random",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-inserter-stack-size-bonus",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-stack-inserter-capacity-bonus",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-character-trash-slot-count",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-maximum-following-robot-count",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-following-robots-lifetime-modifier",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-character-running-speed-modifier",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-artillery-range-modifier",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-character-build-distance-bonus",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-character-item-drop-distance-bonus",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-character-reach-distance-bonus",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-character-resource-reach-distance-bonus",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-character-item-pickup-distance-bonus",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-character-loot-pickup-distance-bonus",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-character-inventory-slots-bonus",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-character-health-bonus",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-mining-drill-productivity-bonus",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-train-braking-force-bonus",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-research-queue",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-pollute-random",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-build-enemy-base-at-random-position",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-mark-deconstruct-random-area",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-mark-upgrade-random-area",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-clear-all-pollution",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-always-day",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-random-time-of-day",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-random-wind-speed",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-daytime-freeze",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-short-daytime",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-set-daytime",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-random-daytime-phases",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-solar-power",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-dark-night",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-turn-enemy-units-to-trees",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-turn-trees-to-enemy-units",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-convert-all-biters-to-player-force",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-convert-all-player-turrets-to-enemy-force",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-turn-all-player-turrets-to-worms",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-convert-all-worms-to-player-force",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-remove-all-biters",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-turn-trees-into-resources",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-resource-amount",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-randomize-resource-deposits",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-randomize-fluids",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-randomize-fluids-to-one-fluid",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-turn-trees-to-rocks",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-insert-random-modules",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-set-random-recipes",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-reset-assembler-recipes",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-technology-price-multiplier",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-pollution",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-pollution-diffusion-ratio",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-pollution-min-to-diffuse",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-pollution-ageing",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-pollution-enemy-attack",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-peaceful-mode",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-recipe-difficulty",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-turn-enemy-units-to-landmines",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-mix-ore-deposits",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-enemy-evolution",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-evolution-time-factor",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-evolution-destroy-factor",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-evolution-pollution-factor",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-enemy-expansion",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-turn-rocks-into-trees",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-turn-rocks-into-resources",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-deplete-random-resources",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-mapgen-cliff-richness",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-mapgen-cliff-elevation-interval",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-mapgen-water-coverage",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-mapgen-water-scale",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-mapgen-autoplace-trees-frequency",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-mapgen-autoplace-trees-size",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-mapgen-autoplace-control-frequency",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-mapgen-autoplace-control-size",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-mapgen-autoplace-control-richness",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-mapgen-autoplace-enemy-base-frequency",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-mapgen-autoplace-enemy-base-size",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "chaos-effect-mapgen-autoplace-enemy-base-richness",
        setting_type = "runtime-global",
        default_value = true
    },

})
