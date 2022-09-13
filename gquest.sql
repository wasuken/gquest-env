CREATE TABLE `users` (
  `id` integer PRIMARY KEY,
  `name` varchar(255),
  `email` text,
  `password_hash` text,
  `refresh_token` text,
  `token` text
);

CREATE TABLE `workers` (
  `id` integer PRIMARY KEY,
  `user_id` integer,
  `skills` text,
  `rank` integer
);

CREATE TABLE `clients` (
  `id` integer PRIMARY KEY,
  `user_id` integer
);

CREATE TABLE `guild_members` (
  `id` integer PRIMARY KEY,
  `user_id` integer,
  `role` text
);

CREATE TABLE `quests` (
  `id` integer PRIMARY KEY,
  `client_id` integer,
  `manage_guild_member_id` integer,
  `description` text,
  `reward` text,
  `reward_yen` integer
);

CREATE TABLE `worker_quests` (
  `worker_id` integer,
  `quest_id` integer,
  `status` integer,
  `status_detail` text
);

ALTER TABLE `users` ADD FOREIGN KEY (`id`) REFERENCES `workers` (`user_id`);

ALTER TABLE `users` ADD FOREIGN KEY (`id`) REFERENCES `clients` (`user_id`);

ALTER TABLE `users` ADD FOREIGN KEY (`id`) REFERENCES `guild_members` (`user_id`);

ALTER TABLE `clients` ADD FOREIGN KEY (`id`) REFERENCES `quests` (`client_id`);

ALTER TABLE `guild_members` ADD FOREIGN KEY (`id`) REFERENCES `quests` (`manage_guild_member_id`);

ALTER TABLE `workers` ADD FOREIGN KEY (`id`) REFERENCES `worker_quests` (`worker_id`);

ALTER TABLE `quests` ADD FOREIGN KEY (`id`) REFERENCES `worker_quests` (`quest_id`);
