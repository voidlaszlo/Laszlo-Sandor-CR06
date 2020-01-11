# Database CR06_LASZLO_SANDOR
use cr06_laszlo_sandor;

# Showing all students from class 1a
select nameStudent, surnameStudent, nameClass
from students
join classes on classes.idClass = students.idClass
where nameClass = "1a";