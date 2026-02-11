-- =========================================
-- ВИДАЛЕННЯ БАЗИ (якщо існує)
-- =========================================
DROP DATABASE IF EXISTS LibraryManagement;

-- =========================================
-- СТВОРЕННЯ СХЕМИ
-- =========================================
CREATE DATABASE LibraryManagement;
USE LibraryManagement;

-- =========================================
-- ТАБЛИЦЯ AUTHORS
-- =========================================
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(255) NOT NULL
);

-- =========================================
-- ТАБЛИЦЯ GENRES
-- =========================================
CREATE TABLE genres (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(255) NOT NULL
);

-- =========================================
-- ТАБЛИЦЯ BOOKS
-- =========================================
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    publication_year INT,
    author_id INT,
    genre_id INT,
    CONSTRAINT fk_books_author FOREIGN KEY (author_id) REFERENCES authors(author_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_books_genre FOREIGN KEY (genre_id) REFERENCES genres(genre_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- =========================================
-- ТАБЛИЦЯ USERS
-- =========================================
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

-- =========================================
-- ТАБЛИЦЯ BORROWED_BOOKS
-- =========================================
CREATE TABLE borrowed_books (
    borrow_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    user_id INT,
    borrow_date DATE,
    return_date DATE,
    CONSTRAINT fk_borrow_book FOREIGN KEY (book_id) REFERENCES books(book_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_borrow_user FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE ON UPDATE CASCADE
);
