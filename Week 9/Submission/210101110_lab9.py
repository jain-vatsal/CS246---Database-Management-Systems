import mysql.connector
import string

mydatabase = mysql.connector.connect(
  host="localhost",
  user="root",
  password="vatsaljain",
  database="week9"
)

mycursor = mydatabase.cursor()


# task 4
roll_no = int(input("Enter the roll number = "))

# task 4a
print("Indian Institute of Technology,Guwahati")

#task 4b
print("\nProgramme Duration: 4 years                      Semesters:Eight(8)")
print()

# task 4b
mycursor.execute("select name from student18 where roll_number="+str(roll_no))

myresult = mycursor.fetchall()
# 180101027
print("Name: ",myresult[0][0],end="                      ")
print("Roll Number: "+str(roll_no))
print()
print("Semester         Course               CourseName                                                   Cr")

# task 4c

sum=0
for sem in range(1,9):
    mycursor.execute("select course18.semester,course18.cid,course18.name,grade18.letter_grade,course18.c from course18,grade18 where grade18.roll_number = "+str(roll_no)+" and course18.cid = grade18.cid and course18.semester = "+str(sem))
    for x in mycursor:
        print(f"{x[0]:0d} \t\t {x[1]:20s} {x[2]:60s} {x[3]:10s} ") 
    print()

# task 4d
mycursor.execute("select semester,sum(credit*c)/sum(c) as spi from course18 natural join grade18 natural join grade where roll_number = "+str(roll_no)+" group by semester order by semester")
spi = mycursor.fetchall()
for x in spi:
    print("Semester: ",x[0]," SPI :","%.2f" % x[1])
print()

# task 4e
for i in range(1,9):
    mycursor.execute("select sum(credit*c)/sum(c) from grade18,course18,grade where grade.letter_grade = grade18.letter_grade and grade18.roll_number = "+str(roll_no)+" and grade18.cid = course18.cid and semester <= "+str(i))
    data = mycursor.fetchall()
    print("Semester ",i," : ","CPI : ","%.2f" % data[0])
print()


# task 4f 
mycursor.execute("""
select cid as result from curriculum
where number = 1 and cid not like 'HS101'
and cid
not IN
(select cid
from grade18 natural join course18
where roll_number = {} and semester = 1);
""".format(roll_no))

print("Semester 1: ",end=" ")
for x in mycursor:
  print(x[0])

mycursor.execute("""
select cid from curriculum
where number = 2 and cid not like 'SA1__'
and cid not in(
select cid
from grade18 natural join course18
where roll_number = {} and semester = 2);
""".format(roll_no))

print("\nSemester 2: ",end=" ")
for x in mycursor:
  print(x[0],end=" ")
print()

mycursor.execute("""
select cid from curriculum
where number = 3 and cid not like 'SA1__' AND cid not like 'HS200'
and cid   not in
(select cid
from grade18 natural join course18
where roll_number = {} and semester = 3);
""".format(roll_no))

print("\nSemester 3: ",end=" ")
for x in mycursor:
  print(x[0],end = " ")
print()

mycursor.execute("""
select cid from curriculum
where number = 4 and cid not like 'HS1_' AND cid not like 'SA3_' AND cid not like '%M'
and cid not in(
select cid
from grade18 natural join course18
where roll_number = {} and semester = 4);
""".format(roll_no))

print("\nSemester 4: ",end=" ")
for x in mycursor:
  print(x[0],end=" ")
print()

mycursor.execute("""
select cid from curriculum
where number = 5 and cid not like 'SA4__' AND cid not like '%M'
and cid not in(
select cid
from grade18 natural join course18
where roll_number = {} and semester = 5);
""".format(roll_no))

print("\nSemester 5: ",end=" ")
for x in mycursor:
  print(x[0],end=" ")
print()

mycursor.execute("""
select cid from curriculum
where number = 6 and cid not like '%M'
and cid not in(
select cid
from grade18 natural join course18
where roll_number = {} and semester = 6);
""".format(roll_no))

print("\nSemester 6: ",end=" ")
for x in mycursor:
  print(x[0],end=" ")
print()

mycursor.execute("""
select cid from curriculum
where number = 7 and cid like 'CS498'
and cid not in(
select cid
from grade18 natural join course18
where roll_number = {} and semester = 7);
""".format(roll_no))

print("\nSemester 7: ",end=" ")
for x in mycursor:
  print(x[0],end=" ")
print()

mycursor.execute("""
select cid from curriculum
where number = 8 and cid like 'CS499'
and cid  not in(
select cid
from grade18 natural join course18
where roll_number = {} and semester = 8);
""".format(roll_no))

print("\nSemester 8: ",end=" ")
for x in mycursor:
  print(x[0],end=" ")
print()
print()

# task 4g 
mycursor.execute("""
select count(*)=0 as result from curriculum
where number = 1 and (cid  like 'CS5%%' or cid like 'CSxxx') 
and cid
not IN
(select cid
from grade18 natural join course18
where roll_number = {} and semester = 1);
""".format(roll_no))

print("Semester 1: ",end=" ")
for x in mycursor:
  print(x[0])


mycursor.execute("""
select count(*)=0 as result from curriculum
where number = 2 and (cid  like 'CS5%%' or cid like 'CSxxx') 
and cid
not IN
(select cid
from grade18 natural join course18
where roll_number = {} and semester = 2);
""".format(roll_no))

print("Semester 2: ",end=" ")
for x in mycursor:
  print(x[0])


mycursor.execute("""
select count(*)=0 as result from curriculum
where number = 3 and (cid  like 'CS5%%' or cid like 'CSxxx') 
and cid
not IN
(select cid
from grade18 natural join course18
where roll_number = {} and semester = 3);
""".format(roll_no))

