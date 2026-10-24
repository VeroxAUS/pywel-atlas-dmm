// Generated from data/constellation-links.json by prepare_constellation_links.py - do not edit by hand.
// Done = the save's mission list holds missionKey at state 5 (completed); another state = not
// done yet; no record = unknown (see NativeSaveReader.cpp).
#pragma once
struct ConstellationLink { const char* name; uint32_t uuid[4]; float position[3]; uint32_t missionKey; };
constexpr ConstellationLink kConstellationLinks[] = {
    {"Shield Constellation", {1274387186u, 3222802490u, 1302046029u, 0u}, {-8486.9f, 614.44f, -1735.61f}, 1001384u},
    {"Adventurer Constellation", {155956618u, 1591218237u, 2842022867u, 0u}, {-4794.33f, 395.76f, -4570.07f}, 1001385u},
    {"Wagon Constellation", {1530836982u, 3222802492u, 1302046029u, 0u}, {-12419.73f, 777.27f, -1168.91f}, 1001386u},
    {"Hammer Constellation", {2983628221u, 3222802492u, 1302046029u, 0u}, {-8847.99f, 712.12f, -1641.46f}, 1001387u},
    {"Woodland Spirit Owl Constellation", {2771255396u, 3222802492u, 1302046029u, 0u}, {-11433.1f, 738.16f, -96.26f}, 1001388u},
    {"Sealed Stone Constellation", {4074257353u, 4279242868u, 1920976608u, 0u}, {-11924.53f, 843.32f, -5039.44f}, 1001223u},
    {"Ship Constellation", {3934297283u, 4279242868u, 1920976608u, 0u}, {-5858.62f, 396.4f, -5629.2f}, 1001228u},
    {"Elephant Constellation", {3746664101u, 4279242868u, 1920976608u, 0u}, {-5523.95f, 552.44f, -4203.94f}, 1001391u},
    {"Camel Constellation", {4159773818u, 4279242868u, 1920976608u, 0u}, {-7731.07f, 696.4f, -90.95f}, 1001392u},
    {"Goblin Constellation", {4097320638u, 4279242868u, 1920976608u, 0u}, {-11948.69f, 752.69f, -1114.14f}, 1001393u},
    {"Black Dragon Constellation", {4060612110u, 4279242868u, 1920976608u, 0u}, {-9680.04f, 672.41f, -5861.06f}, 1001394u},
    {"Giant Constellation", {4124965489u, 4279242868u, 1920976608u, 0u}, {-7015.05f, 676.63f, -483.33f}, 1001395u},
    {"Key Constellation", {3891687786u, 4279242868u, 1920976608u, 0u}, {-6144.5f, 405.48f, -3456.46f}, 1001396u},
};
