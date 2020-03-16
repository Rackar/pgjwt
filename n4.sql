
-- 插入45行



-- ----------------------------
-- Table structure for nideshop_specification
-- ----------------------------
DROP TABLE IF EXISTS "nideshop_specification" CASCADE;
CREATE TABLE "nideshop_specification" (
  "id" serial  NOT NULL  PRIMARY KEY,
  "name" varchar(60) NOT NULL DEFAULT '',
  "sort_order" integer  NOT NULL DEFAULT '0'
) ;

-- ----------------------------
-- Records of nideshop_specification
-- ----------------------------

INSERT INTO "nideshop_specification" VALUES (1, '颜色', 1);
INSERT INTO "nideshop_specification" VALUES (2, '规格', 2);


-- ----------------------------
-- Table structure for nideshop_goods_specification
-- ----------------------------
DROP TABLE IF EXISTS "nideshop_goods_specification" CASCADE;
CREATE TABLE "nideshop_goods_specification" (
  "id" serial  NOT NULL  PRIMARY KEY,
  "goods_id" integer  NOT NULL DEFAULT '0' references nideshop_goods,
  "specification_id" integer  NOT NULL DEFAULT '0' references nideshop_specification,
  "value" varchar(50) NOT NULL DEFAULT '',
  "pic_url" varchar(255) NOT NULL DEFAULT ''
) ;

-- ----------------------------
-- Records of nideshop_goods_specification
-- ----------------------------

INSERT INTO "nideshop_goods_specification" VALUES (1, 1181000, 1, '1.5m床垫*1+枕头*2', '');
INSERT INTO "nideshop_goods_specification" VALUES (2, 1181000, 1, '1.8m床垫*1+枕头*2', '');
INSERT INTO "nideshop_goods_specification" VALUES (3, 1181000, 2, '浅杏粉', 'http://yanxuan.nosdn.127.net/10022c73fa7aa75c2c0d736e96cc56d5.png?quality=90&thumbnail=200x200&imageView');
INSERT INTO "nideshop_goods_specification" VALUES (4, 1181000, 2, '玛瑙红', 'http://yanxuan.nosdn.127.net/29442127f431a1a1801c195905319427.png?quality=90&thumbnail=200x200&imageView');
INSERT INTO "nideshop_goods_specification" VALUES (5, 1181000, 2, '烟白灰', 'http://yanxuan.nosdn.127.net/36f64a7161b67e7fb8ea45be32ecfa25.png?quality=90&thumbnail=200x200&imageView');



-- ----------------------------
-- Table structure for nideshop_goods_issue
-- ----------------------------
DROP TABLE IF EXISTS "nideshop_goods_issue" CASCADE;
CREATE TABLE "nideshop_goods_issue" (
  "id" serial NOT NULL  PRIMARY KEY,
  "goods_id" integer  DEFAULT '0' references nideshop_goods,
  "question" text DEFAULT NULL,
  "answer" text DEFAULT NULL
) ;

-- ----------------------------
-- Records of nideshop_goods_issue
-- ----------------------------
INSERT INTO "nideshop_goods_issue" VALUES (1, 1127052, '购买运费如何收取？', '单笔订单金额（不含运费）满88元免邮费；不满88元，每单收取10元运费。\n(港澳台地区需满');
INSERT INTO "nideshop_goods_issue" VALUES (2, 1127052, '使用什么快递发货？', '严选默认使用顺丰快递发货（个别商品使用其他快递），配送范围覆盖全国大部分地区（港澳台地区除');
INSERT INTO "nideshop_goods_issue" VALUES (3, 1127052, '如何申请退货？', '1.自收到商品之日起30日内，顾客可申请无忧退货，退款将原路返还，不同的银行处理时间不同，');
INSERT INTO "nideshop_goods_issue" VALUES (4, 1127052, '如何开具发票？', '1.如需开具普通发票，请在下单时选择“我要开发票”并填写相关信息（APP仅限2.4.0及以');


-- ----------------------------
-- Table structure for nideshop_keywords
-- ----------------------------
DROP TABLE IF EXISTS "nideshop_keywords" CASCADE;
CREATE TABLE "nideshop_keywords" (
  "keyword" varchar(90) NOT NULL DEFAULT '',
  "is_hot" smallint  NOT NULL DEFAULT '0',
  "is_default" smallint  NOT NULL DEFAULT '0',
  "is_show" smallint  NOT NULL DEFAULT '1',
  "sort_order" integer  NOT NULL DEFAULT '100',
  "scheme_url" varchar(255) NOT NULL DEFAULT '' ,
  "id" serial NOT NULL  PRIMARY KEY,
  "type" integer  NOT NULL DEFAULT '0'
) ;

-- ----------------------------
-- Records of nideshop_keywords
-- ----------------------------

INSERT INTO "nideshop_keywords" VALUES ('520元礼包抢先领', 1, 1, 1, 1, '', 1, 0);
INSERT INTO "nideshop_keywords" VALUES ('单鞋', 0, 0, 1, 8, '', 7, 0);
INSERT INTO "nideshop_keywords" VALUES ('墨镜', 0, 0, 1, 5, '', 5, 0);
INSERT INTO "nideshop_keywords" VALUES ('夏凉被', 0, 0, 1, 100, '', 6, 0);
INSERT INTO "nideshop_keywords" VALUES ('新品上市', 0, 0, 1, 100, '', 4, 0);
INSERT INTO "nideshop_keywords" VALUES ('日式', 0, 0, 1, 100, '', 3, 0);
INSERT INTO "nideshop_keywords" VALUES ('母亲节', 0, 0, 1, 100, '', 2, 0);


-- ----------------------------
-- Table structure for nideshop_product
-- ----------------------------
DROP TABLE IF EXISTS "nideshop_product" CASCADE;
CREATE TABLE "nideshop_product" (
  "id" serial  NOT NULL  PRIMARY KEY,
  "goods_id" integer  NOT NULL DEFAULT '0' references nideshop_goods,
  "goods_specification_ids" integer NOT NULL DEFAULT '0' references nideshop_goods_specification,
  "goods_sn" varchar(60) NOT NULL DEFAULT '',
  "goods_number" integer  NOT NULL DEFAULT '0',
  "retail_price" decimal(10,2)  NOT NULL DEFAULT '0.00'
) ;

-- ----------------------------
-- Records of nideshop_product
-- ----------------------------

