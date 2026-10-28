INSERT INTO students (name, email)
SELECT 
    'Student ' || i,
    'student' || i || '@example.com'
FROM generate_series(1, 50000) AS i;

INSERT INTO courses (id, title, description, credits) VALUES
('bench-1', 'Benchmark Course 1', 'Desc', 3),
('bench-2', 'Benchmark Course 2', 'Desc', 3);

INSERT INTO enrollments (course_id, student_id)
SELECT 
    CASE WHEN i % 2 = 0 THEN 'bench-1' ELSE 'bench-2' END,
    i
FROM generate_series(1, 50000) AS i;