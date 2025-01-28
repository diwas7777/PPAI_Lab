% Facts about students
student(john_doe).
student(jane_smith).
student(alice_wang).

% Facts about graduate students (inherits from students)
graduate_student(jane_smith).
graduate_student(alice_wang).

% Facts about faculty
faculty(prof_smith).
faculty(prof_jones).

% Facts about courses
course(math101, 'Introduction to Mathematics', prof_smith).
course(cs101, 'Introduction to Computer Science', prof_jones).
course(phy301, 'Advanced Physics', prof_smith).

% Facts about enrollment
enrolled(john_doe, math101).
enrolled(jane_smith, cs101).
enrolled(alice_wang, phy301).

% Inheritance hierarchy
% A graduate student is a student
is_a(X, student) :- graduate_student(X).

% A faculty member is not a student
is_a(X, faculty) :- faculty(X).

% Relationships
% A student is enrolled in a course
enrolled_in(X, Y) :- student(X), enrolled(X, Y), !.

% An instructor teaches a course
teaches(X, Y) :- faculty(X), course(Y, _, X), !.