INSERT INTO "nideshop_product" VALUES (1, 1181000, '1_3', 'Y100300', 100, 999.00);
INSERT INTO "nideshop_product" VALUES (2, 1181000, '1_4', 'Y100400', 200, 1500.00);
INSERT INTO "nideshop_product" VALUES (3, 1181000, '1_5', 'Y100500', 300, 1000.00);
INSERT INTO "nideshop_product" VALUES (4, 1181000, '2_3', 'Y200300', 400, 1001.00);
INSERT INTO "nideshop_product" VALUES (5, 1181000, '2_4', 'Y200400', 2, 2000.00);
INSERT INTO "nideshop_product" VALUES (6, 1181000, '2_5', 'Y200500', 0, 3000.00);
INSERT INTO "nideshop_product" VALUES (7, 1006002, '', '1006002', 100, 899.00);
INSERT INTO "nideshop_product" VALUES (8, 1006007, '', '1006007', 100, 459.00);
INSERT INTO "nideshop_product" VALUES (9, 1006010, '', '1006010', 100, 659.00);
INSERT INTO "nideshop_product" VALUES (10, 1006013, '', '1006013', 100, 699.00);
INSERT INTO "nideshop_product" VALUES (11, 1006014, '', '1006014', 100, 1399.00);
INSERT INTO "nideshop_product" VALUES (12, 1006051, '', '1006051', 100, 59.00);
INSERT INTO "nideshop_product" VALUES (13, 1009009, '', '1009009', 100, 1999.00);
INSERT INTO "nideshop_product" VALUES (14, 1009012, '', '1009012', 100, 59.00);
INSERT INTO "nideshop_product" VALUES (15, 1009013, '', '1009013', 100, 99.00);
INSERT INTO "nideshop_product" VALUES (16, 1009024, '', '1009024', 100, 599.00);
INSERT INTO "nideshop_product" VALUES (17, 1009027, '', '1009027', 100, 79.00);
INSERT INTO "nideshop_product" VALUES (18, 1010000, '', '1010000', 100, 399.00);
INSERT INTO "nideshop_product" VALUES (19, 1010001, '', '1010001', 100, 299.00);
INSERT INTO "nideshop_product" VALUES (20, 1011004, '', '1011004', 100, 199.00);
INSERT INTO "nideshop_product" VALUES (21, 1015007, '', '1015007', 100, 59.00);
INSERT INTO "nideshop_product" VALUES (22, 1019000, '', '1019000', 100, 99.00);
INSERT INTO "nideshop_product" VALUES (23, 1019001, '', '1019001', 100, 109.00);
INSERT INTO "nideshop_product" VALUES (24, 1019002, '', '1019002', 100, 199.00);
INSERT INTO "nideshop_product" VALUES (25, 1019006, '', '1019006', 100, 99.00);
INSERT INTO "nideshop_product" VALUES (26, 1020000, '', '1020000', 100, 79.00);
INSERT INTO "nideshop_product" VALUES (27, 1021000, '', '1021000', 100, 39.00);
INSERT INTO "nideshop_product" VALUES (28, 1021001, '', '1021001', 100, 99.00);
INSERT INTO "nideshop_product" VALUES (29, 1021004, '', '1021004', 100, 299.00);
INSERT INTO "nideshop_product" VALUES (30, 1021010, '', '1021010', 100, 299.00);
INSERT INTO "nideshop_product" VALUES (31, 1022000, '', '1022000', 100, 299.00);
INSERT INTO "nideshop_product" VALUES (32, 1022001, '', '1022001', 100, 349.00);
INSERT INTO "nideshop_product" VALUES (33, 1023003, '', '1023003', 100, 398.00);
INSERT INTO "nideshop_product" VALUES (34, 1023012, '', '1023012', 100, 299.00);
INSERT INTO "nideshop_product" VALUES (35, 1023032, '', '1023032', 100, 449.00);
INSERT INTO "nideshop_product" VALUES (36, 1023034, '', '1023034', 100, 299.00);
INSERT INTO "nideshop_product" VALUES (37, 1025005, '', '1025005', 100, 268.00);
INSERT INTO "nideshop_product" VALUES (38, 1027004, '', '1027004', 100, 249.00);
INSERT INTO "nideshop_product" VALUES (39, 1029005, '', '1029005', 100, 959.00);
INSERT INTO "nideshop_product" VALUES (40, 1030001, '', '1030001', 100, 969.00);
INSERT INTO "nideshop_product" VALUES (41, 1030002, '', '1030002', 100, 899.00);
INSERT INTO "nideshop_product" VALUES (42, 1030003, '', '1030003', 100, 1469.00);
INSERT INTO "nideshop_product" VALUES (43, 1030004, '', '1030004', 100, 399.00);
INSERT INTO "nideshop_product" VALUES (44, 1030005, '', '1030005', 100, 899.00);
INSERT INTO "nideshop_product" VALUES (45, 1030006, '', '1030006', 100, 329.00);
INSERT INTO "nideshop_product" VALUES (46, 1033000, '', '1033000', 100, 199.00);
INSERT INTO "nideshop_product" VALUES (47, 1035006, '', '1035006', 100, 56.00);
INSERT INTO "nideshop_product" VALUES (48, 1036002, '', '1036002', 100, 99.00);
INSERT INTO "nideshop_product" VALUES (49, 1036013, '', '1036013', 100, 109.00);
INSERT INTO "nideshop_product" VALUES (50, 1036016, '', '1036016', 100, 109.00);
INSERT INTO "nideshop_product" VALUES (51, 1037011, '', '1037011', 100, 599.00);
INSERT INTO "nideshop_product" VALUES (52, 1037012, '', '1037012', 100, 69.00);
INSERT INTO "nideshop_product" VALUES (53, 1038004, '', '1038004', 100, 359.00);
INSERT INTO "nideshop_product" VALUES (54, 1039051, '', '1039051', 100, 79.00);
INSERT INTO "nideshop_product" VALUES (55, 1039056, '', '1039056', 100, 79.00);
INSERT INTO "nideshop_product" VALUES (56, 1043005, '', '1043005', 100, 59.00);
INSERT INTO "nideshop_product" VALUES (57, 1044012, '', '1044012', 100, 349.00);
INSERT INTO "nideshop_product" VALUES (58, 1045000, '', '1045000', 100, 28.00);
INSERT INTO "nideshop_product" VALUES (59, 1046001, '', '1046001', 100, 8.90);
INSERT INTO "nideshop_product" VALUES (60, 1046002, '', '1046002', 100, 9.90);
INSERT INTO "nideshop_product" VALUES (61, 1046044, '', '1046044', 100, 349.00);
INSERT INTO "nideshop_product" VALUES (62, 1048005, '', '1048005', 100, 59.00);
INSERT INTO "nideshop_product" VALUES (63, 1051000, '', '1051000', 100, 180.00);
INSERT INTO "nideshop_product" VALUES (64, 1051001, '', '1051001', 100, 159.00);
INSERT INTO "nideshop_product" VALUES (65, 1051002, '', '1051002', 100, 228.00);
INSERT INTO "nideshop_product" VALUES (66, 1051003, '', '1051003', 100, 148.00);
INSERT INTO "nideshop_product" VALUES (67, 1055012, '', '1055012', 100, 39.00);
INSERT INTO "nideshop_product" VALUES (68, 1055016, '', '1055016', 100, 59.00);
INSERT INTO "nideshop_product" VALUES (69, 1055022, '', '1055022', 100, 4.90);
INSERT INTO "nideshop_product" VALUES (70, 1056002, '', '1056002', 100, 59.00);
INSERT INTO "nideshop_product" VALUES (71, 1057036, '', '1057036', 100, 79.00);
INSERT INTO "nideshop_product" VALUES (72, 1064000, '', '1064000', 100, 79.00);
INSERT INTO "nideshop_product" VALUES (73, 1064002, '', '1064002', 100, 69.00);
INSERT INTO "nideshop_product" VALUES (74, 1064003, '', '1064003', 100, 89.00);
INSERT INTO "nideshop_product" VALUES (75, 1064004, '', '1064004', 100, 99.00);
INSERT INTO "nideshop_product" VALUES (76, 1064006, '', '1064006', 100, 129.00);
INSERT INTO "nideshop_product" VALUES (77, 1064007, '', '1064007', 100, 249.00);
INSERT INTO "nideshop_product" VALUES (78, 1064021, '', '1064021', 100, 199.00);
INSERT INTO "nideshop_product" VALUES (79, 1064022, '', '1064022', 100, 299.00);
INSERT INTO "nideshop_product" VALUES (80, 1065004, '', '1065004', 100, 199.00);
INSERT INTO "nideshop_product" VALUES (81, 1065005, '', '1065005', 100, 249.00);
INSERT INTO "nideshop_product" VALUES (82, 1068010, '', '1068010', 100, 329.00);
INSERT INTO "nideshop_product" VALUES (83, 1068011, '', '1068011', 100, 399.00);
INSERT INTO "nideshop_product" VALUES (84, 1068012, '', '1068012', 100, 599.00);
INSERT INTO "nideshop_product" VALUES (85, 1070000, '', '1070000', 100, 26.00);
INSERT INTO "nideshop_product" VALUES (86, 1071004, '', '1071004', 100, 89.00);
INSERT INTO "nideshop_product" VALUES (87, 1071005, '', '1071005', 100, 39.00);
INSERT INTO "nideshop_product" VALUES (88, 1071006, '', '1071006', 100, 9.90);
INSERT INTO "nideshop_product" VALUES (89, 1072000, '', '1072000', 100, 89.00);
INSERT INTO "nideshop_product" VALUES (90, 1072001, '', '1072001', 100, 49.00);
INSERT INTO "nideshop_product" VALUES (91, 1073008, '', '1073008', 100, 149.00);
INSERT INTO "nideshop_product" VALUES (92, 1074001, '', '1074001', 100, 59.00);
INSERT INTO "nideshop_product" VALUES (93, 1075022, '', '1075022', 100, 39.00);
INSERT INTO "nideshop_product" VALUES (94, 1075023, '', '1075023', 100, 199.00);
INSERT INTO "nideshop_product" VALUES (95, 1075024, '', '1075024', 100, 2399.00);
INSERT INTO "nideshop_product" VALUES (96, 1081000, '', '1081000', 100, 49.00);
INSERT INTO "nideshop_product" VALUES (97, 1081002, '', '1081002', 100, 89.00);
INSERT INTO "nideshop_product" VALUES (98, 1083009, '', '1083009', 100, 299.00);
INSERT INTO "nideshop_product" VALUES (99, 1083010, '', '1083010', 100, 469.00);
INSERT INTO "nideshop_product" VALUES (100, 1084001, '', '1084001', 100, 249.00);
INSERT INTO "nideshop_product" VALUES (101, 1084003, '', '1084003', 100, 199.00);
INSERT INTO "nideshop_product" VALUES (102, 1085019, '', '1085019', 100, 349.00);
INSERT INTO "nideshop_product" VALUES (103, 1086015, '', '1086015', 100, 249.00);
INSERT INTO "nideshop_product" VALUES (104, 1086023, '', '1086023', 100, 19.90);
INSERT INTO "nideshop_product" VALUES (105, 1086024, '', '1086024', 100, 9.90);
INSERT INTO "nideshop_product" VALUES (106, 1086025, '', '1086025', 100, 49.00);
INSERT INTO "nideshop_product" VALUES (107, 1086026, '', '1086026', 100, 29.00);
INSERT INTO "nideshop_product" VALUES (108, 1086052, '', '1086052', 100, 859.00);
INSERT INTO "nideshop_product" VALUES (109, 1090004, '', '1090004', 100, 399.00);
INSERT INTO "nideshop_product" VALUES (110, 1092001, '', '1092001', 100, 29.00);
INSERT INTO "nideshop_product" VALUES (111, 1092005, '', '1092005', 100, 39.00);
INSERT INTO "nideshop_product" VALUES (112, 1092024, '', '1092024', 100, 1599.00);
INSERT INTO "nideshop_product" VALUES (113, 1092025, '', '1092025', 100, 19.90);
INSERT INTO "nideshop_product" VALUES (114, 1092026, '', '1092026', 100, 19.90);
INSERT INTO "nideshop_product" VALUES (115, 1092038, '', '1092038', 100, 39.00);
INSERT INTO "nideshop_product" VALUES (116, 1092039, '', '1092039', 100, 59.00);
INSERT INTO "nideshop_product" VALUES (117, 1093000, '', '1093000', 100, 39.00);
INSERT INTO "nideshop_product" VALUES (118, 1093001, '', '1093001', 100, 29.00);
INSERT INTO "nideshop_product" VALUES (119, 1093002, '', '1093002', 100, 49.00);
INSERT INTO "nideshop_product" VALUES (120, 1097004, '', '1097004', 100, 1699.00);
INSERT INTO "nideshop_product" VALUES (121, 1097005, '', '1097005', 100, 1199.00);
INSERT INTO "nideshop_product" VALUES (122, 1097006, '', '1097006', 100, 999.00);
INSERT INTO "nideshop_product" VALUES (123, 1097007, '', '1097007', 100, 759.00);
INSERT INTO "nideshop_product" VALUES (124, 1097009, '', '1097009', 100, 1599.00);
INSERT INTO "nideshop_product" VALUES (125, 1097011, '', '1097011', 100, 3899.00);
INSERT INTO "nideshop_product" VALUES (126, 1097012, '', '1097012', 100, 999.00);
INSERT INTO "nideshop_product" VALUES (127, 1097013, '', '1097013', 100, 2699.00);
INSERT INTO "nideshop_product" VALUES (128, 1097014, '', '1097014', 100, 4199.00);
INSERT INTO "nideshop_product" VALUES (129, 1097016, '', '1097016', 100, 2799.00);
INSERT INTO "nideshop_product" VALUES (130, 1097017, '', '1097017', 100, 2199.00);
INSERT INTO "nideshop_product" VALUES (131, 1100000, '', '1100000', 100, 79.00);
INSERT INTO "nideshop_product" VALUES (132, 1100001, '', '1100001', 100, 199.00);
INSERT INTO "nideshop_product" VALUES (133, 1100002, '', '1100002', 100, 189.00);
INSERT INTO "nideshop_product" VALUES (134, 1108029, '', '1108029', 100, 89.00);
INSERT INTO "nideshop_product" VALUES (135, 1108030, '', '1108030', 100, 39.00);
INSERT INTO "nideshop_product" VALUES (136, 1108031, '', '1108031', 100, 39.00);
INSERT INTO "nideshop_product" VALUES (137, 1108032, '', '1108032', 100, 29.00);
INSERT INTO "nideshop_product" VALUES (138, 1109004, '', '1109004', 100, 89.00);
INSERT INTO "nideshop_product" VALUES (139, 1109005, '', '1109005', 100, 79.00);
INSERT INTO "nideshop_product" VALUES (140, 1109008, '', '1109008', 100, 3999.00);
INSERT INTO "nideshop_product" VALUES (141, 1109034, '', '1109034', 100, 129.00);
INSERT INTO "nideshop_product" VALUES (142, 1110002, '', '1110002', 100, 119.00);
INSERT INTO "nideshop_product" VALUES (143, 1110003, '', '1110003', 100, 299.00);
INSERT INTO "nideshop_product" VALUES (144, 1110004, '', '1110004', 100, 299.00);
INSERT INTO "nideshop_product" VALUES (145, 1110007, '', '1110007', 100, 299.00);
INSERT INTO "nideshop_product" VALUES (146, 1110008, '', '1110008', 100, 99.00);
INSERT INTO "nideshop_product" VALUES (147, 1110013, '', '1110013', 100, 59.00);
INSERT INTO "nideshop_product" VALUES (148, 1110014, '', '1110014', 100, 69.00);
INSERT INTO "nideshop_product" VALUES (149, 1110015, '', '1110015', 100, 69.00);
INSERT INTO "nideshop_product" VALUES (150, 1110016, '', '1110016', 100, 39.00);
INSERT INTO "nideshop_product" VALUES (151, 1110017, '', '1110017', 100, 79.00);
INSERT INTO "nideshop_product" VALUES (152, 1110018, '', '1110018', 100, 79.00);
INSERT INTO "nideshop_product" VALUES (153, 1110019, '', '1110019', 100, 69.00);
INSERT INTO "nideshop_product" VALUES (154, 1111007, '', '1111007', 100, 78.00);
INSERT INTO "nideshop_product" VALUES (155, 1111010, '', '1111010', 100, 69.00);
INSERT INTO "nideshop_product" VALUES (156, 1113010, '', '1113010', 100, 59.00);
INSERT INTO "nideshop_product" VALUES (157, 1113011, '', '1113011', 100, 49.00);
INSERT INTO "nideshop_product" VALUES (158, 1113019, '', '1113019', 100, 208.00);
INSERT INTO "nideshop_product" VALUES (159, 1114011, '', '1114011', 100, 299.00);
INSERT INTO "nideshop_product" VALUES (160, 1115023, '', '1115023', 100, 1599.00);
INSERT INTO "nideshop_product" VALUES (161, 1115028, '', '1115028', 100, 299.00);
INSERT INTO "nideshop_product" VALUES (162, 1115052, '', '1115052', 100, 86.00);
INSERT INTO "nideshop_product" VALUES (163, 1115053, '', '1115053', 100, 299.00);
INSERT INTO "nideshop_product" VALUES (164, 1116004, '', '1116004', 100, 79.00);
INSERT INTO "nideshop_product" VALUES (165, 1116005, '', '1116005', 100, 79.00);
INSERT INTO "nideshop_product" VALUES (166, 1116008, '', '1116008', 100, 99.00);
INSERT INTO "nideshop_product" VALUES (167, 1116011, '', '1116011', 100, 36.00);
INSERT INTO "nideshop_product" VALUES (168, 1116030, '', '1116030', 100, 439.00);
INSERT INTO "nideshop_product" VALUES (169, 1116031, '', '1116031', 100, 439.00);
INSERT INTO "nideshop_product" VALUES (170, 1116032, '', '1116032', 100, 3499.00);
INSERT INTO "nideshop_product" VALUES (171, 1116033, '', '1116033', 100, 1399.00);
INSERT INTO "nideshop_product" VALUES (172, 1125010, '', '1125010', 100, 159.00);
INSERT INTO "nideshop_product" VALUES (173, 1125011, '', '1125011', 100, 139.00);
INSERT INTO "nideshop_product" VALUES (174, 1125016, '', '1125016', 100, 139.00);
INSERT INTO "nideshop_product" VALUES (175, 1125017, '', '1125017', 100, 99.00);
INSERT INTO "nideshop_product" VALUES (176, 1125026, '', '1125026', 100, 159.00);
INSERT INTO "nideshop_product" VALUES (177, 1127003, '', '1127003', 100, 2599.00);
INSERT INTO "nideshop_product" VALUES (178, 1127024, '', '1127024', 100, 39.00);
INSERT INTO "nideshop_product" VALUES (179, 1127025, '', '1127025', 100, 39.00);
INSERT INTO "nideshop_product" VALUES (180, 1127038, '', '1127038', 100, 359.00);
INSERT INTO "nideshop_product" VALUES (181, 1127039, '', '1127039', 100, 399.00);
INSERT INTO "nideshop_product" VALUES (182, 1127047, '', '1127047', 100, 29.00);
INSERT INTO "nideshop_product" VALUES (183, 1127052, '', '1127052', 100, 169.00);
INSERT INTO "nideshop_product" VALUES (184, 1128002, '', '1128002', 100, 599.00);
INSERT INTO "nideshop_product" VALUES (185, 1128010, '', '1128010', 100, 29.00);
INSERT INTO "nideshop_product" VALUES (186, 1128011, '', '1128011', 100, 79.00);
INSERT INTO "nideshop_product" VALUES (187, 1129015, '', '1129015', 100, 89.00);
INSERT INTO "nideshop_product" VALUES (188, 1129016, '', '1129016', 100, 29.00);
INSERT INTO "nideshop_product" VALUES (189, 1130037, '', '1130037', 100, 39.00);
INSERT INTO "nideshop_product" VALUES (190, 1130038, '', '1130038', 100, 89.00);
INSERT INTO "nideshop_product" VALUES (191, 1130039, '', '1130039', 100, 89.00);
INSERT INTO "nideshop_product" VALUES (192, 1130041, '', '1130041', 100, 109.00);
INSERT INTO "nideshop_product" VALUES (193, 1130042, '', '1130042', 100, 239.00);
INSERT INTO "nideshop_product" VALUES (194, 1130049, '', '1130049', 100, 429.00);
INSERT INTO "nideshop_product" VALUES (195, 1130056, '', '1130056', 100, 2299.00);
INSERT INTO "nideshop_product" VALUES (196, 1131017, '', '1131017', 100, 259.00);
INSERT INTO "nideshop_product" VALUES (197, 1134022, '', '1134022', 100, 79.00);
INSERT INTO "nideshop_product" VALUES (198, 1134030, '', '1134030', 100, 46.00);
INSERT INTO "nideshop_product" VALUES (199, 1134032, '', '1134032', 100, 49.00);
INSERT INTO "nideshop_product" VALUES (200, 1134036, '', '1134036', 100, 38.00);
INSERT INTO "nideshop_product" VALUES (201, 1134056, '', '1134056', 100, 429.00);
INSERT INTO "nideshop_product" VALUES (202, 1135000, '', '1135000', 100, 359.00);
INSERT INTO "nideshop_product" VALUES (203, 1135001, '', '1135001', 100, 459.00);
INSERT INTO "nideshop_product" VALUES (204, 1135002, '', '1135002', 100, 2599.00);
INSERT INTO "nideshop_product" VALUES (205, 1135050, '', '1135050', 100, 179.00);
INSERT INTO "nideshop_product" VALUES (206, 1135051, '', '1135051', 100, 299.00);
INSERT INTO "nideshop_product" VALUES (207, 1135052, '', '1135052', 100, 259.00);
INSERT INTO "nideshop_product" VALUES (208, 1135053, '', '1135053', 100, 429.00);
INSERT INTO "nideshop_product" VALUES (209, 1135054, '', '1135054', 100, 559.00);
INSERT INTO "nideshop_product" VALUES (210, 1135055, '', '1135055', 100, 399.00);
INSERT INTO "nideshop_product" VALUES (211, 1135056, '', '1135056', 100, 259.00);
INSERT INTO "nideshop_product" VALUES (212, 1135057, '', '1135057', 100, 199.00);
INSERT INTO "nideshop_product" VALUES (213, 1135058, '', '1135058', 100, 79.00);
INSERT INTO "nideshop_product" VALUES (214, 1135065, '', '1135065', 100, 69.00);
INSERT INTO "nideshop_product" VALUES (215, 1135072, '', '1135072', 100, 69.00);
INSERT INTO "nideshop_product" VALUES (216, 1135073, '', '1135073', 100, 69.00);
INSERT INTO "nideshop_product" VALUES (217, 1138000, '', '1138000', 100, 29.00);
INSERT INTO "nideshop_product" VALUES (218, 1138001, '', '1138001', 100, 79.00);
INSERT INTO "nideshop_product" VALUES (219, 1143006, '', '1143006', 100, 99.00);
INSERT INTO "nideshop_product" VALUES (220, 1143015, '', '1143015', 100, 79.00);
INSERT INTO "nideshop_product" VALUES (221, 1143016, '', '1143016', 100, 319.00);
INSERT INTO "nideshop_product" VALUES (222, 1143018, '', '1143018', 100, 68.00);
INSERT INTO "nideshop_product" VALUES (223, 1143019, '', '1143019', 100, 98.00);
INSERT INTO "nideshop_product" VALUES (224, 1143020, '', '1143020', 100, 168.00);
INSERT INTO "nideshop_product" VALUES (225, 1147045, '', '1147045', 100, 599.00);
INSERT INTO "nideshop_product" VALUES (226, 1147046, '', '1147046', 100, 599.00);
INSERT INTO "nideshop_product" VALUES (227, 1147047, '', '1147047', 100, 559.00);
INSERT INTO "nideshop_product" VALUES (228, 1147048, '', '1147048', 100, 559.00);
INSERT INTO "nideshop_product" VALUES (229, 1151012, '', '1151012', 100, 359.00);
INSERT INTO "nideshop_product" VALUES (230, 1151013, '', '1151013', 100, 359.00);
INSERT INTO "nideshop_product" VALUES (231, 1152004, '', '1152004', 100, 399.00);
INSERT INTO "nideshop_product" VALUES (232, 1152008, '', '1152008', 100, 29.00);
INSERT INTO "nideshop_product" VALUES (233, 1152009, '', '1152009', 100, 29.00);
INSERT INTO "nideshop_product" VALUES (234, 1152031, '', '1152031', 100, 99.00);
INSERT INTO "nideshop_product" VALUES (235, 1152095, '', '1152095', 100, 499.00);
INSERT INTO "nideshop_product" VALUES (236, 1152097, '', '1152097', 100, 399.00);
INSERT INTO "nideshop_product" VALUES (237, 1152100, '', '1152100', 100, 499.00);
INSERT INTO "nideshop_product" VALUES (238, 1152101, '', '1152101', 100, 888.00);
INSERT INTO "nideshop_product" VALUES (239, 1152161, '', '1152161', 100, 459.00);
INSERT INTO "nideshop_product" VALUES (240, 1153006, '', '1153006', 100, 1288.00);
INSERT INTO "nideshop_product" VALUES (241, 1155000, '', '1155000', 100, 399.00);
INSERT INTO "nideshop_product" VALUES (242, 1155015, '', '1155015', 100, 12.90);
INSERT INTO "nideshop_product" VALUES (243, 1156006, '', '1156006', 100, 699.00);
INSERT INTO "nideshop_product" VALUES (244, 1166008, '', '1166008', 100, 459.00);


