SOURCE input.sql;

DROP PROCEDURE IF EXISTS `aoc_part2`;
DELIMITER $$
CREATE PROCEDURE `aoc_part2`()
BEGIN
    UPDATE `aoc_input` SET `val` = -`val` WHERE `dir` = 'up';
    SET @depth = 0, @aim = 0, @i = 0;
    SELECT COUNT(*) INTO @len FROM `aoc_input`;
    compute_depth: LOOP
        PREPARE sel FROM 'SELECT `val`, `dir` INTO @val, @dir FROM `aoc_input` LIMIT 1 OFFSET ?';
        EXECUTE sel USING @i;
        IF @dir = 'forward' THEN
            SET @depth = @depth + @val * @aim;
        ELSE
            SET @aim = @aim + @val;
        END IF;
        SET @i = @i + 1;
        IF @i >= @len THEN
            LEAVE compute_depth;
        END IF;
    END LOOP;
    SELECT sum(`val`) INTO @horizontal FROM `aoc_input` WHERE `dir` = 'forward';
    SELECT @depth * @horizontal AS `[Part 2] Result:`;
END$$
DELIMITER ;

CALL `aoc_part2`;
