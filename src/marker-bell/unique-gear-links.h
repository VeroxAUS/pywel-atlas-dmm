// Generated from data/unique-gear-links.json by prepare_unique_gear_links.py - do not edit by hand.
// Collected (see NativeSaveReader.cpp): a reward item when the save's stage list holds stageKey at
// state 5 (completed); a ground or quest item when the save's field-object list has a record of its
// uuid (first 3 numbers) with reason 2 that never resets.
#pragma once
enum UniqueGearSource : uint8_t { kUniqueGearReward, kUniqueGearGround, kUniqueGearQuest };
struct UniqueGearLink {
    const char* name; uint32_t itemKey; UniqueGearSource source; float position[3];
    uint32_t stageKey; uint32_t uuid[3];
};
constexpr UniqueGearLink kUniqueGearLinks[] = {
    {"Golden Sword", 1001524u, kUniqueGearReward, {-11136.14f, 1810.75f, -6124.22f}, 1013256u, {0u, 0u, 0u}},
    {"Constellation Helm", 1000102u, kUniqueGearReward, {-11930.9f, 834.26f, -5031.4f}, 1004554u, {0u, 0u, 0u}},
    {"Plate Helm of the Shadows", 1000380u, kUniqueGearReward, {-12736.42f, 1034.5f, -2912.79f}, 1001072u, {0u, 0u, 0u}},
    {"Brimstone Gas Mask", 1000073u, kUniqueGearReward, {-8505.75f, 548.72f, -2399.74f}, 1004536u, {0u, 0u, 0u}},
    {"Circuit Hijacking Helm", 1000202u, kUniqueGearReward, {-11701.93f, 802.61f, -3848.49f}, 1004289u, {0u, 0u, 0u}},
    {"Helm of Ignition", 1000236u, kUniqueGearReward, {-10989.57f, 801.4f, -3541.91f}, 1004067u, {0u, 0u, 0u}},
    {"Helm of Knowledge", 1000037u, kUniqueGearReward, {-12033.74f, 892.29f, -4807.51f}, 1001068u, {0u, 0u, 0u}},
    {"Marni Laser Helm", 1001400u, kUniqueGearReward, {-4043.17f, 492.29f, -5829.0f}, 1005305u, {0u, 0u, 0u}},
    {"Health Detection Device", 1001236u, kUniqueGearReward, {-2996.1f, 460.45f, -4474.77f}, 1005301u, {0u, 0u, 0u}},
    {"Witters Plate Helm", 2101011u, kUniqueGearReward, {-10387.79f, 350.47f, -6458.28f}, 1001359u, {0u, 0u, 0u}},
    {"Drake Shield", 290021u, kUniqueGearReward, {-8958.73f, 622.11f, -2976.73f}, 1005297u, {0u, 0u, 0u}},
    {"Shotgun Shield", 1001305u, kUniqueGearReward, {-5785.89f, 634.28f, -470.38f}, 1005319u, {0u, 0u, 0u}},
    {"Runewalker Shield", 1000201u, kUniqueGearReward, {-12268.86f, 733.13f, -5241.1f}, 1004288u, {0u, 0u, 0u}},
    {"Shield of Ringing", 1000125u, kUniqueGearReward, {-8192.04f, 527.47f, -3223.13f}, 1005300u, {0u, 0u, 0u}},
    {"Gale Shield", 1001192u, kUniqueGearReward, {-5766.83f, 675.05f, -712.41f}, 1005334u, {0u, 0u, 0u}},
    {"Bismuth Spear", 1001251u, kUniqueGearReward, {-8020.28f, 670.47f, -641.43f}, 1005320u, {0u, 0u, 0u}},
    {"Thorn of Dark Pursuit", 310028u, kUniqueGearReward, {-7203.85f, 411.34f, -4250.56f}, 1005296u, {0u, 0u, 0u}},
    {"Disruptor Spear", 1001212u, kUniqueGearReward, {-6279.52f, 489.95f, -3887.49f}, 1005316u, {0u, 0u, 0u}},
    {"Flame Spear", 1000451u, kUniqueGearReward, {-10673.66f, 985.71f, 50.2f}, 1004567u, {0u, 0u, 0u}},
    {"Diverging Moon", 15706u, kUniqueGearReward, {-8580.05f, 532.09f, -3622.36f}, 1003841u, {0u, 0u, 0u}},
    {"Circling Moon", 15707u, kUniqueGearReward, {-6687.46f, 473.42f, -3052.48f}, 1000491u, {0u, 0u, 0u}},
    {"Grasping Moon", 15702u, kUniqueGearReward, {-8476.3f, 525.79f, -2947.73f}, 1005293u, {0u, 0u, 0u}},
    {"Frostfang", 15703u, kUniqueGearReward, {-10512.42f, 814.25f, -2135.79f}, 1004593u, {0u, 0u, 0u}},
    {"Lightning Spear", 1001163u, kUniqueGearReward, {-9496.45f, 642.94f, 952.77f}, 1004558u, {0u, 0u, 0u}},
    {"Soul Spear", 1001188u, kUniqueGearReward, {-12649.41f, 1006.59f, -3367.33f}, 1004585u, {0u, 0u, 0u}},
    {"Propeller Spear", 1001193u, kUniqueGearReward, {-3410.48f, 431.04f, -5820.24f}, 1005310u, {0u, 0u, 0u}},
    {"Acria Sword", 200919u, kUniqueGearReward, {-9418.09f, 642.79f, -1361.82f}, 1012807u, {0u, 0u, 0u}},
    {"Knightlord's Sword", 200052u, kUniqueGearReward, {-8623.66f, 540.54f, -2119.9f}, 1003426u, {0u, 0u, 0u}},
    {"Fated Shadow", 1000578u, kUniqueGearReward, {-7777.23f, 1974.71f, -479.61f}, 1004570u, {0u, 0u, 0u}},
    {"Spada Sword", 200917u, kUniqueGearReward, {-8990.59f, 612.79f, -2988.26f}, 1004590u, {0u, 0u, 0u}},
    {"Arben Greatsword", 1002104u, kUniqueGearGround, {-6321.72f, 386.27f, -3533.76f}, 0u, {435595741u, 4279243046u, 1126394848u}},
    {"Lubricant Sprayer", 1003751u, kUniqueGearQuest, {-5585.81f, 522.32f, -2570.79f}, 0u, {236054139u, 1450447245u, 2241251132u}},
    {"Myurdin's Ring", 1005406u, kUniqueGearQuest, {-10683.7f, 995.91f, 132.84f}, 0u, {1125284047u, 1450447582u, 912704316u}},
    {"Fertilizer Sprayer", 1003750u, kUniqueGearQuest, {-9975.07f, 709.43f, -2460.54f}, 0u, {2412099701u, 1450447271u, 1450142268u}},
    {"Mask of the Devil of the Reed Field", 1000234u, kUniqueGearQuest, {-11351.74f, 748.39f, -7015.59f}, 0u, {2022288997u, 4279242482u, 164962784u}},
    {"Dewhaven Shotgun", 370002u, kUniqueGearGround, {-5196.53f, 357.32f, -5408.07f}, 0u, {53885500u, 4279243046u, 1126394848u}},
    {"Shadow of the Past Pistol", 270011u, kUniqueGearGround, {-5509.14f, 671.03f, -890.49f}, 0u, {833343663u, 4279243046u, 1126394848u}},
    {"Serdin Greatsword", 1002102u, kUniqueGearGround, {-6163.77f, 427.6f, -3234.55f}, 0u, {426592877u, 4279243046u, 1126394848u}},
    {"Verak Greatsword", 1002106u, kUniqueGearGround, {-6531.22f, 445.04f, -3467.7f}, 0u, {454986251u, 4279243046u, 1126394848u}},
    {"Double-Headed Axe of Greed", 12600u, kUniqueGearGround, {-8820.19f, 351.5f, -6350.34f}, 0u, {2872452177u, 1591218771u, 1150148307u}},
    {"Kadel Mace", 220002u, kUniqueGearGround, {-11112.23f, 669.69f, 1302.32f}, 0u, {541695841u, 4279243084u, 1617652448u}},
    {"Bleed Shotgun", 370006u, kUniqueGearGround, {-11748.17f, 709.55f, -4119.01f}, 0u, {575696201u, 4279243046u, 1126394848u}},
    {"Hyde Crossbow", 320001u, kUniqueGearGround, {-12152.71f, 785.81f, -5258.08f}, 0u, {2251985241u, 352324874u, 489074269u}},
};
