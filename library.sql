--Создание базы данных Библиотека
create database Library
go

use Library
go
--Создание таблицы Автор
create table Autor(
id int identity(1,1) primary key,
FIO_Autor nvarchar(50)
)
--Создание таблицы Издательство
create table Publishing(
id_publishing int primary key,
name_publishing varchar(50)
)
--Создание таблицы Книга
create table Book(
id_book int primary key,
name varchar (50),
year_publishing int,
genre varchar(50),
id_publishing int,
foreign key (id_publishing) references
Publishing (id_publishing)
)
--Создание таблицы Автор_Книги
create table Autor_Book(
id int identity(1,1),
id_book int,
foreign key (id) references
Autor (id),
foreign key (id_book) references
Book (id_book)
)
--Создание таблицы Экземпляр
create table Exemplar(
id_exemplar int primary key,
id_book int,
foreign key (id_book) references
Book (id_book)
)
--Создание таблицы Поступление
create table admission(
id_admission int primary key,
id_exemplar int,
date_of_admission date,
foreign key (id_exemplar)  references
Exemplar (id_exemplar)
)
--Создание таблицы Клиент
create table Client(
id_library_card int primary key,
FIO_Client varchar(50),
number_phone char(10)
constraint CK_Client_number_phone check
(number_phone not like '%[^0-9]%')
)
--Создание таблицы Выдача_Книги
create table issue_book(
id int primary key,
id_library_card int,
id_exemplar int,
date_of_issue date,
date_of_return date,
foreign key (id_library_card) references
Client (id_library_card),
foreign key (id_exemplar) references
Exemplar (id_exemplar)
)
--Заполнение таблицы Автор данными
insert into Autor(FIO_Autor) values ('Гончаров Виктор Антонович')
insert into Autor(FIO_Autor) values ('Стивен Кинг')
insert into Autor(FIO_Autor) values ('Джон Кехо')
insert into Autor(FIO_Autor) values ('Артур Конан Дойл')
insert into Autor(FIO_Autor) values ('Машинкин Александр Васильевич')
insert into Autor(FIO_Autor) values ('Анна Матвеева')
insert into Autor(FIO_Autor) values ('Стивен Эдвин Кинг')
insert into Autor(FIO_Autor) values ('Светлана Суббота')
--Заполнение таблицы Издательство данными
insert into Publishing(id_publishing,name_publishing) values (1,'Арка')
insert into Publishing(id_publishing,name_publishing) values (2,'Азбука')
insert into Publishing(id_publishing,name_publishing) values (3,'АСТ')
insert into Publishing(id_publishing,name_publishing) values (4,'АСТ-ПРЕСС')
insert into Publishing(id_publishing,name_publishing) values (5,'Белый город')
insert into Publishing(id_publishing,name_publishing) values (6,'Азбука')
insert into Publishing(id_publishing,name_publishing) values (7,'Аванта +')
insert into Publishing(id_publishing,name_publishing) values (8,'Арка')
--Заполнение таблицы Книга данными
insert into Book(id_book,name,year_publishing,genre,id_publishing) values (1, 'Ночи в перу','1998','Фантастика',1)
insert into Book(id_book,name,year_publishing,genre,id_publishing) values (2,'кладбище домашних животных','1975','Ужасы',2)
insert into Book(id_book,name,year_publishing,genre,id_publishing) values (3,'Походы царя Перуна','2008','Фентези',3)
insert into Book(id_book,name,year_publishing,genre,id_publishing) values (4,'Собака Баскервили','1983','Детектив',4)
insert into Book(id_book,name,year_publishing,genre,id_publishing) values (5,'Закат в Анголе','2005','Драма',5)
insert into Book(id_book,name,year_publishing,genre,id_publishing) values (6,'Перевал Дятлова','2001','Документальный',6)
insert into Book(id_book,name,year_publishing,genre,id_publishing) values (7,'Сияние','1997','Ужасы',7)
insert into Book(id_book,name,year_publishing,genre,id_publishing) values (8,'Дракон с подарком','1985','Фентези',8)
--Заполнение таблицы Автор-Книги данными
insert into Autor_Book(id_book) values (1)
insert into Autor_Book(id_book) values (2)
insert into Autor_Book(id_book) values (3)
insert into Autor_Book(id_book) values (4)
insert into Autor_Book(id_book) values (5)
insert into Autor_Book(id_book) values (6)
insert into Autor_Book(id_book) values (7)
insert into Autor_Book(id_book) values (8)
--Заполнение таблицы Экземпляр данными
insert into Exemplar(id_exemplar,id_book) values (1,1)
insert into Exemplar(id_exemplar,id_book) values (2,2)
insert into Exemplar(id_exemplar,id_book) values (3,3)
insert into Exemplar(id_exemplar,id_book) values (4,4)
insert into Exemplar(id_exemplar,id_book) values (5,5)
insert into Exemplar(id_exemplar,id_book) values (6,6)
insert into Exemplar(id_exemplar,id_book) values (7,7)
insert into Exemplar(id_exemplar,id_book) values (8,8)
--Заполнение таблицы Поступление данными
insert into admission(id_admission,date_of_admission,id_exemplar) values (1,'2020-01-01',1)
insert into admission(id_admission,date_of_admission,id_exemplar) values (2,'2020-03-14',2)
insert into admission(id_admission,date_of_admission,id_exemplar) values (3,'2020-01-12',3)
insert into admission(id_admission,date_of_admission,id_exemplar) values (4,'2020-02-07',4)
insert into admission(id_admission,date_of_admission,id_exemplar) values (5,'2020-04-24',5)
insert into admission(id_admission,date_of_admission,id_exemplar) values (6,'2020-01-06',6)
insert into admission(id_admission,date_of_admission,id_exemplar) values (7,'2020-02-03',7)
insert into admission(id_admission,date_of_admission,id_exemplar) values (8,'2020-05-11',8)
--Заполнение таблицы Издательство данными
insert into Client(id_library_card,FIO_Client,number_phone) values (1,'Мерлушкин Роман Евгеньевич',9136541234)
insert into Client(id_library_card,FIO_Client,number_phone) values (2,'Антонов Петр Васильевич',9134581334)
insert into Client(id_library_card,FIO_Client,number_phone) values (3,'Горчаков Кирилл Вадимович',9136541287)
insert into Client(id_library_card,FIO_Client,number_phone) values (4,'Мешкова Анна Викторовна',9136545734)
insert into Client(id_library_card,FIO_Client,number_phone) values (5,'Груздев Иван Владимирович',9136841635)
insert into Client(id_library_card,FIO_Client,number_phone) values (6,'Опятова Виолета Никитична',9236541234)
insert into Client(id_library_card,FIO_Client,number_phone) values (7,'Гвоздева Яна Антоновна',9236731568)
insert into Client(id_library_card,FIO_Client,number_phone) values (8,'Пупкин Василий Дмитривич',9138971234)
--Заполнение таблицы Выдача_Книги данными
insert into issue_book(id,id_library_card,id_exemplar,date_of_issue,date_of_return) values (1,1,1,'2020-01-11','2020-02-01')
insert into issue_book(id,id_library_card,id_exemplar,date_of_issue,date_of_return) values (2,2,2,'2020-03-21','2020-03-30')
insert into issue_book(id,id_library_card,id_exemplar,date_of_issue,date_of_return) values (3,3,3,'2020-02-14','2020-03-12')
insert into issue_book(id,id_library_card,id_exemplar,date_of_issue,date_of_return) values (4,1,1,'2020-03-12','2020-04-15')
insert into issue_book(id,id_library_card,id_exemplar,date_of_issue,date_of_return) values (5,5,5,'2020-04-30','2020-05-12')
insert into issue_book(id,id_library_card,id_exemplar,date_of_issue,date_of_return) values (6,6,6,'2020-01-12','2020-02-02')
insert into issue_book(id,id_library_card,id_exemplar,date_of_issue,date_of_return) values (7,7,7,'2020-02-16','2020-03-11')
insert into issue_book(id,id_library_card,id_exemplar,date_of_issue,date_of_return) values (8,8,8,'2020-06-01','2020-06-25')
insert into issue_book(id,id_library_card,id_exemplar,date_of_issue,date_of_return) values (9,4,4,'2020-06-09','2020-07-25')
go

