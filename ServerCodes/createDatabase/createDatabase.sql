CREATE TABLE `Controlled_Nodes` (
`id` int NOT NULL,
`name` varchar(255) NULL,
`type` varchar(255) NULL,
`dTime` timestamp NULL,
`energy_power` float NULL,
PRIMARY KEY (`id`,`dTime`)
)   ENGINE = InnoDB
	DEFAULT CHARACTER SET = utf8mb4
	COLLATE = utf8mb4_general_ci;

CREATE TABLE `Schedule` (
`dTime` timestamp NOT NULL,
`id` int NOT NULL,
`energy_power` float NULL,
PRIMARY KEY (`id`,`dTime`)
)   ENGINE = InnoDB
	DEFAULT CHARACTER SET = utf8mb4
	COLLATE = utf8mb4_general_ci;

CREATE TABLE `Schedule_History` (
`dTime` timestamp NULL,
`id` int NULL,
4. Table Relation
Amount of Data Stored
`energy_power` float NULL,
PRIMARY KEY (`id`,`dTime`)
)   ENGINE = InnoDB
	DEFAULT CHARACTER SET = utf8mb4
	COLLATE = utf8mb4_general_ci;

CREATE TABLE `Weather_Based_Nodes` (
`id` int NOT NULL,
`name` varchar(255) NULL,
`type` varchar(255) NULL,
`dTime` timestamp NULL,
`energy_power` float NULL,
PRIMARY KEY (`id`,`dTime`)
)   ENGINE = InnoDB
	DEFAULT CHARACTER SET = utf8mb4
	COLLATE = utf8mb4_general_ci;

CREATE TABLE `Weather_History` (
`dTime` timestamp NULL,
`temperature` float NULL,
`light_intensity` float NULL,
`wind_speed` float NULL,
`humidity` float NULL,
PRIMARY KEY (`dTime`)
)   ENGINE = InnoDB
	DEFAULT CHARACTER SET = utf8mb4
	COLLATE = utf8mb4_general_ci;

CREATE TABLE `Weather_Predict` (
`dTime` timestamp NULL,
`temperature` float NULL,
`light_intensity` float NULL,
`wind_speed` float NULL,
`humidity` float NULL,
PRIMARY KEY (`dTime`)
)   ENGINE = InnoDB
	DEFAULT CHARACTER SET = utf8mb4
	COLLATE = utf8mb4_general_ci;