-- ----------------------------
-- Table structure for nideshop_cart
-- ----------------------------
DROP TABLE IF EXISTS "nideshop_cart" CASCADE;

CREATE TABLE "nideshop_cart" (
  "id" serial NOT NULL  PRIMARY KEY,
  "user_id" integer  NOT NULL DEFAULT '0' references nideshop_user,
  "session_id" char(32)  NOT NULL DEFAULT '',
  "goods_id" integer  NOT NULL DEFAULT '0' references nideshop_goods,
  "goods_sn" varchar(60) NOT NULL DEFAULT '',
  "product_id" integer  NOT NULL DEFAULT '0' references nideshop_product,
  "goods_name" varchar(120) NOT NULL DEFAULT '',
  "market_price" decimal(10,2)  NOT NULL DEFAULT '0.00',
  "retail_price" decimal(10,2) NOT NULL DEFAULT '0.00',
  "number" integer  NOT NULL DEFAULT '0',
  "goods_specifition_name_value" text NOT NULL DEFAULT '',
  "goods_specifition_ids" integer NOT NULL DEFAULT '' references nideshop_goods_specification,
  "checked" smallint  NOT NULL DEFAULT '1',
  "list_pic_url" varchar(255) NOT NULL DEFAULT ''
);


-- ----------------------------
-- Table structure for nideshop_comment
-- ----------------------------
DROP TABLE IF EXISTS "nideshop_comment" CASCADE;
CREATE TABLE "nideshop_comment" (
  "id" serial  NOT NULL  PRIMARY KEY,
  "type_id" integer  NOT NULL DEFAULT '0',
  "value_id" integer  NOT NULL DEFAULT '0' references nideshop_goods,
  "content" varchar(6550)  NOT NULL ,
  "add_time" bigint  NOT NULL DEFAULT '0',
  "status" integer  NOT NULL DEFAULT '0',
  "user_id" integer  NOT NULL DEFAULT '0' references nideshop_user,
  "new_content" varchar(6550) NOT NULL DEFAULT ''
) ;

