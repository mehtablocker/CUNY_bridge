DROP DATABASE IF EXISTS key_card_access;

CREATE DATABASE key_card_access DEFAULT CHARACTER SET utf8;

USE key_card_access;


CREATE TABLE workgroup (
	
    workgroup_id INT NOT NULL AUTO_INCREMENT,
    workgroup_name VARCHAR(255),
    
    PRIMARY KEY(workgroup_id)
    
    ) ENGINE = InnoDB;

CREATE TABLE employee (
	
    employee_id INT NOT NULL AUTO_INCREMENT,
    employee_name VARCHAR(255),
    workgroup_id INT,
    
    PRIMARY KEY(employee_id),
    
    CONSTRAINT FOREIGN KEY(workgroup_id)
		REFERENCES workgroup (workgroup_id)
        ON DELETE CASCADE ON UPDATE CASCADE
	
    ) ENGINE = InnoDB;

CREATE TABLE room (
	
    room_id INT NOT NULL AUTO_INCREMENT,
    room_name VARCHAR(255),
    
    PRIMARY KEY(room_id)
    
    ) ENGINE = InnoDB;

CREATE TABLE permissions (
	
    workgroup_id INT,
    room_id INT,
    
    CONSTRAINT FOREIGN KEY(workgroup_id)
		REFERENCES workgroup (workgroup_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
	
    CONSTRAINT FOREIGN KEY(room_id)
		REFERENCES room (room_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    
    PRIMARY KEY(workgroup_id, room_id)
	
    ) ENGINE = InnoDB;


INSERT INTO workgroup (workgroup_name)
	VALUES ('IT');
INSERT INTO workgroup (workgroup_name)
	VALUES ('Sales');
INSERT INTO workgroup (workgroup_name)
	VALUES ('Administration');
INSERT INTO workgroup (workgroup_name)
	VALUES ('Operations');

INSERT INTO employee (employee_name, workgroup_id)
	VALUES ('Modesto', 1);
INSERT INTO employee (employee_name, workgroup_id)
	VALUES ('Ayine', 1);
INSERT INTO employee (employee_name, workgroup_id)
	VALUES ('Christopher', 2);
INSERT INTO employee (employee_name, workgroup_id)
	VALUES ('Cheong woo', 2);
INSERT INTO employee (employee_name, workgroup_id)
	VALUES ('Saulat', 3);
INSERT INTO employee (employee_name)
	VALUES ('Heidy');

INSERT INTO room (room_name)
	VALUES ('101');
INSERT INTO room (room_name)
	VALUES ('102');
INSERT INTO room (room_name)
	VALUES ('Auditorium A');
INSERT INTO room (room_name)
	VALUES ('Auditorium B');

INSERT INTO permissions (workgroup_id, room_id)
	VALUES (1, 1);
INSERT INTO permissions (workgroup_id, room_id)
	VALUES (1, 2);
INSERT INTO permissions (workgroup_id, room_id)
	VALUES (2, 2);
INSERT INTO permissions (workgroup_id, room_id)
	VALUES (2, 3);


SELECT workgroup_name, employee_name FROM workgroup w
	LEFT JOIN employee e ON w.workgroup_id = e.workgroup_id;

SELECT room_name, workgroup_name FROM room r
	LEFT JOIN permissions p ON r.room_id = p.room_id
    LEFT JOIN workgroup w ON p.workgroup_id = w.workgroup_id;

SELECT employee_name, workgroup_name, room_name FROM employee e
	LEFT JOIN workgroup w ON e.workgroup_id = w.workgroup_id
    LEFT JOIN permissions p ON w.workgroup_id = p.workgroup_id
    LEFT JOIN room r ON p.room_id = r.room_id
    ORDER BY employee_name ASC, workgroup_name ASC, room_name ASC;