print("Semester 3: ",end=" ")
for x in mycursor:
  print(x[0])


mycursor.execute("""
select count(*)=0 as result from curriculum
where number = 4 and (cid  like 'CS5%%' or cid like 'CSxxx') 
and cid
not IN
(select cid
from grade18 natural join course18
where roll_number = {} and semester = 4);
""".format(roll_no))

print("Semester 4: ",end=" ")
for x in mycursor:
  print(x[0])



mycursor.execute("""
select count(*)=0 as result from curriculum
where number = 5 and (cid  like 'CS5%%' or cid like 'CSxxx') 
and cid
not IN
(select cid
from grade18 natural join course18
where roll_number = {} and semester = 5);
""".format(roll_no))

print("Semester 5: ",end=" ")
for x in mycursor:
  print(x[0])



mycursor.execute("""
select count(*)=0 as result from curriculum
where number = 6 and (cid  like 'CS5%%' or cid like 'CSxxx') 
and cid
not IN
(select cid
from grade18 natural join course18
where roll_number = {} and semester = 6);
""".format(roll_no))

print("Semester 6: ",end=" ")
for x in mycursor:
  print(x[0])



mycursor.execute("""
select count(*)=0 as result from curriculum
where number = 7 and (cid  like 'CS5%%' or cid like 'CSxxx') 
and cid
not IN
(select cid
from grade18 natural join course18
where roll_number = {} and semester = 7);
""".format(roll_no))

print("Semester 7: ",end=" ")
for x in mycursor:
  print(x[0])



mycursor.execute("""
select count(*)=0 as result from curriculum
where number = 8 and (cid  like 'CS5%%' or cid like 'CSxxx') 
and cid
not IN
(select cid
from grade18 natural join course18
where roll_number = {} and semester = 8);
""".format(roll_no))

print("Semester 8: ",end=" ")
for x in mycursor:
  print(x[0])




print()
#task 4h
print("Minor taken by student = ")
mycursor.execute(f"""select cid from curriculum where cid like "%M" and number=1 and cid in (select cid from grade18 where roll_number={roll_no}) order by number""")
data = mycursor.fetchall()
for x in data:
    print(f"1 {x[0]}")
mycursor.execute(f"""select cid from curriculum where cid like "%M" and number=2 and cid in (select cid from grade18 where roll_number={roll_no}) order by number""")
data = mycursor.fetchall()
for x in data:
    print(f"2 {x[0]}")
mycursor.execute(f"""select cid from curriculum where cid like "%M" and number=3 and cid in (select cid from grade18 where roll_number={roll_no}) order by number""")
data = mycursor.fetchall()
for x in data:
    print(f"3 {x[0]}")
mycursor.execute(f"""select cid from curriculum where cid like "%M" and number=4 and cid in (select cid from grade18 where roll_number={roll_no}) order by number""")
data = mycursor.fetchall()
for x in data:
    print(f"4 {x[0]}")
mycursor.execute(f"""select cid from curriculum where cid like "%M" and number=5 and cid in (select cid from grade18 where roll_number={roll_no}) order by number""")
data = mycursor.fetchall()
for x in data:
     print(f"5 {x[0]}")
mycursor.execute(f"""select cid from curriculum where cid like "%M" and number=6 and cid in (select cid from grade18 where roll_number={roll_no}) order by number""")
data = mycursor.fetchall()
for x in data: 
    print(f"6 {x[0]}")
mycursor.execute(f"""select cid from curriculum where cid like "%M" and number=7 and cid in (select cid from grade18 where roll_number={roll_no}) order by number""")
data = mycursor.fetchall()
for x in data: 
    print(f"7 {x[0]}")
mycursor.execute(f"""select cid from curriculum where cid like "%M" and number=8 and cid in (select cid from grade18 where roll_number={roll_no}) order by number""")
data = mycursor.fetchall()
for x in data:
    print(f"8 {x[0]}")

print()
#task 4i
print("electing courses : ")
for i in range(1,9):
    mycursor.execute(f"""select cid from curriculum where cid like "OE%" and number={i} and cid in (select cid from grade18 where roll_number={roll_no}) order by number""")
    data = mycursor.fetchall()
    for x in data:
        print(f"Semester {i}: {x[0]}")

print()
#task 4j
print("hs courses : ")
for i in range(1,9):
    mycursor.execute(f"""select cid from curriculum where cid like "HS%" and number={i} and cid in (select cid from grade18 where roll_number={roll_no}) order by number""")
    data = mycursor.fetchall()
    for x in data:
        print(f"Semester {i}: {x[0]}")


print("electing courses : ")
for i in range(1,9):
    mycursor.execute(f"""select cid from curriculum where cid like "OE%" and number={i} and cid in (select cid from grade18 where roll_number={roll_no}) order by number""")
    data = mycursor.fetchall()
    for x in data:
        print("Semester {i}: {x[0]}")


# task 4l
for sem in range(1,9):
    mycursor.execute("select course18.cid from grade18,course18 where course18.cid = grade18.cid and grade18.roll_number="+str(roll_no)+" and course18.semester="+str(sem)+" and letter_grade<>'AA' and letter_grade<>'AS' and letter_grade<>'AB' and letter_grade<>'BB' and letter_grade<>'BC' and letter_grade<>'CC' and letter_grade<>'CD' and letter_grade<>'DD' ")
    print("Course failed in semester "+str(sem)+" : ",end="")
    for x in mycursor:
        print(x[0],end=" ,")
    print()
print()







# task 4m

mycursor.execute("select cid from grade18 where cid like 'SA%' and letter_grade not in ('AS','AA','AB','BB','BC','CC','CD','DD') and roll_number = "+str(roll_no))
print("SA courses failed are = ")
for x in mycursor:
    print(x[0])
print()