-- ----------------------------
-- Records of nideshop_comment
-- ----------------------------

INSERT INTO "nideshop_comment" VALUES (1, 0, 1181000, '5biD5paZ5b6I5Y6a5a6e77yM6Kem5oSf5LiN6ZSZ77yM5rSX6L+H5LmL5ZCO5LiN57yp5rC05LiN5o6J6Imy', 1493964099, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (2, 0, 1181000, '5paZ5a2Q5b6I6IiS5pyN77yM5YeJ5YeJ55qE77yM6YWN5ZCI6JqV5Lid6KKr77yM5aSP5aSp5b6I5YeJ5b+rfg==', 1494347561, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (3, 0, 1181000, '5LiA55u05Zac5qyi57KX5biD55qE5bqK5LiK55So5ZOB44CC5Yas5pqW5aSP5YeJ44CC6L+Z5aWX55yL6LW35p2l6Z2e5bi45ryC5Lqu44CC5a6e6ZmF5oSf6KeJ5pyJ54K557KX5biD55qE5oSf6KeJ44CC5b6I5aW977yB', 1484961416, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (4, 0, 1006002, 'Mzg5OeW6iu+8jDIzOTnnmb3puYXnu5LooqvvvIw4OTnlm5vku7blpZfjgILnvZHmmJPkuKXpgInmiJHopoHnlq/kuobvvIE=', 1483867801, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (5, 0, 1006002, '5ryC5Lqu', 1478839204, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (6, 0, 1006002, '5Zub5Lu25aWX5bey57uP5pS25YiwIOi/mOayoeS9v+eUqCDkuI3ov4fmiYvmhJ/lvojlpb0g5Lmf5rKh5byC5ZGzIOebuOS/oeS4pemAieeahOecvOWFiSAg5bqU6K+l5LiN5Lya6K6p5oiR5aSx5pyb55qE', 1494383192, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (7, 0, 1006002, '6L+Z5Liq5b6I5rKJ77yM5L2G5piv5ZCM5LiA5aWX5pei5pyJ55m96Imy5Y+I5pyJ5rex6JOd6Imy77yM5oiR55So5LqG5ZC46Imy5biD77yM5omN6YG/5YWN5p+T6Imy77yM5qC55pys5LiN5pWi5LiA6LW35rSX77yM77yM77yM77yM', 1487744838, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (8, 0, 1006002, '54m55Yir5Zac5qyi55qE5bqK5ZOB44CC5ryC5Lqu', 1494548350, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (9, 0, 1006002, '6L+Y5rKh5pyJ5L2/55So77yM55yL6LW35p2l6L+Y5LiN6ZSZ', 1494510472, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (10, 0, 1006002, '5LiN6ZSZ6LSo6YeP5b6I5aW9', 1494474238, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (11, 0, 1006002, '5b6I5aW955yL77yM6LSo6YeP5Lmf5b6I5aW9', 1494386492, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (12, 0, 1006002, '6LaF576O77yM54m55Yir5Zac5qyi', 1493791214, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (13, 0, 1006002, '5oOK6Imz77yB', 1493737798, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (14, 0, 1006002, '6L+Y5rKh5omT5byA77yM57uj6Iqx5LiN6ZSZ44CC', 1493609747, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (15, 0, 1006002, '8J+MuA==', 1493425027, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (16, 0, 1006002, '5p2Q6LSo5aW977yM5peg5ZGz77yM6LWe', 1493273915, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (17, 0, 1006002, '546w5Zyo6YO96L+Y5Zyo55uW552A', 1493143721, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (18, 0, 1006002, '5aSq5Y6a5LqG77yM6LSo6YeP5b6I5aW977yM5Y+q6YCC5ZCI5Yas5aSp', 1492825378, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (19, 0, 1006002, '5a+56L+Z5aWX5bqK5ZOB5Z6C5raO5bey5LmF77yM5L2G5a+55LqO5Lu35qC85Y+I5pyJ54K554qv5ZiA5ZKV77yM6L+Z5qyh6ZmN5Lu377yM5L2/5oiR5LiL5Yaz5b+D5LiL5LqG5Y2V44CC5ou/5Zyo5omL6YeM5rKJ55S455S455qE77yM56WI5oS/5Yir6L6c6LSf6IGK5oiR5a+55Lil6YCJ55qE5pyf5pyb', 1492144961, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (20, 0, 1006002, '56ys5LqM5qyh5Lmw5LqG', 1492836768, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (21, 0, 1006002, '6LSo6YeP5b6I5aW977yM5bCx5piv5aSq55m95LqG77yM5oCq5oCq55qE', 1492750732, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (22, 0, 1006002, '44CC44CC44CC44CC44CC44CC44CC', 1492761421, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (23, 0, 1006002, '5Lil6YCJ6byT5Yqx6K+E5Lu35q+P5LiA5Lu25ZWG5ZOB77yM5oiR5Zac5qyi5Lil6YCJ55qE5Lic6KW/77yM5LiA5aaC5pei5b6A55qE5pSv5oyB77yB', 1491237985, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (24, 0, 1006002, '57Sg6ZuF77yM5Y+q5piv56Gs5Lqb', 1492357791, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (25, 0, 1006002, '576O77yM6Z2i5paZ6IiS5pyN44CC', 1492091712, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (26, 0, 1006002, '5Yi657uj5b6I5ryC5Lqu77yM6Z2e5bi46Z2e5bi45YC844CC', 1492008661, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (27, 0, 1006002, '6LaF57qn5aW955So', 1491712584, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (28, 0, 1006002, '5pyJ54K557Sg77yM5Yi657uj5LiN6ZSZ', 1491524014, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (29, 0, 1006002, '6auY56uv5aSn5rCU5LiK5qGj5qyh44CC5L2O6LCD5aWi5Y2O5pyJ5YaF5ra144CCICDlvojljpog5b6I6YeN', 1491045576, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (30, 0, 1006002, '6Z2e5bi45aW977yM6LSo6YeP77yM', 1490172279, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (31, 0, 1006007, '5b6I5qOS772e5b6I5pyJ6LSo5oSf77yM5Lqn5ZOB5oOz5piv5biC6Z2i5LiK5Y2D5YWD5Lul5LiK55qE5Lqn5ZOB6KeE5qC877yb6KKr5a2Q5L6n6Z2i6L+Y5pyJ5b+D55qE6K6+6K6h5LqG5LiA5q615bCP5ouJ6ZO+5omj5Y+v5Lul55yf5a6e55qE6Kem5pG45Yiw6KKr5a2Q6YeM6Z2i55qE5aGr5YWF54mpLeaYr+e+iuavm++8iOe+iua', 1492447876, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (32, 0, 1006007, '6KGo6Z2i5pG46LW35p2l5b6I6IiS5pyN77yM57q/6YO95aSE55CG5b6X5b6I5aW977yM6YeM6Z2i5pyJ5Lqb5Zyw5pa55aGr5YWF54mp5LiN5aSq5Z2H5YyA', 1478958022, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (33, 0, 1006007, '5YGa5bel55yf55qE5LiN6ZSZ77yM5oiR5amG5amG6K+05pyJ54K556Gs77yM5Y+v6IO95a+55q+U6JqV5Lid6KKr77yM6L+Y5piv5pyJ54K55LiN5LiA5qC344CC5Liq5Lq66KeJ5b6X6L+Y5piv5YC85b6X5Lmw55qE', 1490678816, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (34, 0, 1006007, '6KKr5a2Q5b6I6L275b6I6JaE77yM5LiN5piv5b6I5pqW77yM5Y2X5pa5546w5Zyo5pil5aSpMTjluqblt6blj7PnmoTmsJTmuKnvvIznm5bnnYDmr5TovoPlkIjpgILvvIzlhqzlpKnlho3lhrfngrnogq/lrprlsLHkuI3ooYzkuobjgII=', 1490445729, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (35, 0, 1006007, '6YWN5LiK6ZKI57uH5bi977yM5aal5aal55qE44CC5LiN5Y6a5LiN6JaE5peg5byC5ZGz77yM5Lmf5b6I5Lqy6IKk77yM5ruh5oSP44CC', 1493164402, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (36, 0, 1006007, '6LaF5aSn5LiA5Liq5YyF6KO577yM5qOJ6KKr5pG46LW35p2l5LiN6ZSZ77yM562J5b6F55uW', 1492909481, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (37, 0, 1006007, '5b6I6IiS5pyN55qE56eL5Yas576K5q+b6KKr77yM5LiN5Y6a5LiN6JaE77yM5Lmw5LqG5LiA54K56YO95LiN5ZCO5oKU77yB', 1490836875, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (38, 0, 1006007, '55yL552A5aW977yM5pG4552A5aW977yM6YeN6YeP5oSf6KeJ5Lmf5q2j5aW977yM6L+Y5rKh55uW77yM5bey57uP5aWX5LiK6KKr5aWX77yMNOW5tOWJjeeahOWwj+iiq+WtkOe7iOS6juWPr+S7pemAgOW9ueS6huOAglBTIOmCo+S4gOWdqOaYr+WPquWWte+9ng==', 1491105286, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (39, 0, 1006007, '55uW5LiK5LqGIOi/mOaIkA==', 1492603679, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (40, 0, 1006007, '5aW95aSn5LiA566x5ZWKIOiiq+WtkOWwuuWvuOi/mOaMuuWHhiDlh4blpIfmmZLkuIsg5Y+v5Lul55So5LiA55SoIOS4gOebtOWGrOWkqeebljQrNueahOWQiOiiqyDov5nkuKo15pak55qE5qC35a2QIOS4jeefpemBk+WGrOWkqeWNleebluaYr+S4jeaYr+WlveWGtyDov5jmsqHmnInnm5bov4fnvormr5vooqsg5LyaNeaWpOe+iuavm+i', 1492149347, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (41, 0, 1006007, '6KKr5a2Q5rKh5pyJ5ZGz6YGTIOWMhei+ueW+iOWlvSDlh4nkuobkuKTlpKkg5pio5pmaMTXluqYg552h552A5Y+R54OtIOW+iOi9u+W+iOiIkumAgiDphY3kuIrmsLTmtJfmo4nlm5vku7blpZflkozkuJ3nu5LmnpXlpLQg5a6M576O77yB77yB', 1484640065, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (42, 0, 1006007, '5rKh5pyJ57y654K544CC', 1491546414, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (43, 0, 1006007, '5pW05L2T5ruh5oSP', 1491441655, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (44, 0, 1006007, '55m95aSp5pmS6L+H77yM5LuK5pma5bey55uW5LiK77yM6L+Z5LmF55uW5Yia5aW95ZCI6YCC', 1490798537, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (45, 0, 1006007, '5LiL5Y2V5ZCO56ys5LqM5aSp5pep5LiK6aG65Liw5Yiw6LSn77yM5YWI6LWe5b+r6YCS77yB5YaN6K+06KKr5a2Q77yM5LiA5Y+j5rCU5Lmw5LqGM+W6iuiiq+WtkO+8jOWSjOiAgeWFrOWVhumHj+edgOS4jeWlveWwsemAgOaOie+8jOW8gOeuseWQjuaLv+i1t+adpemDveW+iOayieeahOW+iOacieWIhumHj++8jOWMhei+uei1sOe6v+e', 1491008257, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (46, 0, 1006007, '5YyF6KOF5b6I5aW977yM6KKr5a2Q5b6I5aW977yM5bm/5Lic55qE5Yas5aSp5aSf5LqG', 1490807814, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (47, 0, 1006007, '5LuK5aSp5omN5o2i5LiK77yM5aW95pqW5ZKM44CC6LSo6YeP5q+U5oiR5oOz6LGh5Lit55qE5aW944CC5aW96K+E44CC5biM5pyb5pma5LiK552h6KeJ5pe25LiN6KaB5aSq54Ot5ZWK77yB', 1483152323, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (48, 0, 1006007, '56ef5p2l55qE5oi/IOi/meagt+WwseWkn+S6hg==', 1489457106, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (49, 0, 1006007, '55u45b2T5LiN6ZSZ55qE6KKr5a2Q77yM5Y2X5pa55pil56eL55uW5q2j5aW977yM5Yas5aSp6ZyA6KaB5Yqg5LiA5bqK5q+b5q+v5LiN54S25aSq5Ya344CC', 1487314625, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (50, 0, 1006007, '5p+U6L2v77yM5Y6a5a6e77yM5rKh5pyJ5byC5ZGz77yM5LiN6LeR5q+b77yM5LuO55WZ55qE5bCP5Y+j6IO95riF5qWa55yL5Yiw6YeM6Z2i576K5q+b5ZOB6LSo5b6I5LiN6ZSZ77yM55uW552A5b6I5pqW5ZKM44CC546v5omj5pyJ5YWr5Liq77yM5aWX6KKr5aWX5Lmf5b6I5pa55L6/77yM5LiN55So5ouF5b+D6KKr5aWX6ZSZ5L2N44C', 1488335090, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (51, 0, 1006007, '5YyF6KOd5b6I5aW977yB5omT6ZaL5b6M5pG46JGX6LOq6YeP5Lmf6Z2e5bi45LiN6Yyv77yB5ru/5oSP55qE5LiA5qyh6LO854mp6auU6amXLg==', 1481222099, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (52, 0, 1006007, '55yL5LiK5Y675LiN6ZSZ77yM5aqz5aaH6KaB6L+H5p2l5LqG77yM5Lmw5LqG5Zub5Lu25aWX5ZKM6KKr6Iqv77yM6YO96KaB5o2i5paw55qE57uZ5aW55LiA5Liq5oOK5Zac77yB', 1481765389, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (53, 0, 1006007, '572R5piT5Lmw5LqGMjIww5cyNDDooqvlpZfvvIznu5Pmnpzlm57lrrblj5HnjrDlpKfkuoblj4jmnaXkubDkuobooqvoiq/vvIzlj5HnjrDnvZHmmJPkuKXpgInotKjph4/nnJ/kuI3plJnvvIzlpJrmjqjlh7rnsr7lk4E=', 1481993564, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (54, 0, 1006007, '5LiN6ZSZ5LiN6ZSZ5LiN6ZSZ55qE77yM5Zac5qyi5LiK5Lil6YCJ', 1488416326, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (55, 0, 1006007, '5beo5aSn5peg5q+U55qE566x5a2Q77yM5YGa5bel77yM6LSo5oSf6YO96LaF6LWe77yM5bey57uP6KOF5aW96KKr5aWX77yM55uW5Zyo6Lqr5LiK77yM5YW35L2T5pWI5p6c5aaC5L2V77yM5Zue5aS06L+96K+E', 1481287755, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (56, 0, 1006007, '5oiQ6YO95LqM5pyI5bqV77yM56m66LCD5byAMjXluqbvvIzlpojlpojor7TooqvlrZDlvojmmpblkow=', 1488013807, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (57, 0, 1006007, '5YyF6KOF5b6I57uT5a6e77yM6YeM5LiA5bGC5aSW5LiA5bGC44CC5Lic6KW/5Lmf5b6I5aW95ZOf8J+YhA==', 1487683645, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (58, 0, 1006007, '5Zac5qyi', 1487651942, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (59, 0, 1006007, '6Z2i5paZ5pG46LW35p2l5b6I6IiS5pyN77yM5rKh5pyJ576K5q+b5ZGz77yM5L2G5piv5pyJ54K55paw5biD5paZ55qE5ZGz6YGT44CC6KKr5a2Q5rKh5pyJ576957uS6KKr6L2777yM5L2G5Lmf5LiN566X5Y6a6YeN44CC5aW96K+E77yB', 1479986158, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (60, 0, 1006007, '6Z2e5bi45aW977yM5b6I5pqW5ZKM', 1487495005, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (61, 0, 1006010, '6KKr5a2Q5pS25Yiw5YWI5pm+5pmS5Lik5aSp44CC5rKh5pyJ5byC5ZGz77yM5YGa5bel57K+57uG77yM5omL5oSf5LiN6ZSZ77yM5ou/5LqG5LiA5pKu54On5piv57qv576K5q+b55qE44CC55u45L+h5Lil6YCJ55qE5ZOB6LSo44CC', 1488945838, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (62, 0, 1006010, '6LSo6YeP5b6I5aW977yM6L+Y5rKh55So77yM55yL552A5bCx6Z2e5bi45Zac5qyi77yB', 1493541884, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (63, 0, 1006010, '', 1493099124, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (64, 0, 1006010, '5bC65a+46Juu5aW977yB6LSo5oSf5aW977yB6Z2e5bi45qOS77yB', 1492076696, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (65, 0, 1006010, '5oiR56Gu5a6e5rKh5pyJ5Y+R546w5pyJ5LuA5LmI5byC5ZGz77yM576K5q+b6KKr6Z2e5bi46IiS5pyN77yM57qv5paw576K5q+b5ZOB6LSo6Z2e5bi45aW977yM6L+Z5Liq5Lu35qC85ZWG5Zy66YeM6Z2i5piv5Lmw5LiN5Yiw55qE77yM5o+Q6Iqx5YGa5bel5Lmf6Z2e5bi457K+57uG44CC6YWN5LiK5Y675bm05Lmw55qE5bqK5Y2V77y', 1491134002, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (66, 0, 1006010, '5pS25Yiw5LqG77yM6L+Y5rKh55So', 1489546020, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (67, 0, 1006010, '5YyF6KOF55uS5a2Q5b6I5aSn44CCCuWSjOWbm+S7tuWll+S4gOi1t+S5sOeahO+8jOWFiOaZkuaZkuWGjeWll+S4iuOAgg==', 1486770266, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (68, 0, 1006010, '5Y+R6LSn5b6I5b+r77yM5pyN5Yqh5b6I5aW977yB', 1488252963, 0, 1, '');
INSERT INTO "nideshop_comment" VALUES (69, 0, 1006010, '6LaF5Zac5qyi77yM5pmS5LiA5pmS77yM5bCx5YeG5aSH5o2i5LiK55So5LqG77yB', 1487582754, 0, 1, '');

-- 插入了3条

-- ----------------------------
-- Table structure for nideshop_comment_picture
-- ----------------------------
DROP TABLE IF EXISTS "nideshop_comment_picture" CASCADE;
CREATE TABLE "nideshop_comment_picture" (
  "id" serial NOT NULL  PRIMARY KEY,
  "comment_id" integer  NOT NULL DEFAULT '0' references nideshop_comment,
  "pic_url" varchar(255) NOT NULL DEFAULT '',
  "sort_order" smallint  NOT NULL DEFAULT '5'
);

-- ----------------------------
-- Records of nideshop_comment_picture
-- ----------------------------
INSERT INTO "nideshop_comment_picture" VALUES (1, 1, 'https://yanxuan.nosdn.127.net/218783173f303ec6d8766810951d0790.jpg', 5);
INSERT INTO "nideshop_comment_picture" VALUES (2, 2, 'https://yanxuan.nosdn.127.net/33978a0d6f56d94c45e4fc594b4b8606.jpg', 5);
INSERT INTO "nideshop_comment_picture" VALUES (3, 3, 'https://yanxuan.nosdn.127.net/d3975d1b6d88e9f9d762cd9a879d1a14.jpg', 5);
INSERT INTO "nideshop_comment_picture" VALUES (4, 4, 'https://yanxuan.nosdn.127.net/7215309e93c48cca08ca6910194eb3b0.jpg', 5);
INSERT INTO "nideshop_comment_picture" VALUES (5, 5, 'http://yanxuan.nosdn.127.net/d85a556893919038b56a95b71c9a1228.jpg', 5);
INSERT INTO "nideshop_comment_picture" VALUES (6, 32, 'http://yanxuan.nosdn.127.net/1637021a44433992f403a4b925401a3b.jpg', 5);
INSERT INTO "nideshop_comment_picture" VALUES (7, 32, 'http://yanxuan.nosdn.127.net/5fd615a8f21050ac8f20a542f8e688a1.jpg', 5);
INSERT INTO "nideshop_comment_picture" VALUES (8, 32, 'http://yanxuan.nosdn.127.net/968836b81e80750944ca350808763281.jpg', 5);
INSERT INTO "nideshop_comment_picture" VALUES (9, 33, 'http://yanxuan.nosdn.127.net/1943a9a6a203fa2ff56bc0800ed5cbfd.png', 5);
INSERT INTO "nideshop_comment_picture" VALUES (10, 34, 'https://yanxuan.nosdn.127.net/b8b063c9b0199ed290f4b3ca49bf4b6c.jpg', 5);
INSERT INTO "nideshop_comment_picture" VALUES (11, 35, 'https://yanxuan.nosdn.127.net/f0ec4c28b64d4b676ba629c1fb006429.jpg', 5);

-- 插入了48行


-- ----------------------------
-- Table structure for nideshop_order
-- ----------------------------
DROP TABLE IF EXISTS "nideshop_order" CASCADE;
CREATE TABLE "nideshop_order" (
  "id" serial  NOT NULL  PRIMARY KEY,
  "order_sn" varchar(20) NOT NULL DEFAULT '',
  "user_id" integer  NOT NULL DEFAULT '0' references nideshop_user,
  "order_status" smallint  NOT NULL DEFAULT '0',
  "shipping_status" smallint  NOT NULL DEFAULT '0',
  "pay_status" smallint  NOT NULL DEFAULT '0',
  "consignee" varchar(60) NOT NULL DEFAULT '',
  "country" integer  NOT NULL DEFAULT '1' references nideshop_region,
  "province" integer  NOT NULL DEFAULT '1' references nideshop_region,
  "city" integer  NOT NULL DEFAULT '1' references nideshop_region,
  "district" integer  NOT NULL DEFAULT '1' references nideshop_region,
  "address" varchar(255) NOT NULL DEFAULT '',
  "mobile" varchar(60) NOT NULL DEFAULT '',
  "postscript" varchar(255) NOT NULL DEFAULT '',
  "shipping_fee" decimal(10,2) NOT NULL DEFAULT '0.00',
  "pay_name" varchar(120) NOT NULL DEFAULT '',
  "pay_id" integer NOT NULL DEFAULT '0',
  "actual_price" decimal(10,2) NOT NULL DEFAULT '0.00' ,
  "integral" integer NOT NULL DEFAULT '0',
  "integral_money" decimal(10,2) NOT NULL DEFAULT '0.00',
  "order_price" decimal(10,2) NOT NULL DEFAULT '0.00' ,
  "goods_price" decimal(10,2) NOT NULL DEFAULT '0.00' ,
  "add_time" integer  NOT NULL DEFAULT '0',
  "confirm_time" integer  NOT NULL DEFAULT '0',
  "pay_time" integer  NOT NULL DEFAULT '0',
  "freight_price" integer  NOT NULL DEFAULT '0' ,
  "coupon_id" integer  NOT NULL DEFAULT '0' ,
  "parent_id" integer  NOT NULL DEFAULT '0',
  "coupon_price" decimal(10,2) NOT NULL DEFAULT '0.00',
  "callback_status" text NOT NULL DEFAULT 'true'
) ;

INSERT INTO "nideshop_order" (id) VALUES (0);


-- ----------------------------
-- Table structure for nideshop_order_express
-- ----------------------------
DROP TABLE IF EXISTS "nideshop_order_express" CASCADE;
CREATE TABLE "nideshop_order_express" (
  "id" serial  NOT NULL  PRIMARY KEY,
  "order_id" integer  NOT NULL DEFAULT '0'  references nideshop_order,
  "shipper_id" integer  NOT NULL DEFAULT '0',
  "shipper_name" varchar(120) NOT NULL DEFAULT '' ,
  "shipper_code" varchar(60) NOT NULL DEFAULT '' ,
  "logistic_code" varchar(20) NOT NULL DEFAULT '' ,
  "traces" varchar(2000) NOT NULL DEFAULT '' ,
  "is_finish" smallint NOT NULL DEFAULT '0',
  "request_count" integer DEFAULT '0' ,
  "request_time" integer DEFAULT '0' ,
  "add_time" integer NOT NULL DEFAULT '0' ,
  "update_time" integer NOT NULL DEFAULT '0' 
) ;

-- ----------------------------
-- Table structure for nideshop_order_goods
-- ----------------------------
DROP TABLE IF EXISTS "nideshop_order_goods" CASCADE;
CREATE TABLE "nideshop_order_goods" (
  "id" serial  NOT NULL  PRIMARY KEY,
  "order_id" integer  NOT NULL DEFAULT '0' references nideshop_order,
  "goods_id" integer  NOT NULL DEFAULT '0' references nideshop_goods,
  "goods_name" varchar(120) NOT NULL DEFAULT '',
  "goods_sn" varchar(60) NOT NULL DEFAULT '',
  "product_id" integer  NOT NULL DEFAULT '0' references nideshop_product,
  "number" integer  NOT NULL DEFAULT '1',
  "market_price" decimal(10,2) NOT NULL DEFAULT '0.00',
  "retail_price" decimal(10,2) NOT NULL DEFAULT '0.00',
  "goods_specifition_name_value" text NOT NULL,
  "is_real" smallint  NOT NULL DEFAULT '0',
  "goods_specifition_ids" integer NOT NULL DEFAULT '0' references nideshop_goods_specification,
  "list_pic_url" varchar(255) NOT NULL DEFAULT ''
) ;




-- ----------------------------
-- Table structure for nideshop_topic_category
-- ----------------------------
DROP TABLE IF EXISTS "nideshop_topic_category" CASCADE;
CREATE TABLE "nideshop_topic_category" (
  "id" serial NOT NULL  PRIMARY KEY,
  "title" varchar(255) NOT NULL DEFAULT '',
  "pic_url" varchar(255) NOT NULL DEFAULT ''
) ;

-- ----------------------------
-- Records of nideshop_topic_category
-- ----------------------------
INSERT INTO "nideshop_topic_category" VALUES (0, '测试严选', 'https://yanxuan.nosdn.127.net/dc1b671ad54e16339f1b26cfeec6a1ea.jpg');

INSERT INTO "nideshop_topic_category" VALUES (1, '严选幕后', 'https://yanxuan.nosdn.127.net/dc1b671ad54e16339f1b26cfeec6a1ea.jpg');
INSERT INTO "nideshop_topic_category" VALUES (2, '丁磊私物推荐', 'https://yanxuan.nosdn.127.net/1de4da49367dd7c01af1f7a2b23b0237.jpg');
INSERT INTO "nideshop_topic_category" VALUES (3, '特色系列', 'https://yanxuan.nosdn.127.net/14939888170021096.png');
INSERT INTO "nideshop_topic_category" VALUES (4, '明星商品', 'https://yanxuan.nosdn.127.net/14939888168151095.png');
INSERT INTO "nideshop_topic_category" VALUES (5, '严选推荐', 'https://yanxuan.nosdn.127.net/d943675462a06f817d33062d4eb059f5.jpg');








-- ----------------------------
-- Table structure for nideshop_topic
-- ----------------------------
DROP TABLE IF EXISTS "nideshop_topic" CASCADE;
CREATE TABLE "nideshop_topic" (
  "id" serial NOT NULL  PRIMARY KEY,
  "title" varchar(255) NOT NULL DEFAULT '''''',
  "content" text,
  "avatar" varchar(255) NOT NULL DEFAULT '',
  "item_pic_url" varchar(255) NOT NULL DEFAULT '',
  "subtitle" varchar(255) NOT NULL DEFAULT '''',
  "topic_category_id" integer  NOT NULL DEFAULT '0' references nideshop_topic_category,
  "price_info" decimal(10,2)  NOT NULL DEFAULT '0.00',
  "read_count" varchar(255) NOT NULL DEFAULT '0',
  "scene_pic_url" varchar(255) NOT NULL DEFAULT '',
  "topic_template_id" integer  NOT NULL DEFAULT '0',
  "topic_tag_id" integer  NOT NULL DEFAULT '0',
  "sort_order" integer  NOT NULL DEFAULT '100',
  "is_show" smallint  NOT NULL DEFAULT '1'
) ;

-- ----------------------------
-- Records of nideshop_topic
-- ----------------------------

INSERT INTO "nideshop_topic" VALUES (314, '关爱他成长的每一个足迹', '<img src=\"//yanxuan.nosdn.127.net/75c55a13fde5eb2bc2dd6813b4c565cc.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/e27e1de2b271a28a21c10213b9df7e95.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/9d413d1d28f753cb19096b533d53418d.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/64b0f2f350969e9818a3b6c43c217325.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/a668e6ae7f1fa45565c1eac221787570.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/0d4004e19728f2707f08f4be79bbc774.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/79ee021bbe97de7ecda691de6787241f.jpg\">', 'https://yanxuan.nosdn.127.net/14943186689221563.png', 'https://yanxuan.nosdn.127.net/14943267735961674.jpg', '专业运动品牌同厂，毛毛虫鞋买二送一', 2, 0.00, '6.4k', 'https://yanxuan.nosdn.127.net/14943267735961674.jpg', 0, 0, 1, 1);
INSERT INTO "nideshop_topic" VALUES (313, '一次解决5个节日送礼难题', '<img src=\"//yanxuan.nosdn.127.net/75c55a13fde5eb2bc2dd6813b4c565cc.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/e27e1de2b271a28a21c10213b9df7e95.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/9d413d1d28f753cb19096b533d53418d.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/64b0f2f350969e9818a3b6c43c217325.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/a668e6ae7f1fa45565c1eac221787570.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/0d4004e19728f2707f08f4be79bbc774.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/79ee021bbe97de7ecda691de6787241f.jpg\">', 'https://yanxuan.nosdn.127.net/14942967243991290.png', 'https://yanxuan.nosdn.127.net/14942996754171334.jpg', '这些就是他们想要的礼物清单', 0, 59.90, '7.8k', 'https://yanxuan.nosdn.127.net/14942996754171334.jpg', 0, 0, 0, 1);
INSERT INTO "nideshop_topic" VALUES (300, '秒杀化学洗涤剂的纯天然皂', '<img src=\"//yanxuan.nosdn.127.net/75c55a13fde5eb2bc2dd6813b4c565cc.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/e27e1de2b271a28a21c10213b9df7e95.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/9d413d1d28f753cb19096b533d53418d.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/64b0f2f350969e9818a3b6c43c217325.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/a668e6ae7f1fa45565c1eac221787570.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/0d4004e19728f2707f08f4be79bbc774.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/79ee021bbe97de7ecda691de6787241f.jpg\">', 'https://yanxuan.nosdn.127.net/14939843011001088.png', 'https://yanxuan.nosdn.127.net/14939843143621089.jpg', '前段时间有朋友跟我抱怨，和婆婆住到一起才发现生活理念有太多不和。别的不提，光是洗...', 1, 0.00, '15.3k', 'https://yanxuan.nosdn.127.net/14939843143621089.jpg', 0, 0, 0, 1);
INSERT INTO "nideshop_topic" VALUES (299, '买过的人都说它是差旅神器', '<img src=\"//yanxuan.nosdn.127.net/75c55a13fde5eb2bc2dd6813b4c565cc.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/e27e1de2b271a28a21c10213b9df7e95.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/9d413d1d28f753cb19096b533d53418d.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/64b0f2f350969e9818a3b6c43c217325.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/a668e6ae7f1fa45565c1eac221787570.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/0d4004e19728f2707f08f4be79bbc774.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/79ee021bbe97de7ecda691de6787241f.jpg\">', 'https://yanxuan.nosdn.127.net/14938873720850678.png', 'https://yanxuan.nosdn.127.net/14938873919030679.jpg', '许多人经历过旅途中内裤洗晾不便的烦恼，尤其与旅伴同居一室时，晾在卫生间里的内裤更...', 1, 0.00, '28.7k', 'https://yanxuan.nosdn.127.net/14938873919030679.jpg', 0, 0, 0, 1);
INSERT INTO "nideshop_topic" VALUES (295, '他们在严选遇见的新生活', '<img src=\"//yanxuan.nosdn.127.net/75c55a13fde5eb2bc2dd6813b4c565cc.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/e27e1de2b271a28a21c10213b9df7e95.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/9d413d1d28f753cb19096b533d53418d.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/64b0f2f350969e9818a3b6c43c217325.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/a668e6ae7f1fa45565c1eac221787570.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/0d4004e19728f2707f08f4be79bbc774.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/79ee021bbe97de7ecda691de6787241f.jpg\">', 'https://yanxuan.nosdn.127.net/14937987677390284.png', 'https://yanxuan.nosdn.127.net/14938092956370380.jpg', '多款商品直减中，最高直减400元', 0, 35.80, '36.6k', 'https://yanxuan.nosdn.127.net/14938092956370380.jpg', 0, 0, 0, 1);
INSERT INTO "nideshop_topic" VALUES (294, '这只锅，可以从祖母用到孙辈', '<img src=\"//yanxuan.nosdn.127.net/75c55a13fde5eb2bc2dd6813b4c565cc.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/e27e1de2b271a28a21c10213b9df7e95.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/9d413d1d28f753cb19096b533d53418d.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/64b0f2f350969e9818a3b6c43c217325.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/a668e6ae7f1fa45565c1eac221787570.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/0d4004e19728f2707f08f4be79bbc774.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/79ee021bbe97de7ecda691de6787241f.jpg\">', 'https://yanxuan.nosdn.127.net/14937214529340142.png', 'https://yanxuan.nosdn.127.net/14937214454750141.jpg', '买100年传世珐琅锅送迷你马卡龙色小锅', 4, 149.00, '108.1k', 'https://yanxuan.nosdn.127.net/14937214454750141.jpg', 0, 0, 0, 1);
INSERT INTO "nideshop_topic" VALUES (291, '舒适新主张', '<img src=\"//yanxuan.nosdn.127.net/75c55a13fde5eb2bc2dd6813b4c565cc.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/e27e1de2b271a28a21c10213b9df7e95.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/9d413d1d28f753cb19096b533d53418d.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/64b0f2f350969e9818a3b6c43c217325.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/a668e6ae7f1fa45565c1eac221787570.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/0d4004e19728f2707f08f4be79bbc774.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/79ee021bbe97de7ecda691de6787241f.jpg\">', 'https://yanxuan.nosdn.127.net/14933596154560938.png', 'https://yanxuan.nosdn.127.net/14939496197300723.jpg', '如何挑选适合自己的好物？', 0, 29.00, '67.8k', 'https://yanxuan.nosdn.127.net/14939496197300723.jpg', 0, 0, 0, 1);
INSERT INTO "nideshop_topic" VALUES (289, '专业运动袜也可以高性价比', '<img src=\"//yanxuan.nosdn.127.net/75c55a13fde5eb2bc2dd6813b4c565cc.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/e27e1de2b271a28a21c10213b9df7e95.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/9d413d1d28f753cb19096b533d53418d.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/64b0f2f350969e9818a3b6c43c217325.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/a668e6ae7f1fa45565c1eac221787570.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/0d4004e19728f2707f08f4be79bbc774.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/79ee021bbe97de7ecda691de6787241f.jpg\">', 'https://yanxuan.nosdn.127.net/14932840884890614.png', 'https://yanxuan.nosdn.127.net/14932840600970609.jpg', '越来越多运动人士意识到，运动鞋要购置好的，鞋里的运动袜也不可忽视。专业运动袜帮助...', 1, 0.00, '11.9k', 'https://yanxuan.nosdn.127.net/14932840600970609.jpg', 0, 0, 0, 1);
INSERT INTO "nideshop_topic" VALUES (287, '严选新式样板间', '<img src=\"//yanxuan.nosdn.127.net/75c55a13fde5eb2bc2dd6813b4c565cc.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/e27e1de2b271a28a21c10213b9df7e95.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/9d413d1d28f753cb19096b533d53418d.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/64b0f2f350969e9818a3b6c43c217325.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/a668e6ae7f1fa45565c1eac221787570.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/0d4004e19728f2707f08f4be79bbc774.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/79ee021bbe97de7ecda691de6787241f.jpg\">', 'https://yanxuan.nosdn.127.net/14931133750100134.png', 'https://yanxuan.nosdn.127.net/14931970965550315.jpg', '一种软装一个家', 3, 29.90, '55.6k', 'https://yanxuan.nosdn.127.net/14931970965550315.jpg', 0, 0, 0, 1);
INSERT INTO "nideshop_topic" VALUES (286, '无“油”无虑的甜蜜酥脆', '<img src=\"//yanxuan.nosdn.127.net/75c55a13fde5eb2bc2dd6813b4c565cc.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/e27e1de2b271a28a21c10213b9df7e95.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/9d413d1d28f753cb19096b533d53418d.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/64b0f2f350969e9818a3b6c43c217325.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/a668e6ae7f1fa45565c1eac221787570.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/0d4004e19728f2707f08f4be79bbc774.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/79ee021bbe97de7ecda691de6787241f.jpg\">', 'https://yanxuan.nosdn.127.net/14931121505610125.png', 'https://yanxuan.nosdn.127.net/14931121822100127.jpg', '大家都知道，饮食组是严选体重最重的一组，基本上每个新人都能在一个月之内迅速长胖。...', 1, 0.00, '15.6k', 'https://yanxuan.nosdn.127.net/14931121822100127.jpg', 0, 0, 0, 1);
INSERT INTO "nideshop_topic" VALUES (281, '条纹新风尚', '<img src=\"//yanxuan.nosdn.127.net/75c55a13fde5eb2bc2dd6813b4c565cc.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/e27e1de2b271a28a21c10213b9df7e95.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/9d413d1d28f753cb19096b533d53418d.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/64b0f2f350969e9818a3b6c43c217325.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/a668e6ae7f1fa45565c1eac221787570.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/0d4004e19728f2707f08f4be79bbc774.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/79ee021bbe97de7ecda691de6787241f.jpg\">', 'https://yanxuan.nosdn.127.net/14926859949660827.png', 'https://yanxuan.nosdn.127.net/14926859849200826.jpg', '经典百搭，时尚线条', 3, 29.00, '76.5k', 'https://yanxuan.nosdn.127.net/14926859849200826.jpg', 0, 0, 0, 1);
INSERT INTO "nideshop_topic" VALUES (282, '成就一室笋香', '<img src=\"//yanxuan.nosdn.127.net/75c55a13fde5eb2bc2dd6813b4c565cc.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/e27e1de2b271a28a21c10213b9df7e95.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/9d413d1d28f753cb19096b533d53418d.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/64b0f2f350969e9818a3b6c43c217325.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/a668e6ae7f1fa45565c1eac221787570.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/0d4004e19728f2707f08f4be79bbc774.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/79ee021bbe97de7ecda691de6787241f.jpg\">', 'https://yanxuan.nosdn.127.net/14927695155801070.png', 'https://yanxuan.nosdn.127.net/14927695046601069.jpg', '三石哥办公室常备小食推荐', 2, 12.00, '40.9k', 'https://yanxuan.nosdn.127.net/14927695046601069.jpg', 0, 0, 0, 1);
INSERT INTO "nideshop_topic" VALUES (283, '孩子成长中少不了的一双鞋', '<img src=\"//yanxuan.nosdn.127.net/75c55a13fde5eb2bc2dd6813b4c565cc.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/e27e1de2b271a28a21c10213b9df7e95.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/9d413d1d28f753cb19096b533d53418d.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/64b0f2f350969e9818a3b6c43c217325.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/a668e6ae7f1fa45565c1eac221787570.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/0d4004e19728f2707f08f4be79bbc774.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/79ee021bbe97de7ecda691de6787241f.jpg\">', 'https://yanxuan.nosdn.127.net/14927748094971079.png', 'https://yanxuan.nosdn.127.net/14927748974441080.jpg', '说起毛毛虫鞋，好处实在太多了，作为一个2岁孩子的宝妈选品员，按捺不住想告诉大家，...', 1, 0.00, '42.5k', 'https://yanxuan.nosdn.127.net/14927748974441080.jpg', 0, 0, 0, 1);
INSERT INTO "nideshop_topic" VALUES (277, '治愈生活的满怀柔软', '<img src=\"//yanxuan.nosdn.127.net/75c55a13fde5eb2bc2dd6813b4c565cc.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/e27e1de2b271a28a21c10213b9df7e95.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/9d413d1d28f753cb19096b533d53418d.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/64b0f2f350969e9818a3b6c43c217325.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/a668e6ae7f1fa45565c1eac221787570.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/0d4004e19728f2707f08f4be79bbc774.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/79ee021bbe97de7ecda691de6787241f.jpg\">', 'https://yanxuan.nosdn.127.net/14926748590030593.png', 'https://yanxuan.nosdn.127.net/14926737925770587.jpg', '太鼓抱枕的上架历程，是从失踪开始的。由于表面的绒感，最初它被安排在秋冬季上架。某...', 1, 0.00, '19.6k', 'https://yanxuan.nosdn.127.net/14926737925770587.jpg', 0, 0, 0, 1);
INSERT INTO "nideshop_topic" VALUES (274, '没有软木拖，怎么过夏天', '<img src=\"//yanxuan.nosdn.127.net/75c55a13fde5eb2bc2dd6813b4c565cc.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/e27e1de2b271a28a21c10213b9df7e95.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/9d413d1d28f753cb19096b533d53418d.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/64b0f2f350969e9818a3b6c43c217325.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/a668e6ae7f1fa45565c1eac221787570.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/0d4004e19728f2707f08f4be79bbc774.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/79ee021bbe97de7ecda691de6787241f.jpg\">', 'https://yanxuan.nosdn.127.net/14925821004620235.png', 'https://yanxuan.nosdn.127.net/14925822213780237.jpg', '刚入四月，杭州的气温就已升高至30度。店庆时买了软木拖的用户，陆续发回评价说，很...', 1, 0.00, '46.4k', 'https://yanxuan.nosdn.127.net/14925822213780237.jpg', 0, 0, 0, 1);
INSERT INTO "nideshop_topic" VALUES (272, '料理也要精细简单', '<img src=\"//yanxuan.nosdn.127.net/75c55a13fde5eb2bc2dd6813b4c565cc.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/e27e1de2b271a28a21c10213b9df7e95.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/9d413d1d28f753cb19096b533d53418d.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/64b0f2f350969e9818a3b6c43c217325.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/a668e6ae7f1fa45565c1eac221787570.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/0d4004e19728f2707f08f4be79bbc774.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/79ee021bbe97de7ecda691de6787241f.jpg\">', 'https://yanxuan.nosdn.127.net/14925201467400187.png', 'https://yanxuan.nosdn.127.net/14925200530030186.jpg', '享受天然的味道，日子每天都好新鲜', 2, 69.00, '125.6k', 'https://yanxuan.nosdn.127.net/14925200530030186.jpg', 0, 0, 0, 1);
INSERT INTO "nideshop_topic" VALUES (271, '选式新懒人', '<img src=\"//yanxuan.nosdn.127.net/75c55a13fde5eb2bc2dd6813b4c565cc.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/e27e1de2b271a28a21c10213b9df7e95.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/9d413d1d28f753cb19096b533d53418d.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/64b0f2f350969e9818a3b6c43c217325.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/a668e6ae7f1fa45565c1eac221787570.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/0d4004e19728f2707f08f4be79bbc774.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/79ee021bbe97de7ecda691de6787241f.jpg\">', 'https://yanxuan.nosdn.127.net/14924199159971698.png', 'https://yanxuan.nosdn.127.net/14924199099661697.jpg', '懒出格调，懒出好生活。', 3, 15.00, '57.7k', 'https://yanxuan.nosdn.127.net/14924199099661697.jpg', 0, 0, 0, 1);
INSERT INTO "nideshop_topic" VALUES (268, '米饭好吃的秘诀：会呼吸的锅', '<img src=\"//yanxuan.nosdn.127.net/75c55a13fde5eb2bc2dd6813b4c565cc.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/e27e1de2b271a28a21c10213b9df7e95.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/9d413d1d28f753cb19096b533d53418d.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/64b0f2f350969e9818a3b6c43c217325.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/a668e6ae7f1fa45565c1eac221787570.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/0d4004e19728f2707f08f4be79bbc774.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/79ee021bbe97de7ecda691de6787241f.jpg\">', 'https://yanxuan.nosdn.127.net/14920712417610604.png', 'https://yanxuan.nosdn.127.net/14920623353130483.jpg', '今年1月份，我们联系到了日本伊贺地区的长谷园，那里有着180年伊贺烧历史的窑厂。...', 1, 0.00, '33.3k', 'https://yanxuan.nosdn.127.net/14920623353130483.jpg', 0, 0, 0, 1);
INSERT INTO "nideshop_topic" VALUES (266, '一条丝巾就能提升时髦度', '<img src=\"//yanxuan.nosdn.127.net/75c55a13fde5eb2bc2dd6813b4c565cc.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/e27e1de2b271a28a21c10213b9df7e95.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/9d413d1d28f753cb19096b533d53418d.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/64b0f2f350969e9818a3b6c43c217325.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/a668e6ae7f1fa45565c1eac221787570.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/0d4004e19728f2707f08f4be79bbc774.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/79ee021bbe97de7ecda691de6787241f.jpg\">', 'https://yanxuan.nosdn.127.net/14919005600900208.png', 'https://yanxuan.nosdn.127.net/14919007135160213.jpg', '不知道大家对去年G20时，严选与国礼制造商一起推出的《凤凰于飞》等几款丝巾是否还...', 1, 0.00, '35.0k', 'https://yanxuan.nosdn.127.net/14919007135160213.jpg', 0, 0, 0, 1);
INSERT INTO "nideshop_topic" VALUES (264, '设计师们推荐的应季好物', '<img src=\"//yanxuan.nosdn.127.net/75c55a13fde5eb2bc2dd6813b4c565cc.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/e27e1de2b271a28a21c10213b9df7e95.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/9d413d1d28f753cb19096b533d53418d.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/64b0f2f350969e9818a3b6c43c217325.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/a668e6ae7f1fa45565c1eac221787570.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/0d4004e19728f2707f08f4be79bbc774.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/79ee021bbe97de7ecda691de6787241f.jpg\">', 'https://yanxuan.nosdn.127.net/14920662001560500.png', 'https://yanxuan.nosdn.127.net/14918201901050274.jpg', '原创设计春款系列上新', 0, 29.90, '77.7k', 'https://yanxuan.nosdn.127.net/14918201901050274.jpg', 0, 0, 0, 1);




-- ----------------------------
-- Table structure for nideshop_user_coupon
-- ----------------------------
DROP TABLE IF EXISTS "nideshop_user_coupon" CASCADE;
CREATE TABLE "nideshop_user_coupon" (
  "id" serial  NOT NULL  PRIMARY KEY,
  "coupon_id" integer  NOT NULL DEFAULT '0' references nideshop_coupon,
  "coupon_number" varchar(20) NOT NULL DEFAULT '',
  "user_id" integer  NOT NULL DEFAULT '0' references nideshop_user,
  "used_time" integer  NOT NULL DEFAULT '0',
  "order_id" integer  NOT NULL DEFAULT '0'
) ;

-- ----------------------------
-- Records of nideshop_user_coupon
-- ----------------------------

INSERT INTO "nideshop_user_coupon" VALUES (1, 3, '0', 1, 1242142681, 4);
INSERT INTO "nideshop_user_coupon" VALUES (2, 4, '1000003379', 1, 1242976699, 14);
INSERT INTO "nideshop_user_coupon" VALUES (3, 4, '1000018450', 0, 0, 0);
INSERT INTO "nideshop_user_coupon" VALUES (4, 4, '1000023774', 0, 0, 0);
INSERT INTO "nideshop_user_coupon" VALUES (5, 4, '1000039394', 0, 0, 0);
INSERT INTO "nideshop_user_coupon" VALUES (6, 4, '1000049305', 0, 0, 0);
INSERT INTO "nideshop_user_coupon" VALUES (7, 4, '1000052248', 0, 0, 0);
INSERT INTO "nideshop_user_coupon" VALUES (8, 4, '1000061542', 0, 0, 0);
INSERT INTO "nideshop_user_coupon" VALUES (9, 4, '1000070278', 0, 0, 0);
INSERT INTO "nideshop_user_coupon" VALUES (10, 4, '1000080588', 0, 0, 0);
INSERT INTO "nideshop_user_coupon" VALUES (11, 4, '1000091405', 0, 0, 0);
INSERT INTO "nideshop_user_coupon" VALUES (24, 3, '0', 1, 0, 0);
INSERT INTO "nideshop_user_coupon" VALUES (25, 3, '0', 1, 0, 0);
INSERT INTO "nideshop_user_coupon" VALUES (26, 3, '0', 1, 0, 0);
INSERT INTO "nideshop_user_coupon" VALUES (27, 3, '0', 1, 0, 0);
INSERT INTO "nideshop_user_coupon" VALUES (28, 3, '0', 1, 0, 0);
INSERT INTO "nideshop_user_coupon" VALUES (29, 3, '0', 1, 0, 0);
INSERT INTO "nideshop_user_coupon" VALUES (30, 3, '0', 1, 0, 0);
INSERT INTO "nideshop_user_coupon" VALUES (31, 3, '0', 1, 0, 0);



-- ----------------------------
-- Table structure for nideshop_collect
-- ----------------------------
DROP TABLE IF EXISTS "nideshop_collect" CASCADE;
CREATE TABLE "nideshop_collect" (
  "id" serial  NOT NULL  PRIMARY KEY,
  "user_id" integer  NOT NULL DEFAULT '0' references nideshop_user,
  "value_id" integer  NOT NULL DEFAULT '0' references nideshop_goods,
  "add_time" integer  NOT NULL DEFAULT '0',
  "is_attention" smallint NOT NULL DEFAULT '0',
  "type_id" smallint  NOT NULL DEFAULT '0'
);

-- ----------------------------
-- Records of nideshop_collect
-- ----------------------------
INSERT INTO "nideshop_collect" VALUES (17, 1, 1181000, 1495381237, 0, 0);
INSERT INTO "nideshop_collect" VALUES (18, 1, 1015007, 1495466325, 0, 0);
INSERT INTO "nideshop_collect" VALUES (19, 1, 1152161, 1495970357, 0, 0);
INSERT INTO "nideshop_collect" VALUES (21, 1, 1156006, 1497685421, 0, 0);
INSERT INTO "nideshop_collect" VALUES (47, 11, 1009012, 1500987979, 0, 0);
INSERT INTO "nideshop_collect" VALUES (44, 11, 1134030, 1500987695, 0, 0);
INSERT INTO "nideshop_collect" VALUES (33, 11, 1015007, 1500823262, 0, 0);
INSERT INTO "nideshop_collect" VALUES (31, 11, 1011004, 1500822827, 0, 0);

-- ----------------------------
-- Table structure for nideshop_feedback
-- ----------------------------
DROP TABLE IF EXISTS "nideshop_feedback" CASCADE;
CREATE TABLE "nideshop_feedback" (
  "msg_id" serial  NOT NULL  PRIMARY KEY,
  "parent_id" integer  NOT NULL DEFAULT '0',
  "user_id" integer  NOT NULL DEFAULT '0' references nideshop_user,
  "user_name" varchar(60) NOT NULL DEFAULT '',
  "user_email" varchar(60) NOT NULL DEFAULT '',
  "msg_title" varchar(200) NOT NULL DEFAULT '',
  "msg_type" smallint  NOT NULL DEFAULT '0',
  "msg_status" smallint  NOT NULL DEFAULT '0',
  "msg_content" text NOT NULL,
  "msg_time" integer  NOT NULL DEFAULT '0',
  "message_img" varchar(255) NOT NULL DEFAULT '0',
  "order_id" integer  NOT NULL DEFAULT '0' references nideshop_order,
  "msg_area" smallint  NOT NULL DEFAULT '0'
) ;

-- ----------------------------
-- Records of nideshop_feedback
-- ----------------------------
INSERT INTO "nideshop_feedback" VALUES (1, 0, 1, 'nideshop', 'nideshop@nideshop.com', '三星SGH-F258什么时候到', 4, 0, '三星SGH-F258什么时候有货', 1242107197, '', 0, 0);

-- ----------------------------
-- Table structure for nideshop_footprint
-- ----------------------------
DROP TABLE IF EXISTS "nideshop_footprint" CASCADE;
CREATE TABLE "nideshop_footprint" (
  "id" serial NOT NULL  PRIMARY KEY,
  "user_id" integer NOT NULL DEFAULT '0' references nideshop_user,
  "goods_id" integer NOT NULL DEFAULT '0' references nideshop_goods,
  "add_time" integer NOT NULL DEFAULT '0'
) ;


-- SET FOREIGN_KEY_CHECKS = 1;
