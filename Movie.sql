create table Movies(
Id int identity primary key,
Name nvarchar(100),
Duration int,
Description nvarchar(300),
Imdb float,
ReleaseDate Datetime,

)

create table Countries(
Id int identity primary key,
Name nvarchar(50)
)

create table Actors(
Id int identity primary key,
Name nvarchar(100)
)

create table Category(
Id int identity primary key,
CategoryName nvarchar(100)
)

--movie +category

create table MovieCategory(
Id int identity primary key,
MovieId int foreign key references Movies(Id),
CategoryId int foreign key references Category(Id)

)

create table MovieActor(
Id int identity primary key,
MovieId int foreign key references Movies(Id),
ActorId int foreign key references Actors(Id)
)

create table MovieCountry(
Id int identity primary key,
MovieId int foreign key references Movies(Id),
CountryId  int foreign key references Countries(Id)
)

insert into Movies
(Name,Description,Duration,Imdb,ReleaseDate)
values
('Assassins Creed',' Genetik kodunun kilidini kırması ile atalarının hatıralarına erişim sağlayabilen Callum Lynch 15. yüzyıl ',115,5.4,2016/01/01),
('Matrix 4','Bay Anderson gerçekliğinin fiziksel mi yoksa zihinsel bir kurgu mu olduğunu anlamak için bir kez daha beyaz tavşanı izlemeyi seçmek zorunda kalacaktır',148,6.8,2021/02/05),
('Resident Evil','Bir zamanlar ilaç devi Umbrella Corporationın hızla gelişen yuvası olan Raccoon artık ölmekte olan bir orta batı kentidir',107,7.1,2021/04.06),
('Prisoners of the Ghostland','Kötü şöhretli bir suçlu olan Hero (Nicolas Cage) kaçırılan bir kızı kurtarmaya gönderilir. Kız karanlık doğaüstü biz evrende kaybolmuştur',103,5.3,2021/01/01)




insert into Category
(CategoryName)
values
('Family'),('Adventure'),('dram'),('fantasy'),('action'),('comedy'),('animation'),('secret'),('crime')

insert into MovieCategory
(MovieId,CategoryId)
values(2,4),(2,5)

select * from MovieCategory

select *from Category
select * from Movies


insert into Actors
(Name)
values('Keanu Reeves'),(' Carrie-Anne Moss'),('Jada Pinkett Smith'),('Jessica Henwick'), ('Milla Jovovich'),('Michelle Rodriguez'),('James Purefoy'),('Martin Crewes'),(' Colin Salmon')

select * from Actors

insert into MovieActor
(MovieId,ActorId)
values(2,1),(2,2),(2,3),(2,4),(3,5),(3,6),(3,7),(3,8),(3,9)
select * from MovieActor

insert into MovieActor
(ActorId,MovieId)
values(3,1),(3,2),(3,3),(5,1),(5,4)

go 
create procedure getMovieActors @MovieId int, @Actorname nvarchar(100)
as
select Movies.Name,Movies.Description,Movies.Imdb,Actors.Name
from MovieActor
join Movies
on MovieId=Movies.Id
join Actors
on ActorId=Actors.Id
where MovieId=@MovieId
and Actors.Name=@Actorname

go
exec getMovieActors @MovieId =2, @Actorname='Keanu Reeves'


select Movies.Name,Movies.Description,Movies.Imdb,Actors.Name
from MovieActor
join Movies
on MovieId=Movies.Id
join Actors
on ActorId=Actors.Id
where MovieId=2
and Actors.Name='Keanu Reeves'