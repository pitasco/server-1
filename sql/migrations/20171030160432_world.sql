DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171030160432');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171030160432');
-- Add your query below.

-- Remove Idol of Brutality from creature loot template. It should only drop by Magistrate Barthilas which has a reference loot template.
DELETE FROM `creature_loot_template` WHERE `item` = '23198';

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
