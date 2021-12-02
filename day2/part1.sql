SOURCE input.sql;

DROP PROCEDURE IF EXISTS `aoc_part1`;
DELIMITER $$
CREATE PROCEDURE `aoc_part1`()
BEGIN
    UPDATE `aoc_input` SET `val` = -`val` WHERE `dir` = 'up';
    SELECT sum(`val`) INTO @depth FROM `aoc_input` WHERE `dir` <> 'forward';
    SELECT sum(`val`) INTO @horizontal FROM `aoc_input` WHERE `dir` = 'forward';
    SELECT @depth * @horizontal AS `[Part 1] Result:`;
END$$
DELIMITER ;

CALL `aoc_part1`;
