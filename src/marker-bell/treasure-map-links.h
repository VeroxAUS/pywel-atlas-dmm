// Generated from data/treasure-map-links.json by prepare_treasure_map_links.py - do not edit by hand.
// Done = the save's knowledge list holds knowledgeKey at any level (picked up); no entry = not
// yet (see NativeSaveReader.cpp). solutionChest is the row of the chest it leads to in kChestLinks.
#pragma once
struct TreasureMapLink { const char* name; unsigned piece; uint32_t uuid[4]; float position[3];
    uint32_t knowledgeKey; unsigned solutionChest; };
constexpr TreasureMapLink kTreasureMapLinks[] = {
    {"Hidden Treasure Map Piece 1", 1u, {1334997714u, 3222802591u, 4221937741u, 0u}, {-9675.65f, 708.11f, -1894.18f}, 1000671u, 77u},
    {"Hidden Treasure Map Piece 2", 2u, {1564479720u, 3222802591u, 4221937741u, 0u}, {-9102.46f, 739.78f, -1884.36f}, 1000672u, 80u},
    {"Hidden Treasure Map Piece 3", 3u, {1364323871u, 3222802591u, 4221937741u, 0u}, {-9401.15f, 669.66f, -2549.6f}, 1000673u, 50u},
    {"Hidden Treasure Map Piece 4", 4u, {1541835521u, 3222802591u, 4221937741u, 0u}, {-9887.53f, 643.18f, 1080.66f}, 1000674u, 70u},
    {"Hidden Treasure Map Piece 5", 5u, {1399977340u, 3222802591u, 4221937741u, 0u}, {-6300.29f, 399.63f, -3274.2f}, 1000675u, 42u},
    {"Hidden Treasure Map Piece 6", 6u, {1419671968u, 3222802591u, 4221937741u, 0u}, {-8954.54f, 532.53f, -4665.07f}, 1001807u, 49u},
    {"Hidden Treasure Map Piece 7", 7u, {1471927761u, 3222802591u, 4221937741u, 0u}, {-10502.36f, 586.18f, -3934.92f}, 1001826u, 30u},
    {"Hidden Treasure Map Piece 8", 8u, {1489443766u, 3222802591u, 4221937741u, 0u}, {-10448.86f, 584.55f, -3531.28f}, 1001830u, 29u},
    {"Hidden Treasure Map Piece 9", 9u, {1505041530u, 3222802591u, 4221937741u, 0u}, {-11725.52f, 834.37f, 289.1f}, 1001885u, 110u},
    {"Hidden Treasure Map Piece 10", 10u, {1521078379u, 3222802591u, 4221937741u, 0u}, {-11344.81f, 812.03f, -3027.81f}, 1002097u, 5u},
    {"Hidden Treasure Map Piece 11", 11u, {1624925032u, 3222802591u, 4221937741u, 0u}, {-8509.63f, 549.03f, -2407.38f}, 1002099u, 120u},
    {"Hidden Treasure Map Piece 12", 12u, {1599366496u, 1450447277u, 1450142268u, 0u}, {-8622.33f, 541.46f, -2121.38f}, 1003575u, 158u},
};
