CREATE database BookStoreDB8;

USE BookStoreDB8;

CREATE TABLE Category (
	category_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    category_name VARCHAR(100) NOT NULL,
    description VARCHAR(225)
);

CREATE TABLE Book(
	book_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    title VARCHAR(150) NOT NULL,
    status INT DEFAULT 1,
    publish_date DATE,
    price DECIMAL(10,3),
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

CREATE TABLE BookOrder (
	order_id INT PRIMARY KEY  NOT NULL,
    customer_name VARCHAR(100) NOT NULL,
    book_id INT ,
    FOREIGN KEY (book_id) REFERENCES Book(book_id),
    order_date DATE DEFAULT(CURRENT_DATE),
    delivery_date DATE
);

ALTER TABLE Book
ADD COLUMN author_name VARCHAR(100) NOT NULL;

ALTER TABLE BookOrder 
MODIFY COLUMN customer_name VARCHAR(200);


INSERT INTO Category(category_name,description) 
VALUES 
('IT&Tech','Sách lập trình'),
('Business','Sách kinh doanh'),
('Novel','Tiểu thuyết');

INSERT INTO Book(title,status,publish_date,price,category_id,author_name)
VALUES 
('CleanCode','1','2020-05-10','500000','1','Robert C.Martin'),
('Đắc nhân tâm','0','2018-08-20','150000','2','DaleCarnegie'),
('JavaScript Nâng cao','1','2023-01-15','350000','1','Kyle Simpson'),
('Nhà giả kim','0','2015-11-25','120000','3','Paulo Coelho');

INSERT INTO BookOrder VALUES 
('101','Nguyen Hai Nam','1','2025-01-10','2025-01-15'),
('102','Tran Bao Ngoc','3','2025-02-05','2025-02-10'),
('103','LeHoangYen','4','2025-03-12',NULL);

UPDATE Book
SET Price = Price + 50000
where category_id = 1;

UPDATE BookOrder
SET delivery_date = '2025-12-31'
WHERE delivery_date IS NULL;

DELETE FROM bookorder
WHERE order_date < '2025-02-01';

ALTER TABLE BookOrder
ADD CONSTRAINT chk_delivery_date
CHECK (delivery_date >= order_date);

select * from BookOrder;

SELECT title,author_name,
	CASE 
		WHEN status = 1 THEN "Còn hàng "
        ELSE "Hết hàng"
        END AS Phan_loai
FROM Book;

SELECT * FROM Book AS B
JOIN Category AS C
ON B.category_id = C.category_id;