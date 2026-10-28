// Generated from data/sanctum-core-links.json by prepare_sanctum_core_links.py - do not edit by hand.
// Done = the Witch mission missionKey is at state 5 (cleansed) in QuestSaveData._missionStateList;
// no record = unknown; missionKey 0 = no save rule known, so the marker is never hidden.
#pragma once
struct SanctumCoreLink { const char* name; float position[3]; uint32_t missionKey; };
constexpr SanctumCoreLink kSanctumCoreLinks[] = {
    {"Core of Absolution", {-11778.79f, 1016.73f, -5921.82f}, 1000687u},
    {"Core of Atonement", {-11426.77f, 807.89f, -3233.72f}, 1000262u},
    {"Core of Benediction", {-12421.59f, 1051.41f, -3564.46f}, 1000990u},
    {"Core of Deliverance", {-10673.19f, 705.22f, -2548.1f}, 1001473u},
    {"Core of Devotion", {-6472.64f, 580.45f, -5147.0f}, 1001475u},
    {"Core of Exaltation", {-10287.51f, 781.14f, 599.89f}, 1000992u},
    {"Core of Expiation", {-9181.83f, 766.76f, -1648.64f}, 1001479u},
    {"Core of Faith", {-3187.51f, 473.0f, -5674.97f}, 0u},
    {"Core of Mortification", {-7658.46f, 598.5f, -2065.24f}, 0u},
    {"Core of Oblation", {-3414.71f, 389.77f, -4486.9f}, 0u},
    {"Core of Penitence", {-9390.47f, 601.99f, -5008.56f}, 1000989u},
    {"Core of Renunciation", {-5113.7f, 521.09f, -2282.49f}, 1001481u},
    {"Core of Revelation", {-7188.59f, 413.89f, -4250.33f}, 1001482u},
    {"Core of Solace", {-10489.55f, 833.17f, -635.18f}, 1000993u},
    {"Core of Temperance", {-9964.05f, 579.87f, -4872.22f}, 1000694u},
    {"Core of Veneration", {-4031.86f, 556.32f, -5099.39f}, 1001476u},
};
