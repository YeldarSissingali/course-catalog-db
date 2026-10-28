# Course Catalog Database

## Constraint Violation Log

| # | Action | SQLSTATE | Constraint / Reason |
|---|--------|----------|---------------------|
| 1 | NULL credits | 23502 | NOT NULL constraint on credits |
| 2 | credits = 0 | 23514 | courses_credits_check |
| 3 | likes = -1 | 23514 | courses_likes_check |
| 4 | Short student name | 23514 | students_name_check |
| 5 | Duplicate course ID | 23505 | courses_pkey |
| 6 | Duplicate student email | 23505 | students_email_key |
| 7 | Duplicate enrollment | 23505 | enrollments_course_id_student_id_key |
| 8 | Enrollment for non-existent course | 23503 | enrollments_course_id_fkey |
| 9 | Enrollment for non-existent student | 23503 | enrollments_student_id_fkey |
| 10 | Delete course with active enrollments | 23503 | enrollments_course_id_fkey |

### Pydantic Validation vs Database Constraints

Database constraints act as the ultimate line of defense for data integrity at the storage level, preventing corrupt data regardless of the entry point. Pydantic validates incoming requests at the application layer before reaching the database, providing user-friendly validation errors and avoiding unnecessary database queries.


## Index: EXPLAIN before and after

Query: `SELECT * FROM enrollments WHERE student_id = 777;`

| State | Plan Type | Cost | Execution Time |
|-------|-----------|------|----------------|
| Before Index | Seq Scan | 0.00..1042.00 | 2.282 ms |
| After Index | Bitmap Index Scan | 4.43..15.59 | 0.026 ms |

### Sizes
- `enrollments` table size: ~3128 kB
- `enrollments_student_id_idx` index size: ~1112 kB