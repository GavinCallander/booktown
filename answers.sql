-- Queries

-- Order
    SELECT * FROM subjects ORDER BY subject;

    SELECT * subjects ORDER BY location;

-- Where
    SELECT title FROM books WHERE title = 'Little Women';
    
    SELECT title FROM books WHERE title LIKE '%Python%';

    SELECT * FROM subjects WHERE location = 'Main St' ORDER BY subject;

-- Joins
    SELECT books.title AS title, authors.first_name AS first_name, authors.last_name AS last_name, subjects.subject AS subject
    FROM books
    JOIN authors 
    ON authors.id = books.author_id
    JOIN subjects
    ON subjects.id = books.subject_id;

    SELECT books.title AS title, stock.retail AS price
    FROM books
    JOIN editions
    ON editions.book_id = books.id
    JOIN stock
    ON editions.isbn = stock.isbn
    ORDER BY stock.retail DESC

    SELECT books.title, editions.isbn, publishers.name, stock.retail
    FROM books
    JOIN editions ON editions.book_id = books.id
    JOIN publishers ON publishers.id = editions.publisher_id
    JOIN stock ON stock.isbn = editions.isbn
    WHERE books.title = 'Dune';

    SELECT customers.first_name, customers.last_name, shipments.ship_date, books.title
    FROM shipments
    JOIN customers ON shipments.customer_id = customers.id
    JOIN editions ON shipments.isbn = editions.isbn
    JOIN books ON editions.book_id = books.id
    ORDER BY shipments.ship_date;

-- Grouping and Counting
    SELECT COUNT(*) FROM books;

    SELECT COUNT(location) FROM subjects;

    SELECT COUNT(location) FROM subjects GROUP BY location;

    SELECT books.id, books.title, COUNT(editions.edition)
    FROM books
    JOIN editions ON books.id = editions.book_id
    GROUP BY books.id;