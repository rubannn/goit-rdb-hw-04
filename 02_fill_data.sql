USE LibraryManagement;

-- =========================================
-- ОЧИЩЕННЯ ТАБЛИЦЬ
-- =========================================
SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE borrowed_books;
TRUNCATE TABLE books;
TRUNCATE TABLE authors;
TRUNCATE TABLE genres;
TRUNCATE TABLE users;

SET FOREIGN_KEY_CHECKS = 1;

-- =========================================
-- AUTHORS
-- =========================================

INSERT INTO authors (author_name) VALUES
('Іван Франко'),
('Леся Українка'),
('Тарас Шевченко'),
('Марко Вовчок'),
('Михайло Коцюбинський'),
('Ольга Кобилянська'),
('Панас Мирний');

-- =========================================
-- GENRES
-- =========================================

INSERT INTO genres (genre_name) VALUES
('Поезія'),
('Драма'),
('Роман'),
('Повість'),
('Оповідання'),
('Історичний роман');

-- =========================================
-- BOOKS
-- =========================================

INSERT INTO books (title, publication_year, author_id, genre_id) VALUES
('Захар Беркут', 1883, 1, 6),
('Лісова пісня', 1911, 2, 2),
('Кобзар', 1840, 3, 1),
('Інститутка', 1862, 4, 4),
('Тіні забутих предків', 1911, 5, 4),
('Земля', 1902, 6, 3),
('Хіба ревуть воли, як ясла повні?', 1880, 7, 3);

-- =========================================
-- USERS
-- =========================================

INSERT INTO users (username, email) VALUES
('student01', 'student01@email.com'),
('reader02', 'reader02@email.com'),
('library_user3', 'user3@email.com'),
('anna_reader', 'anna@email.com'),
('booklover', 'booklover@email.com'),
('test_user6', 'user6@email.com');

-- =========================================
-- BORROWED_BOOKS
-- =========================================

INSERT INTO borrowed_books (book_id, user_id, borrow_date, return_date) VALUES
(1, 1, '2025-01-10', '2025-01-20'),
(2, 2, '2025-02-01', NULL),
(3, 3, '2025-02-05', '2025-02-15'),
(4, 4, '2025-02-10', NULL),
(5, 5, '2025-02-12', '2025-02-18'),
(6, 1, '2025-02-15', NULL),
(7, 6, '2025-02-18', '2025-02-25');
