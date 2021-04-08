
drop table Account;
drop table Client;

CREATE TABLE `Account` (
  `acctNum` char(20) NOT NULL,
  `credit` float NOT NULL,
  `acctType` char(20) NOT NULL,
  `CardNo` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `Account` (`acctNum`, `credit`, `acctType`, `CardNo`) VALUES
('4107-7014-01', 10000, 'Current', '4107-7014'),
('4107-7014-02', 20000, 'Saving', '4107-7014'),
('4107-7014-03', 30000, 'Saving', '4107-7014'),
('2026-6202-01', 10000, 'Current', '2026-6202'),
('2026-6202-02', 20000, 'Saving', '2026-6202'),
('2026-6202-03', 30000, 'Saving', '2026-6202'),
('1005-5001-01', 10000, 'Current', '1005-5001'),
('1005-5001-02', 20000, 'Saving', '1005-5001'),
('1005-5001-03', 30000, 'Saving', '1005-5001');


CREATE TABLE `Client` (
  `CardNo` char(20) NOT NULL,
  `Pin` char(6) NOT NULL,
  `firstName` char(20) NOT NULL,
  `lastName` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `Client` (`CardNo`, `Pin`, `firstName`, `lastName`) VALUES
('4107-7014', '111111', 'Demo', 'User one'),
('2026-6202', '222222', 'Demo', 'User two'),
('1005-5001', '333333', 'Demo', 'User three');

ALTER TABLE `Account`
  ADD PRIMARY KEY (`acctNum`),
  ADD KEY `CardNo` (`CardNo`);


ALTER TABLE `Client`
  ADD PRIMARY KEY (`CardNo`);

ALTER TABLE `Account`
  ADD CONSTRAINT `Account_ibfk_1` FOREIGN KEY (`CardNo`) REFERENCES `Client` (`CardNo`);
COMMIT;