--Запрос на определение злостного читателя(это клиент который не вернул книгу в срок-30 дней)
select FIO_Client, count(issue_book.id) as Count
from Client 
right join issue_book
on Client.id_library_card = issue_book.id_library_card 
where date_of_issue between '2020-01-01' and '2020-12-31'
group by FIO_Client, date_of_issue, date_of_return
having datediff(dd,date_of_issue,date_of_return)>30
order by count(FIO_Client) desc;
-- Запрос на определение самого популярного автора зв год
select top 1  
FIO_Autor
from Autor
inner join Autor_Book 
on Autor.id = Autor_Book.id
inner join Book
on Autor_Book.id_book=Book.id_book
inner join Exemplar
on Autor_Book.id_book = Exemplar.id_book
inner join issue_book
on Exemplar.id_exemplar = issue_book.id_exemplar
where date_of_issue between '2020-01-01' and '2021-01-01'  
group by FIO_Autor
order by count(*) desc
-- запрос на проверку наличие выбранных книг на сегодняшний день
select name as Name_book
from Book
left join Exemplar
on Book.id_book = Exemplar.id_book
left join issue_book
on Exemplar.id_exemplar = issue_book.id_exemplar
where name in ('кладбище домашних животных', 'Собака Баскервили','Сияние')
group by name, date_of_return
having  date_of_return < convert(date,getdate())
--Проверка наличия всех книг в библиотеке
select distinct name as Name_book, 
iif(date_of_return < convert(date,getdate()), 'в наличии', 'нет в наличии') as Availability_book 
from Book, issue_book
--Запрос на определения старых и новых книг(старые-это книги изданные раньше 2000 года, новые-изданные позже 2000 года)
select name as Name_book,
case 
when year_publishing < 2000 then 'Старая Книга'
when year_publishing > 2000 then 'Новая Книга'
end as Category
from Book
go
-- функция для Проверки наличия книги в библиотеке
create function check_availability (@id_book varchar)
returns table
as
return
(
select distinct name as Name_book, 
iif(date_of_return < convert(date,getdate()), 'в наличии', 'нет в наличии') as Availability_book 
from Book, issue_book
where id_book=@id_book
);
go
--Запрос дял проверки работоспособности пользовательской функции
--для индификатора id_book = 1
select*from check_availability(1)
go
--Функция для опредления книг отсутсвующих в библиотеке
create function old_or_new (@id_book int)
returns varchar
as
begin
declare
@year_publishing varchar(50)
select @year_publishing = cast(year_publishing as varchar(50))
from Book
where id_book = @id_book
if(@year_publishing < '2000')
set @year_publishing = 'Старая'
else
set @year_publishing = 'Новая'
return @year_publishing;
end;
go
--Запрос-проверка функции
select name, dbo.old_or_new(id_book) as category
from Book
-- Процедура для извлечения информации о книге
go
Create procedure InfoAboutBook
as
begin
select name as name_book, FIO_autor, genre, year_publishing
from Book b
join Autor_Book ab
on b.id_book = ab.id_book
join Autor a
on ab.id = a.id
order by name_book
end;
go
--Код для проверки работоспособности хранимой процедуры
execute InfoAboutBook
go
--Триггер для таблицы поступление при выполнении insert and update 
--он задаст сегодняшнюю дату
create trigger date_admission
on admission
for insert,update
as
update admission 
set date_of_admission=convert(date,getdate())
where admission.id_admission=(select id_admission from inserted)
go
--Код для проверки работоспособности триггера
--Мы вводим дату 2021-11-27, и при вызовозе таблицы admission
--Видим что дата в последнем столбце поменялась на сегодяшнюю
insert admission(id_admission,id_exemplar,date_of_admission) values (23,8, '2021-11-27')
select*from admission




