'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "2a54bf1e99dc1985e4376d66bbd30fc7",
"assets/assets/audio/click.mp3": "b6827a87fd117cd6ac67f12e06f1485c",
"assets/assets/audio/eatting.mp3": "e3d15ec6bae959717fb52f14ee955179",
"assets/assets/audio/explosion.mp3": "a7c8aab06b4b0eae1e8d20a13d10f168",
"assets/assets/audio/lose.mp3": "36655a008d63063c62b74a1dad277592",
"assets/assets/audio/music.m4a": "3849ab79ce1d18496b47bc0c20a0a38f",
"assets/assets/audio/star1.mp3": "be399fc7468dfefa5dddedbaabaeb941",
"assets/assets/audio/star2.mp3": "84518e3cbf83de3d632433ef8f070f65",
"assets/assets/audio/star3.mp3": "c0b94e6788253cbdf9f35b2123177489",
"assets/assets/audio/swipe.mp3": "30e9cf17f2874aa955d16b793d759d3f",
"assets/assets/audio/win.m4a": "d4cbce44b2e3d5d262c3a0b0b0ae893f",
"assets/assets/font/font.ttf": "25a7a213c7215b479c86172604a49723",
"assets/assets/game.json": "9c5ef9d00436f49d5e95233802bd9109",
"assets/assets/images/background/background.png": "27770f2a1a48186bdddb721df55d1b9b",
"assets/assets/images/background/background_main.png": "582e9f255cf23b3ab267f9657fe3e1d5",
"assets/assets/images/background/bg_hidden.png": "eed2f23369dcfadb7fe4b0283f3fdf20",
"assets/assets/images/background/bg_ice.png": "cdd7999e831146bbc5e85255dcd0c0c8",
"assets/assets/images/background/bg_iron.png": "b242ebcf087d2a9b9f44f18206020f46",
"assets/assets/images/background/bg_liquid_cement.png": "907a0abd27c39f1d7d2fb148c8cda3f5",
"assets/assets/images/background/bg_mixture.png": "2375f3dafc52bc01bf4a0315043a9e8d",
"assets/assets/images/background/bg_space.png": "5ca0ef0a52283bc527af5bca13b35e08",
"assets/assets/images/background/bg_swipe.png": "e0e01f7c6fa93e9d1f33f192aeed6b20",
"assets/assets/images/background/bg_thorn_cement.png": "ded562f680c8e97e37fa1fe4ecc6079e",
"assets/assets/images/background/bg_tnt.png": "1e6d2ae3288789f82ad22e4d2a4a2dc4",
"assets/assets/images/background/bg_wood.png": "515d56fcc552300fe16774f2b88b4e89",
"assets/assets/images/background/dialog_background.png": "f5d8a315da05bcd723ac1936708b15df",
"assets/assets/images/box/blank.png": "3b2e434d78cbe2ff4949161886c2d8c8",
"assets/assets/images/box/candy_explosion1.png": "a6fa175acae18c72470f348606964b50",
"assets/assets/images/box/candy_explosion10.png": "24b31b2c9dcf2292c2a5e8d3ca5489e5",
"assets/assets/images/box/candy_explosion2.png": "76d6f3094942b2ba4662e68ef06102ff",
"assets/assets/images/box/candy_explosion3.png": "849500f2da8056d7c6fdc87e64972d09",
"assets/assets/images/box/candy_explosion4.png": "1a9d40955624bc963b296382b9b4f0fe",
"assets/assets/images/box/candy_explosion5.png": "aeef58ee886bc18f3cb06faf869d5cf2",
"assets/assets/images/box/candy_explosion6.png": "f47741e939b84effe988c43600b25492",
"assets/assets/images/box/candy_explosion7.png": "2408d29d5883779bc91a4d6168c33216",
"assets/assets/images/box/candy_explosion8.png": "30f1ae111554e3b0705c0938a936355d",
"assets/assets/images/box/candy_explosion9.png": "126eeedb2c32127978a7eb2a9d26fd2f",
"assets/assets/images/box/cement.png": "45dd908a55fa412e9c3546801344d38c",
"assets/assets/images/box/disapear1.png": "0351561f7dcab24494dbb0de6f971c05",
"assets/assets/images/box/disapear2.png": "629bdc2625c5f38f421ac49971589f62",
"assets/assets/images/box/disapear3.png": "35ae7e8fb045d764728660fbe464c718",
"assets/assets/images/box/hiddenbomd.png": "b74a4d04498e4d0418a6ff6080bbcb16",
"assets/assets/images/box/hiddenbomd_1.png": "478ffcd4d87070ffbe3bab0276d4002d",
"assets/assets/images/box/hidden_explosion1.png": "a5930d902310749fd954cb99550ae018",
"assets/assets/images/box/hidden_explosion2.png": "fbf004ee26dd98e4fbd60c6a125a72de",
"assets/assets/images/box/hidden_explosion3.png": "f385b848ecd2bb0d04d8d9c88867b633",
"assets/assets/images/box/hidden_explosion4.png": "940b4a51475936b8de61af2996a12db6",
"assets/assets/images/box/hidden_explosion5.png": "c825828fc00ed52bbfebc56c3c930cb7",
"assets/assets/images/box/hidden_explosion6.png": "b289d39dbbbb7869d8c0a97f86de305b",
"assets/assets/images/box/hidden_explosion7.png": "e70dbddfb43294a81b71cb8590ca8ab2",
"assets/assets/images/box/hidden_explosion8.png": "86a0c19eabb360d8dc8ddb01531fc856",
"assets/assets/images/box/hidden_explosion9.png": "19298d64ce141397d5511f61b8d57a9c",
"assets/assets/images/box/icebox1.png": "8b742b99637b3cffb55500e857754bc2",
"assets/assets/images/box/icebox2.png": "24bf4a780600a2af048cda37eeec5c5f",
"assets/assets/images/box/icebox3.png": "772d3d0279071e1665f76e633dcecbf9",
"assets/assets/images/box/icebox4.png": "98c5bb3805e1851331346a634414dc10",
"assets/assets/images/box/icebreak1.png": "e1478be5a7b0b9e131f9c21da37bacad",
"assets/assets/images/box/icebreak2.png": "27a889b2990b750609f1bdd3920b7086",
"assets/assets/images/box/icebreak3.png": "f96f2705305127104e5674f3275a986c",
"assets/assets/images/box/icebreak4.png": "ac67a3ce581af50045f2a614813ada5b",
"assets/assets/images/box/icebreak5.png": "487dbe9d54fc938db5b83588fc0d27cb",
"assets/assets/images/box/icebreak6.png": "6c8de5183aba080ebedf836356874a32",
"assets/assets/images/box/icebreak7.png": "719c8b571caa64b1809a3763f5c0654c",
"assets/assets/images/box/icebreak8.png": "3d64543fd75892b252916166c6ef6f50",
"assets/assets/images/box/icebreak9.png": "21e531a4f05db19d3b98155f1c9a2271",
"assets/assets/images/box/icestar.png": "551ca0a614b622880cea0e47d88cd7d6",
"assets/assets/images/box/icestar1.png": "ee29fe8fceca80a91cd54f4eb5e86645",
"assets/assets/images/box/ironbox.png": "067825b4f5d716a6f30c4cb6363584f1",
"assets/assets/images/box/liquidcement.png": "d9b3ea92740faae2b0f3bcdb9c9e369e",
"assets/assets/images/box/space_blue_1.png": "69e843f15490b9a13767ce7fc1a6e330",
"assets/assets/images/box/space_blue_2.png": "ddb214f898478ced06d23ef38a1d33e0",
"assets/assets/images/box/space_blue_3.png": "a263c8b0b95a93d02bbedf2173ead9b9",
"assets/assets/images/box/space_blue_4.png": "43ae8fb9f18da2ef7d142c9ae3dea67a",
"assets/assets/images/box/space_blue_5.png": "d76c65c667ea69ed29c4becb8868f207",
"assets/assets/images/box/space_blue_6.png": "504a9dcd2a05034da97024aed821b64c",
"assets/assets/images/box/space_blue_7.png": "c3b2aae90296a6980e247e80ee7e660b",
"assets/assets/images/box/space_blue_8.png": "e7f61ccae3a23b1075ef7e2a14ad4092",
"assets/assets/images/box/space_red_1.png": "ec05fa402b3eb1df7a1f4149516dcf89",
"assets/assets/images/box/space_red_2.png": "009b82abfdeb7829a8a17abb9240b3f7",
"assets/assets/images/box/space_red_3.png": "0259d9ad4de736f541e2e6fb920e0d72",
"assets/assets/images/box/space_red_4.png": "155bb4235c7b522ababd7e675ddfce40",
"assets/assets/images/box/space_red_5.png": "6ff88493cfb9486209371b9849ce9751",
"assets/assets/images/box/space_red_6.png": "96e757c63a26481150c991728a785cf1",
"assets/assets/images/box/space_red_7.png": "c63f3c56346960b59243c304cf4bfcac",
"assets/assets/images/box/space_red_8.png": "3b3a9b7720d6376b3e7dff0057b86f4a",
"assets/assets/images/box/swipebox.png": "cb8a5721e6ff87c82050c8b5b12a0cb4",
"assets/assets/images/box/swipebox_bottom.png": "e01caae1002f65d9969cabd5aea64b5d",
"assets/assets/images/box/swipebox_end.png": "4ef3272862723dc1f0c65b3e0a350a3c",
"assets/assets/images/box/swipebox_start.png": "00912e9fde227114c54deec8392d6534",
"assets/assets/images/box/swipebox_top.png": "1fcedf2568f7fc907ad98519f17f1002",
"assets/assets/images/box/thornbox.png": "a5f639a03cc4599ce70bc2cd9e9e4410",
"assets/assets/images/box/thornciment1.png": "186e43c8da5eab1435bba4314fbfe3f4",
"assets/assets/images/box/thornciment2.png": "dbf4c027bd8a0220d84e8ba0d1ce1da2",
"assets/assets/images/box/thornciment3.png": "ff315f8490a8c688a2b03b4f9b4aa9ac",
"assets/assets/images/box/thornciment4.png": "f0469fe3bce28299ad9a803b1ca81ce4",
"assets/assets/images/box/thornciment5.png": "e01ff7bc1f90c4c4c561bc3e9096891e",
"assets/assets/images/box/thornciment6.png": "d7994faca905770cad3e41f6a4847b0b",
"assets/assets/images/box/thornciment7.png": "23d7e0db1b8943b0d758731ab38a0a3b",
"assets/assets/images/box/thornciment8.png": "565e2d210f416d4bb14207289e05c2a6",
"assets/assets/images/box/thornciment9.png": "ef88fff3b9c6c89e70c000c026349127",
"assets/assets/images/box/thorncimentn1.png": "d456107b6e2096dc676550fca182eed8",
"assets/assets/images/box/thornciment_n.png": "8b4f6be69fb33187f726daf41650c304",
"assets/assets/images/box/tntbox.png": "a53c9da228e692e797ef5eaa6f4d79b3",
"assets/assets/images/box/woodbox.png": "7a550deadb1ab1247d47305dfc35a989",
"assets/assets/images/button/btncirclestyle.png": "844a457fc26ef005cea44afba3a05870",
"assets/assets/images/button/btnstyle.png": "93c599cf622ed94177563fc0e518ac3b",
"assets/assets/images/button/btnstylenext.png": "bf4fe49f101cc3f1f6ccec914852eb1a",
"assets/assets/images/candy/candy0.png": "15efcf9df8e350776e74348fba582dae",
"assets/assets/images/candy/candy1.png": "96ed479133e911d8c4a16fc9269094c4",
"assets/assets/images/candy/candy10.png": "0d132d8095a7ec031f3229e2bfd300d1",
"assets/assets/images/candy/candy11.png": "0015a39e636e0e2ba42dde3b21b9e101",
"assets/assets/images/candy/candy2.png": "051a9b5ff4373392cce1400bd10405b3",
"assets/assets/images/candy/candy3.png": "6aa060756284ce82ae8a588ba6531c04",
"assets/assets/images/candy/candy4.png": "67d7d2d552176eb3610039fed5e5fc09",
"assets/assets/images/candy/candy5.png": "09dd48d87eb2991f0ab91189a51c5fb5",
"assets/assets/images/candy/candy6.png": "a3ff240dda6af6564d74414b123ff6d3",
"assets/assets/images/candy/candy7.png": "7a25aaa01c1f8e6d89a52f68a69f2e68",
"assets/assets/images/candy/candy8.png": "9df572c7e7033d86623753ba39a67be3",
"assets/assets/images/candy/candy9.png": "c7d53731d0d9769b4e008023f769bd38",
"assets/assets/images/icon/ic_arrow_left.png": "aba1c3b68e3b4b905126d0c6e1d109d6",
"assets/assets/images/icon/ic_arrow_right.png": "8939804df6e095a4a61d60f59dd3490f",
"assets/assets/images/icon/ic_back.png": "87ee29376f655af2c8f093cb25c76139",
"assets/assets/images/icon/ic_back2.png": "82c9896d21025cacf226febdb526c3fe",
"assets/assets/images/icon/ic_change_candy.png": "4eecb884cda3aabd3a301464bf482dff",
"assets/assets/images/icon/ic_change_pig.png": "b495b94a983ad07b77d8f351ca3c6cb6",
"assets/assets/images/icon/ic_handle.png": "501167494ac6fe65c4f1c8ef1fdb08a5",
"assets/assets/images/icon/ic_help.png": "304eefaffd9854ef09f9b9338983bb59",
"assets/assets/images/icon/ic_lock.png": "194b56783bc0d08a81bb409c58dd686a",
"assets/assets/images/icon/ic_pause.png": "a55f32d189b76ffcd7b591e9dbf831f2",
"assets/assets/images/icon/ic_star.png": "f8462af38800695425097642275d46d1",
"assets/assets/images/icon/ic_star_1.png": "5a7fbe3a238033365a7399d0a0ca9aa5",
"assets/assets/images/icon/ic_star_2.png": "429814b3d6550bacc98ba943366678ad",
"assets/assets/images/icon/ic_star_3.png": "3c3b92a519fd94d4ae00b5c1eadc4bf0",
"assets/assets/images/icon/ic_star_4.png": "a251e0df74e5217a959573d10f56f1f4",
"assets/assets/images/icon/ic_star_5.png": "802701c6cffe95185165a1fde05768f2",
"assets/assets/images/icon/ic_star_lose.png": "cf043a12f7d05cb3b0a5594df0a4a89f",
"assets/assets/images/icon/ic_star_point_0.png": "cc3a4838b52f7a342414cbde5ca7f334",
"assets/assets/images/icon/ic_star_point_1.png": "c353f7e22d39a71d2e00facaecd7bc9b",
"assets/assets/images/icon/ic_star_point_2.png": "1be70970b3d5fea460b738a5821eb615",
"assets/assets/images/icon/ic_star_point_3.png": "6426adbf922033ec498cba6029650e34",
"assets/assets/images/icon/ic_tutorial.png": "7d02b63cbc85022184f5e5d50d9ed0ef",
"assets/assets/images/map_icon/ic_box.png": "1c58505d6634b293241af9d2b8f203e4",
"assets/assets/images/map_icon/ic_ciment.png": "662d97b4631e92872c52e663e6658732",
"assets/assets/images/map_icon/ic_hidden_bomb.png": "ff00cfaa43b123683a0b39ebe854b9b9",
"assets/assets/images/map_icon/ic_ice.png": "e8d485170f9d2459e64012242cc07430",
"assets/assets/images/map_icon/ic_iron.png": "f9143adefe83b0160717dd4fd81786ad",
"assets/assets/images/map_icon/ic_mixture.png": "ca721cbdf512f895c3c9232ebf7cdc6a",
"assets/assets/images/map_icon/ic_space.png": "83a132e98bcff41d2f408a504c155242",
"assets/assets/images/map_icon/ic_swipe.png": "59fc46e21ca6456505a1be034e8a942c",
"assets/assets/images/map_icon/ic_thorn_ciment.png": "efd9bce285955e85fc31187fad730666",
"assets/assets/images/map_icon/ic_tnt.png": "5a089c685c11b15aa51340374ed18d03",
"assets/assets/images/map_icon/ic_wood.png": "cb28abc4e54d800a076309ca6da6c8e2",
"assets/assets/images/pigs/pig0_eat1.png": "a788851a4d24d70189f99d2df537f465",
"assets/assets/images/pigs/pig0_eat2.png": "41c779deb46a2569f4d7ab59452e2476",
"assets/assets/images/pigs/pig0_eat3.png": "05b8d383aa2a33eec6b4728d0a613a06",
"assets/assets/images/pigs/pig0_eat4.png": "443f9d819583ed2e5ccf7f9a13316a99",
"assets/assets/images/pigs/pig0_eat5.png": "edb47f9a9ea7bc07bb853b02bd1cc5ab",
"assets/assets/images/pigs/pig0_eat6.png": "4edac14c57ee4b4e562572ca7c59f5ee",
"assets/assets/images/pigs/pig0_eat7.png": "aad001309c3b896b8be6b0e1755aa96f",
"assets/assets/images/pigs/pig0_eat8.png": "b5761dc5ebe5b55519b2c16aff820f14",
"assets/assets/images/pigs/pig0_eat9.png": "b4b0b1efcc0869c48762ffb22c7760c3",
"assets/assets/images/pigs/pig0_sad1.png": "40d9f04038541c0cb5ada0169496dd1d",
"assets/assets/images/pigs/pig0_sad2.png": "297a90f80e7486fb6b7a379595035e93",
"assets/assets/images/pigs/pig0_sad3.png": "50875464dcb812f855d6196e7fc544ce",
"assets/assets/images/pigs/pig0_sad4.png": "aeff4f947e2c6881169421611b40f9c3",
"assets/assets/images/pigs/pig0_sad5.png": "27b11844f301eb8eec1f5df43bb1cea5",
"assets/assets/images/pigs/pig0_sad6.png": "8a8cda5225d4734cb9717847f9ffd9df",
"assets/assets/images/pigs/pig0_stand1.png": "93e3a6ffd3d3a83ceb1bb9df7912580a",
"assets/assets/images/pigs/pig0_stand2.png": "36a33ad917a419c5f61c35dad7f7bd1d",
"assets/assets/images/pigs/pig0_stand3.png": "4c0e0e3a8a603577896e1e67b0dbef40",
"assets/assets/images/pigs/pig0_stand4.png": "2ae36daa572378094118995e152ad1a9",
"assets/assets/images/pigs/pig0_stand5.png": "1e4512cd39ffd687f688d261efeffae0",
"assets/assets/images/pigs/pig10_eat1.png": "726d7c8f0fcf965ccd7365e6aff1d9f0",
"assets/assets/images/pigs/pig10_eat10.png": "791a6a8661bade797946e34866f0a3d2",
"assets/assets/images/pigs/pig10_eat2.png": "0e6db07152d3071b41bb68f4ac6e4e02",
"assets/assets/images/pigs/pig10_eat3.png": "d8c45ace188b2ccd33873e6dc3f36008",
"assets/assets/images/pigs/pig10_eat4.png": "1155067d4fd7a67494d1c90d81574268",
"assets/assets/images/pigs/pig10_eat5.png": "52ad856d546405bf0139da2220a742e2",
"assets/assets/images/pigs/pig10_eat7.png": "e7809ceeadcb60b0d9ec7b100aeb2372",
"assets/assets/images/pigs/pig10_eat8.png": "3002dfccd222bee35b1589e40f033143",
"assets/assets/images/pigs/pig10_eat9.png": "2ec699b07221bab4866d2e50da2c7cc6",
"assets/assets/images/pigs/pig10_sad1.png": "cde1c4b89ca6bc6aa548c89d06d63ab6",
"assets/assets/images/pigs/pig10_sad2.png": "7df55a3a3cd3ce92cdaa726ce7faddb6",
"assets/assets/images/pigs/pig10_sad3.png": "49bbc66bc7e3202e396f3ca7e1db419f",
"assets/assets/images/pigs/pig10_sad4.png": "49bbc66bc7e3202e396f3ca7e1db419f",
"assets/assets/images/pigs/pig10_sad5.png": "099c5460aee7b1a9f192c57f2e448f69",
"assets/assets/images/pigs/pig10_sad6.png": "e2d9013dd17a929e3e7b9e745e365471",
"assets/assets/images/pigs/pig10_stand1.png": "16de8efe75c1c71a03cde91c1eb39e0f",
"assets/assets/images/pigs/pig10_stand2.png": "c441ad164f4b072b3df3574fccaf2659",
"assets/assets/images/pigs/pig10_stand3.png": "98e3bf1584302474580e17d0af424f4d",
"assets/assets/images/pigs/pig10_stand4.png": "f7b90e04c202ef45e6c9af5351e915fc",
"assets/assets/images/pigs/pig10_stand5.png": "7b73a9c8af8f798222934215a03e15a4",
"assets/assets/images/pigs/pig11_eat1.png": "6f5979354e3fca8a61d00ee4814cf2b0",
"assets/assets/images/pigs/pig11_eat10.png": "93c4ea4dbc7ee7ad8cfbde3757dcbe77",
"assets/assets/images/pigs/pig11_eat2.png": "a205d0a26e79c13be038cf89304bd702",
"assets/assets/images/pigs/pig11_eat3.png": "d51c8b6fd78ef6b0636f55df8f62640a",
"assets/assets/images/pigs/pig11_eat4.png": "95d15db8e932155cc04d2f894fb138d4",
"assets/assets/images/pigs/pig11_eat5.png": "087f686ce1c4f9a099c8941d8b3efb4d",
"assets/assets/images/pigs/pig11_eat7.png": "6d567c7f3bc9eb7120d0fe403288c9d0",
"assets/assets/images/pigs/pig11_eat8.png": "8591fc276d5446aaefe1669494afc3cd",
"assets/assets/images/pigs/pig11_eat9.png": "ac648e70d4a90bbc95e04c6032a89199",
"assets/assets/images/pigs/pig11_sad1.png": "83ebebb904afa9e7a9685c3c29d67bb6",
"assets/assets/images/pigs/pig11_sad2.png": "50162a377ad0afc8775e5ef435901e21",
"assets/assets/images/pigs/pig11_sad3.png": "600957c2cfa5dd74eeafdd72f85efb72",
"assets/assets/images/pigs/pig11_sad4.png": "600957c2cfa5dd74eeafdd72f85efb72",
"assets/assets/images/pigs/pig11_sad5.png": "978720e80f7b0859e9a4536ababcf830",
"assets/assets/images/pigs/pig11_sad6.png": "b50f5412759404d759af6411f1f4baf2",
"assets/assets/images/pigs/pig11_stand1.png": "8f92b0e4a7ed8bb291fb54f521824010",
"assets/assets/images/pigs/pig11_stand2.png": "a7e857e7e4ac5fe1ba543ec86d358e25",
"assets/assets/images/pigs/pig11_stand3.png": "7be7f1271e564e8d8abd20592502e863",
"assets/assets/images/pigs/pig11_stand4.png": "ce372d30afacccb0075a7dc8407984eb",
"assets/assets/images/pigs/pig11_stand5.png": "ce44c6ea98dca33211178feb254dc400",
"assets/assets/images/pigs/pig12_eat1.png": "20d21847decdf66a7d07c641f3cd346e",
"assets/assets/images/pigs/pig12_eat10.png": "47466e04af558142bc2f426882cfd6cf",
"assets/assets/images/pigs/pig12_eat2.png": "9dbc707bd6931f714465b25b46b944d4",
"assets/assets/images/pigs/pig12_eat3.png": "5dd0369603da941cfd20b6e46b5e68b2",
"assets/assets/images/pigs/pig12_eat4.png": "f5de29820f732dbf5266bb68e1b44d9b",
"assets/assets/images/pigs/pig12_eat5.png": "080a9531422963f319394c2ccd87bf83",
"assets/assets/images/pigs/pig12_eat7.png": "8c199ad9741cc329a0e9af80ad9b08d9",
"assets/assets/images/pigs/pig12_eat8.png": "8abccac2d13eea08981ae54cf9072b76",
"assets/assets/images/pigs/pig12_eat9.png": "556e13ab8ee2439ed80cb8009e0a88e9",
"assets/assets/images/pigs/pig12_sad1.png": "4b1f28a0606df829cbff9fea0392e3f2",
"assets/assets/images/pigs/pig12_sad2.png": "8da1c1a168fed9eea4ef907aec270233",
"assets/assets/images/pigs/pig12_sad3.png": "bd62b7ebc16a65aca753c6ba293bf45a",
"assets/assets/images/pigs/pig12_sad4.png": "bd62b7ebc16a65aca753c6ba293bf45a",
"assets/assets/images/pigs/pig12_sad5.png": "de07e9c54ce59fee3d2455ad3fe4691b",
"assets/assets/images/pigs/pig12_sad6.png": "5fb46d2307fb8f5f552139451602bfad",
"assets/assets/images/pigs/pig12_stand1.png": "9d19d1270b64ca8509b69ba67176e065",
"assets/assets/images/pigs/pig12_stand2.png": "0f6b92e6a97e4954ca1e3a81f832a2d0",
"assets/assets/images/pigs/pig12_stand3.png": "c40388d4d883c81646d17cf61e357019",
"assets/assets/images/pigs/pig12_stand4.png": "615c5694fecb71a25970db419f9e1953",
"assets/assets/images/pigs/pig12_stand5.png": "eb6f5429e74c0255de92102fea0cfdb0",
"assets/assets/images/pigs/pig1_eat1.png": "168dc0333999aa8a15f0f9a898df8063",
"assets/assets/images/pigs/pig1_eat10.png": "685edec50bcf5e0c15212a364f966bf0",
"assets/assets/images/pigs/pig1_eat2.png": "ede2703f45cc093a0614b846030a9613",
"assets/assets/images/pigs/pig1_eat3.png": "bd0acfef81962fda3bedff0940a85eaa",
"assets/assets/images/pigs/pig1_eat4.png": "2c695b60acf7ef8d0973ef10be25044a",
"assets/assets/images/pigs/pig1_eat5.png": "072e98293c7153eb68a83976dc9e7f3c",
"assets/assets/images/pigs/pig1_eat7.png": "0cc55f740507e91c8c6ca529f3b6870a",
"assets/assets/images/pigs/pig1_eat8.png": "9d9e48f66de1b680a2587abf7a3a8c61",
"assets/assets/images/pigs/pig1_eat9.png": "fda26a39c70fc1b7543bdee3c0f796d1",
"assets/assets/images/pigs/pig1_sad1.png": "e991732adab2a8e8452d2e09a868b144",
"assets/assets/images/pigs/pig1_sad2.png": "5297ac46dae90e3ec69d0378d10fad21",
"assets/assets/images/pigs/pig1_sad3.png": "a1a9397c078f09df5193855b5107d924",
"assets/assets/images/pigs/pig1_sad4.png": "a1a9397c078f09df5193855b5107d924",
"assets/assets/images/pigs/pig1_sad5.png": "e7ba4b1d921f7cf98a67cf5ab35541a1",
"assets/assets/images/pigs/pig1_sad6.png": "4e28eb0e4495340002e742b6ae1918ed",
"assets/assets/images/pigs/pig1_stand1.png": "b46941a9090447b3927f0a361070a853",
"assets/assets/images/pigs/pig1_stand2.png": "9bcff69aa93f9981806fe53431a23aa2",
"assets/assets/images/pigs/pig1_stand3.png": "5189fa1c4316d9e78377e4c154c79a4b",
"assets/assets/images/pigs/pig1_stand4.png": "fd94c58079d5ac920f3c88371374aaa4",
"assets/assets/images/pigs/pig1_stand5.png": "9677439f6922fe330694aeb5384512bf",
"assets/assets/images/pigs/pig2_eat1.png": "afbf59a079ad5554196c349fe4d8832f",
"assets/assets/images/pigs/pig2_eat10.png": "3d826ab920a99f08e7123b7b36b8a943",
"assets/assets/images/pigs/pig2_eat2.png": "4dea7d88851b625d64df13d83ecd6e3e",
"assets/assets/images/pigs/pig2_eat3.png": "d82cf991f364c8541a95e15c5dc2326f",
"assets/assets/images/pigs/pig2_eat4.png": "70907be41aad39aa800e41f1be4b2462",
"assets/assets/images/pigs/pig2_eat5.png": "87652f19b68e6173b3aa513d434e81a3",
"assets/assets/images/pigs/pig2_eat7.png": "50473aa1479b00ca030cb57dd384aee7",
"assets/assets/images/pigs/pig2_eat8.png": "17176c032266e196c711c11cfcb22667",
"assets/assets/images/pigs/pig2_eat9.png": "b786c6394f3789effab9f12d4d0c377c",
"assets/assets/images/pigs/pig2_sad1.png": "2e802b6cf50f8266457e648c6d05a0c5",
"assets/assets/images/pigs/pig2_sad2.png": "b343a1291e64dd38d57467fd12e5ae81",
"assets/assets/images/pigs/pig2_sad3.png": "c1e8afdfd7d8e68d0e5d16290f129d5e",
"assets/assets/images/pigs/pig2_sad4.png": "c1e8afdfd7d8e68d0e5d16290f129d5e",
"assets/assets/images/pigs/pig2_sad5.png": "1493455117decaec8c08c71b13453f83",
"assets/assets/images/pigs/pig2_sad6.png": "019267dd3f736d0871a9c6a6ae43b020",
"assets/assets/images/pigs/pig2_stand1.png": "ff3da6a611cf7ee340e218e7fffa4322",
"assets/assets/images/pigs/pig2_stand2.png": "6f0c8d4f14d041cec6564b82bbd4173e",
"assets/assets/images/pigs/pig2_stand3.png": "6c76e7c865f3d7db0ea5b39c0f9ff790",
"assets/assets/images/pigs/pig2_stand4.png": "046496c8ca4a902c4db0eaaf2de7aa60",
"assets/assets/images/pigs/pig2_stand5.png": "8e9adf8c37b9e135580370798b366c47",
"assets/assets/images/pigs/pig3_eat1.png": "5d281957b1a4af92b8fc91d379eb5669",
"assets/assets/images/pigs/pig3_eat10.png": "d827c68239139d47802ce8519efba745",
"assets/assets/images/pigs/pig3_eat2.png": "f7362f6e3a60acd6797a6ddd908c9209",
"assets/assets/images/pigs/pig3_eat3.png": "5cfe95cdf3cef6f51fba293ecf65c0b9",
"assets/assets/images/pigs/pig3_eat4.png": "e6e3a9fe63b3b73a92ba00d06c28cd41",
"assets/assets/images/pigs/pig3_eat5.png": "bfa1b277a500cd9be4c7203ca8188b5c",
"assets/assets/images/pigs/pig3_eat7.png": "2eafbb016e19c06142231875cb467fde",
"assets/assets/images/pigs/pig3_eat8.png": "bad1c07e6dc9b15dd3bf732bc8bf1cd2",
"assets/assets/images/pigs/pig3_eat9.png": "cdeeeb1aa1695aadc3bb46c0953ae6dc",
"assets/assets/images/pigs/pig3_sad1.png": "4fd158fdd37a8775ba9984bcfcfa6692",
"assets/assets/images/pigs/pig3_sad2.png": "11c7839fa787557d7deed5e8a9d7df3c",
"assets/assets/images/pigs/pig3_sad3.png": "bb16209ff444ba86483d87f8775823f9",
"assets/assets/images/pigs/pig3_sad4.png": "bb16209ff444ba86483d87f8775823f9",
"assets/assets/images/pigs/pig3_sad5.png": "73dcbbf5b732b9275fe516251e30479f",
"assets/assets/images/pigs/pig3_sad6.png": "1018079af7c609f86921b770706ffebc",
"assets/assets/images/pigs/pig3_stand1.png": "e303193e523014ffe80ae6f829375136",
"assets/assets/images/pigs/pig3_stand2.png": "e4e838c053fc5a6cb7075afe4f9fd057",
"assets/assets/images/pigs/pig3_stand3.png": "c45f4a644b9e3baa3adf2f794217aa2b",
"assets/assets/images/pigs/pig3_stand4.png": "b3f91f4fb6666a0dbb4c4524eee4e921",
"assets/assets/images/pigs/pig3_stand5.png": "fe5a8864430e56ed210d4d4a1a04118b",
"assets/assets/images/pigs/pig4_eat1.png": "2a49391dc3b7468fb09d5b689059074e",
"assets/assets/images/pigs/pig4_eat10.png": "1251df8877d2a9a430ca755b72eb35f1",
"assets/assets/images/pigs/pig4_eat2.png": "0f89f09f890154ab6076de88ef257673",
"assets/assets/images/pigs/pig4_eat3.png": "6183c3eaa4b4f4ecba91a2cf44297fc1",
"assets/assets/images/pigs/pig4_eat4.png": "e6fe7578ec983c0cb9cc0ecceb94ab31",
"assets/assets/images/pigs/pig4_eat5.png": "112c2d19712aeb5ce9e8f31c2d322835",
"assets/assets/images/pigs/pig4_eat7.png": "05ec4dd326da95d41e5e74a76658b648",
"assets/assets/images/pigs/pig4_eat8.png": "ab387458b72a37a0b74beffc25107d57",
"assets/assets/images/pigs/pig4_eat9.png": "4ce58af21d9066e5fcd8107432660c9c",
"assets/assets/images/pigs/pig4_sad1.png": "dd25b65096362bd2efa314262dda8142",
"assets/assets/images/pigs/pig4_sad2.png": "3bfa3bd1f34657d917a685405c1f4fd1",
"assets/assets/images/pigs/pig4_sad3.png": "d31920f53fd65060f3c14d361f4458ed",
"assets/assets/images/pigs/pig4_sad4.png": "d31920f53fd65060f3c14d361f4458ed",
"assets/assets/images/pigs/pig4_sad5.png": "9717419dc576807b62f220cec6029296",
"assets/assets/images/pigs/pig4_sad6.png": "e8b03979917f4c0f5af0b6d41c5cee9c",
"assets/assets/images/pigs/pig4_stand1.png": "e834124b38c75945c4fa9f47666d2d39",
"assets/assets/images/pigs/pig4_stand2.png": "6e84f2cd179e74973562a4305531734b",
"assets/assets/images/pigs/pig4_stand3.png": "9fa2b12aa0ddc1a173c70cb5eb8f7c40",
"assets/assets/images/pigs/pig4_stand4.png": "ce8967ea095e9a7a9e856531b826f6b2",
"assets/assets/images/pigs/pig4_stand5.png": "2293e1923976238c1bfd488582373f88",
"assets/assets/images/pigs/pig5_eat1.png": "ba333044a146c8bfa3ecc293b283af1a",
"assets/assets/images/pigs/pig5_eat10.png": "2d1d95debf02aea62243a82552cd6876",
"assets/assets/images/pigs/pig5_eat2.png": "c67743b30da9547f4b9d88beafdbe8de",
"assets/assets/images/pigs/pig5_eat3.png": "f13f78de91b30561365028af13fd6937",
"assets/assets/images/pigs/pig5_eat4.png": "654a2a4432488089976370ac821a4595",
"assets/assets/images/pigs/pig5_eat5.png": "067ff6f662a299260c81c3e5a6e8df01",
"assets/assets/images/pigs/pig5_eat7.png": "7c989d5dc685a0106bf0510c65ef7d12",
"assets/assets/images/pigs/pig5_eat8.png": "e8fd7cbff2bc493a9051856cf877a10d",
"assets/assets/images/pigs/pig5_eat9.png": "d9c9051baaecde1ce2816325eea22aba",
"assets/assets/images/pigs/pig5_sad1.png": "112dfba524fe1566eeb1769ec3f16083",
"assets/assets/images/pigs/pig5_sad2.png": "f4ed05f4ad2a8b8d968f6b921ddbc710",
"assets/assets/images/pigs/pig5_sad3.png": "1b9f5fec915a335b92d741575c4a07a0",
"assets/assets/images/pigs/pig5_sad4.png": "eebd762d39c87379350c31a436c77410",
"assets/assets/images/pigs/pig5_sad5.png": "056bf10aa0525fd657974c8925ab0367",
"assets/assets/images/pigs/pig5_sad6.png": "b6f0e99184467ab7c93d6e0c3bf710d3",
"assets/assets/images/pigs/pig5_stand1.png": "3ad0eafe2bda86f956c0a0999b095769",
"assets/assets/images/pigs/pig5_stand2.png": "37f973fde1377bc3eddeca0a0d15622e",
"assets/assets/images/pigs/pig5_stand3.png": "5b6a80e815cf5c4ba80624c2d302d951",
"assets/assets/images/pigs/pig5_stand4.png": "5f4edd46afd7b750c45a77f161681898",
"assets/assets/images/pigs/pig5_stand5.png": "c655dbb82e7f429cd3115de7e6feed40",
"assets/assets/images/pigs/pig6_eat1.png": "b1e83eaac2a22fbb923abd873591e458",
"assets/assets/images/pigs/pig6_eat10.png": "f029b5e9252cf332b4e4da928fe5d8c8",
"assets/assets/images/pigs/pig6_eat2.png": "e4b98dd46b9af72c8ec970430e5e2112",
"assets/assets/images/pigs/pig6_eat3.png": "e1ce1857dce3bfc5d2fef66b065013cf",
"assets/assets/images/pigs/pig6_eat4.png": "ac13311d9f2755d79c8c879a22a694f0",
"assets/assets/images/pigs/pig6_eat5.png": "0beb4efde01ad26310a1bf8b61ccecfe",
"assets/assets/images/pigs/pig6_eat7.png": "663588f98ec22931d741b2cabac4f4f6",
"assets/assets/images/pigs/pig6_eat8.png": "f980728e18a51848ad38fa54dbb921a1",
"assets/assets/images/pigs/pig6_eat9.png": "b4fea3b479041170f07823b8fa77fe9a",
"assets/assets/images/pigs/pig6_sad1.png": "ce14606cf519336a8834198452065336",
"assets/assets/images/pigs/pig6_sad2.png": "409a662b32e79b8272ed172d7a7d76f4",
"assets/assets/images/pigs/pig6_sad3.png": "65a860605f7360b5a9f8e91b429070d5",
"assets/assets/images/pigs/pig6_sad4.png": "65a860605f7360b5a9f8e91b429070d5",
"assets/assets/images/pigs/pig6_sad5.png": "3497c73d19e717e2eb36fb128c0a3941",
"assets/assets/images/pigs/pig6_sad6.png": "6a5f938e2918ec2dd70550158320e040",
"assets/assets/images/pigs/pig6_stand1.png": "fa295ee1176e83d9ec124c1162a74d9a",
"assets/assets/images/pigs/pig6_stand2.png": "0bfd22ba80ade0ad59190b0a9c28c3e8",
"assets/assets/images/pigs/pig6_stand3.png": "40b70c1fb6693d8c7f9b654d8d14caae",
"assets/assets/images/pigs/pig6_stand4.png": "b62c8ef92ec81d155215df16402e1324",
"assets/assets/images/pigs/pig6_stand5.png": "f3469a1955bef0648ba7e003380fc844",
"assets/assets/images/pigs/pig7_eat1.png": "8a5b2d0f96580eafe5ff9770a62ad893",
"assets/assets/images/pigs/pig7_eat10.png": "8e6ce3959ed40fc5f82b288aa23f7cc7",
"assets/assets/images/pigs/pig7_eat2.png": "9ebc05fbbdf994ac38b5ce40a18826eb",
"assets/assets/images/pigs/pig7_eat3.png": "aba46a4f93316c8cd316b426e982e543",
"assets/assets/images/pigs/pig7_eat4.png": "76de6a5762a7c45d40acd087bf26a12d",
"assets/assets/images/pigs/pig7_eat5.png": "e436b51bdf66c9768eee9cd4a38df6a8",
"assets/assets/images/pigs/pig7_eat7.png": "7f898325dec93ac363977680ca6a0247",
"assets/assets/images/pigs/pig7_eat8.png": "1e17a8d2b21a9c6e9e5c3f7a786f8c5c",
"assets/assets/images/pigs/pig7_eat9.png": "0ff9828883600ef9b0eb9dd366feaf01",
"assets/assets/images/pigs/pig7_sad1.png": "4217681221f23e3f894c8c0a8e361942",
"assets/assets/images/pigs/pig7_sad2.png": "a34f9159432894deb7a0211ba4304e5a",
"assets/assets/images/pigs/pig7_sad3.png": "dde56a6d2e6fa9c035b3624f6b0d81d5",
"assets/assets/images/pigs/pig7_sad4.png": "dde56a6d2e6fa9c035b3624f6b0d81d5",
"assets/assets/images/pigs/pig7_sad5.png": "8e7b5dc6d0420ce98fbc1b1be64dd783",
"assets/assets/images/pigs/pig7_sad6.png": "ab83098dce12e974524d3c3e7af4b59b",
"assets/assets/images/pigs/pig7_stand1.png": "f6ab539ffdb9c8708482eeb5c6c7bf3e",
"assets/assets/images/pigs/pig7_stand2.png": "664e790b15aa0455bea31abfff1c0b42",
"assets/assets/images/pigs/pig7_stand3.png": "b2dc8099ff934e661ab18e78610577be",
"assets/assets/images/pigs/pig7_stand4.png": "2ae4a97843903d610a85d8fab1dad32d",
"assets/assets/images/pigs/pig7_stand5.png": "cffe08deb7691f8cc1440728303baa75",
"assets/assets/images/pigs/pig8_eat1.png": "37b8164969186b5977fd7c1d3810f29e",
"assets/assets/images/pigs/pig8_eat10.png": "576bf7989b05bfa21647078bdb403f9a",
"assets/assets/images/pigs/pig8_eat2.png": "8ab8dad19996f1057ae8d4502b56bc13",
"assets/assets/images/pigs/pig8_eat3.png": "ed81cff2cedb6322d4627fe523975893",
"assets/assets/images/pigs/pig8_eat4.png": "8e9120fdd82f7bf055a211b9889225a4",
"assets/assets/images/pigs/pig8_eat5.png": "78cd438388789468836e7ce60c5c3a63",
"assets/assets/images/pigs/pig8_eat7.png": "30e7b222c25e79a7252eae9ecf914350",
"assets/assets/images/pigs/pig8_eat8.png": "8fcc068460886aa7d9dfe06a48337654",
"assets/assets/images/pigs/pig8_eat9.png": "f91183c15036bd871e3770774ee56887",
"assets/assets/images/pigs/pig8_sad1.png": "d35681f15b1f41fe3eaecb0ad2492da6",
"assets/assets/images/pigs/pig8_sad2.png": "7c1609712ec306066eb5ef2527ad9c7f",
"assets/assets/images/pigs/pig8_sad3.png": "ea5042f4115caf66246a04c2d862552c",
"assets/assets/images/pigs/pig8_sad4.png": "ea5042f4115caf66246a04c2d862552c",
"assets/assets/images/pigs/pig8_sad5.png": "45802d73929470308a6468eb9cb79d63",
"assets/assets/images/pigs/pig8_sad6.png": "af5ac11aec274f5bf6111b313feaa793",
"assets/assets/images/pigs/pig8_stand1.png": "3a5a6a9d9aecff3aec011e651ccaaddb",
"assets/assets/images/pigs/pig8_stand2.png": "f559b903f596038820d7249b5ef0d87a",
"assets/assets/images/pigs/pig8_stand3.png": "2b120286b536bc72b91b69ca3cffcb0b",
"assets/assets/images/pigs/pig8_stand4.png": "a172c2ff594ab16729bfbebda0e65acb",
"assets/assets/images/pigs/pig8_stand5.png": "fd516e491a167dfc167722a56516deb7",
"assets/assets/images/pigs/pig9_eat1.png": "f3913d71a5c1f5335b4d72a733714c5e",
"assets/assets/images/pigs/pig9_eat10.png": "e21d91ab849bdaa7d1465212c818461d",
"assets/assets/images/pigs/pig9_eat2.png": "eae44733f11d88983b34afbec379f04c",
"assets/assets/images/pigs/pig9_eat3.png": "0f2d44301011c291b68caa83fc9369be",
"assets/assets/images/pigs/pig9_eat4.png": "ccab8ab727e04ae43726fca3afe9ad76",
"assets/assets/images/pigs/pig9_eat5.png": "4594be688209be5187d7f3dcb1370027",
"assets/assets/images/pigs/pig9_eat7.png": "60939e3c92404a3272c7c3cbdec5afe2",
"assets/assets/images/pigs/pig9_eat8.png": "8f09e57a6f716377dbe9faef38d55207",
"assets/assets/images/pigs/pig9_eat9.png": "ec3fec4fe1e3f4e95a170bcb3923a22d",
"assets/assets/images/pigs/pig9_sad1.png": "b98b81cbdb1c2833b2bbd99172de6856",
"assets/assets/images/pigs/pig9_sad2.png": "ba6e2ff7a6854d332d813c8709b926f4",
"assets/assets/images/pigs/pig9_sad3.png": "57b1b03b0b3fbff5e9643810d8b983ca",
"assets/assets/images/pigs/pig9_sad4.png": "57b1b03b0b3fbff5e9643810d8b983ca",
"assets/assets/images/pigs/pig9_sad5.png": "f4eaf22cfdbc7c84bd6de9c26211a7c6",
"assets/assets/images/pigs/pig9_sad6.png": "ff3d302f4f2112ab39d32060c0a1838a",
"assets/assets/images/pigs/pig9_stand1.png": "4f2e2478cc28a68e668531cef16c9d16",
"assets/assets/images/pigs/pig9_stand2.png": "ee18bd68534e349b42077c6b8cb994c7",
"assets/assets/images/pigs/pig9_stand3.png": "4d6d74d5e4ecebedd276c37a36e79e53",
"assets/assets/images/pigs/pig9_stand4.png": "31dc0e83688db17c05d00efded34c919",
"assets/assets/images/pigs/pig9_stand5.png": "13c71447b403ab8b452bb2c66b7f3769",
"assets/FontManifest.json": "844994788e209aebd5fa7315329246e9",
"assets/fonts/MaterialIcons-Regular.otf": "7e7a6cccddf6d7b20012a548461d5d81",
"assets/NOTICES": "0b5729236bafeaed3e19d5cb2329e5bd",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "1cb871d02a0139f9c0023e9b031fd734",
"/": "1cb871d02a0139f9c0023e9b031fd734",
"main.dart.js": "76274e115286fac82f013c591600c265",
"manifest.json": "21552abac7bde39c927dc2ec820d0594",
"version.json": "26d3ad2e838bc3a40b36d34af5ffe273"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
