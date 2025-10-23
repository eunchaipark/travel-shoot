ALTER TABLE `travel_shoot`.`review_summaries`
ADD COLUMN `review_count` INT NOT NULL DEFAULT 0 AFTER `updated_at`;
