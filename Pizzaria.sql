create database PizzariaMENU

create table Pizza(
CodicePizza int identity(1,1) constraint PK_Pizza primary key,
Nome varchar(30) not null,
Prezzo decimal(10,2) not null check(Prezzo>0)
);

create table Ingrediente(
CodiceIngrediente int identity(1,1) constraint PK_Ingrediente primary key,
Nome varchar(30) not null,
Costo decimal(10,2) not null check(Costo>0),
Scorte int not null check (Scorte >=0)
);

create table PizzaIngrediente(
codicePizza int not null constraint FK_Pizza foreign key references Pizza(CodicePizza),
codiceIngrediente int not null constraint FK_Ingrediente foreign key references Ingrediente(CodiceIngrediente)

constraint PK_Pizza_Ingrediente primary key(CodicePizza,CodiceIngrediente)
);

-------------------------PROCEDURE----------------------------------


--procedure 1: Inserimento di una nuova pizza

create procedure InserisciPizza
@nome varchar(30),
@prezzo decimal(10,2)
as 
insert into Pizza values(@nome,@prezzo)

create procedure InserisciIngrediente
@nome varchar(30),
@costo decimal(10,2),
@scorte int
as
insert into Ingrediente values(@nome,@costo,@scorte)

--TEST per vedere si funziona
execute InserisciPizza 'Margherita',5

execute InserisciIngrediente 'Pomodoro',10,50

Select* from Pizza
select* from Ingrediente

--Inserimento dati 

execute InserisciPizza 'Bufala',7
execute InserisciPizza 'Diavola',6
execute InserisciPizza 'Quattro stagioni', 6.50
execute InserisciPizza 'Porcini',7
execute InserisciPizza 'Dioniso',8
execute InserisciPizza 'Ortolana',8
execute InserisciPizza 'Patate e salsiccia',6
execute InserisciPizza 'Pomodorini',6
execute InserisciPizza 'Quattro formaggi',7.50
execute InserisciPizza 'Caprese',7.50
execute InserisciPizza 'Zeus',7.50

execute InserisciIngrediente 'Mozzarella',20,40
execute InserisciIngrediente 'Mozzarella di bufala',30,70
execute InserisciIngrediente 'Spianata piccante',15,2
execute InserisciIngrediente 'Funghi',50,20
execute InserisciIngrediente 'Carciofo',15,20
execute InserisciIngrediente 'Cotto',40,20
execute InserisciIngrediente 'Oliva',30,15
execute InserisciIngrediente 'Funghi porcini',50,2
execute InserisciIngrediente 'Stracchino',20,4
execute InserisciIngrediente 'Speck',15,3
execute InserisciIngrediente 'Rucola',10,30
execute InserisciIngrediente 'Grana',30,40
execute InserisciIngrediente 'Verdure di stagione',30,15
execute InserisciIngrediente 'Patate',20,10
execute InserisciIngrediente 'Salsiccia',30,5
execute InserisciIngrediente 'Pomodorini',10,30
execute InserisciIngrediente 'Ricotta',30,15
execute InserisciIngrediente 'Provola',20,1
execute InserisciIngrediente 'Gorgonzola',25,4
execute InserisciIngrediente 'Pomodoro fresco',20,14
execute InserisciIngrediente 'Basilico',10,50
execute InserisciIngrediente 'Bresaola',35,0

--procedure 2 :assegnazione di un ingrediente ad una pizza
create procedure InserisciPizzaIngrediente
@nomePizza varchar(30),
@nomeIngrediente varchar(30)
as
declare @CODICE_PIZZA int
select @CODICE_PIZZA = p.CodicePizza
from Pizza p
where p.Nome = @nomePizza

declare @CODICE_INGREDIENTE int
select @CODICE_INGREDIENTE = i.CodiceIngrediente
from Ingrediente i
where i.Nome =@nomeIngrediente

insert into PizzaIngrediente values(@CODICE_PIZZA,@CODICE_INGREDIENTE)

--Test 
execute InserisciPizzaIngrediente 'Margherita','Pomodoro'
select * from PizzaIngrediente

--Inserimento dati PizzaIngrediente

execute InserisciPizzaIngrediente 'Margherita','Pomodoro'
execute InserisciPizzaIngrediente 'Margherita','Mozzarella'
execute InserisciPizzaIngrediente 'Bufala','Pomodoro'
execute InserisciPizzaIngrediente 'Bufala','Mozzarella di bufala'
execute InserisciPizzaIngrediente 'Diavola','Pomodoro'
execute InserisciPizzaIngrediente 'Diavola','Mozzarella'
execute InserisciPizzaIngrediente 'Diavola','Spianata piccante'
execute InserisciPizzaIngrediente 'Quattro stagioni','Pomodoro'
execute InserisciPizzaIngrediente 'Quattro stagioni','Mozzarella'
execute InserisciPizzaIngrediente 'Quattro stagioni','Funghi'
execute InserisciPizzaIngrediente 'Quattro stagioni', 'Carciofo'
execute InserisciPizzaIngrediente 'Quattro stagioni','Cotto'
execute InserisciPizzaIngrediente 'Quattro stagioni','Oliva'
execute InserisciPizzaIngrediente 'Porcini','Mozzarella'
execute InserisciPizzaIngrediente 'Porcini', 'Funghi porcini'
execute InserisciPizzaIngrediente 'Porcini','Pomodoro'
execute InserisciPizzaIngrediente 'Dioniso','Pomodoro'
execute InserisciPizzaIngrediente 'Dioniso','Mozzarella'
execute InserisciPizzaIngrediente 'Dioniso','Stracchino'
execute InserisciPizzaIngrediente 'Dioniso','Speck'
execute InserisciPizzaIngrediente 'Dioniso','Rucola'
execute InserisciPizzaIngrediente 'Dioniso','Grana'
execute InserisciPizzaIngrediente 'Ortolana','Pomodoro'
execute InserisciPizzaIngrediente 'Ortolana','Mozzarella'
execute InserisciPizzaIngrediente 'Ortolana','Verdure di stagione'
execute InserisciPizzaIngrediente 'Patate e salsiccia','Mozzarella'
execute InserisciPizzaIngrediente 'Patate e salsiccia','Patate'
execute InserisciPizzaIngrediente 'Patate e salsiccia','Salsiccia'
execute InserisciPizzaIngrediente 'Pomodorini','Mozzarella'
execute InserisciPizzaIngrediente 'Pomodorini','Pomodorini'
execute InserisciPizzaIngrediente 'Pomodorini','Ricotta'
execute InserisciPizzaIngrediente 'Quattro formaggi','Mozzarella'
execute InserisciPizzaIngrediente 'Quattro formaggi','Provola'
execute InserisciPizzaIngrediente 'Quattro formaggi','Gorgonzola'
execute InserisciPizzaIngrediente 'Quattro formaggi','Grana'
execute InserisciPizzaIngrediente 'Caprese','Mozzarella'
execute InserisciPizzaIngrediente 'Caprese','Pomodoro fresco'
execute InserisciPizzaIngrediente 'Caprese','Basilico'
execute InserisciPizzaIngrediente 'Zeus','Mozzarella'
execute InserisciPizzaIngrediente 'Zeus','Bresaola'
execute InserisciPizzaIngrediente 'Zeus', 'Rucola'


--3.Aggiornamento del prezzo di una pizza (parametri: nome pizza e nuovo prezzo)

create procedure AggiornaPrezzo
@nomePizza varchar(30),
@nuovoPrezzo decimal(10,2)
as
declare @CODICE_PIZZA int

select @CODICE_PIZZA = p.CodicePizza
from Pizza p
where p.Nome = @nomePizza

update Pizza
set Prezzo=@nuovoPrezzo
where CodicePizza = @CODICE_PIZZA
go


execute AggiornaPrezzo 'Margherita',5.50

select * from pizza

--4. Eliminazione di un ingrediente da una pizza (parametri: nome pizza, nome ingrediente) 

create procedure EliminaIngredienteDaPizza
@nomePizza varchar(30),
@nomeIngrediente varchar(30)
as

declare @CODICE_PIZZA int
select @CODICE_PIZZA = p.CodicePizza
from Pizza p
where p.Nome = @nomePizza

declare @CODICE_INGREDIENTE int
select @CODICE_INGREDIENTE = i.CodiceIngrediente
from Ingrediente i
where i.Nome =@nomeIngrediente

delete from PizzaIngrediente where CodiceIngrediente= @CODICE_INGREDIENTE and CodicePizza= @CODICE_PIZZA
go

select * from PizzaIngrediente
select* from Ingrediente
execute EliminaIngredienteDaPizza 'Margherita','Mozzarella'

--5. Incremento del 10% del prezzo delle pizze contenenti un ingrediente (parametro: nome ingrediente) 

create procedure AumentaPrezzo
@nomeIngrediente varchar(30)
as 

declare @CODICE_INGREDIENTE int
select @CODICE_INGREDIENTE = i.CodiceIngrediente
from Ingrediente i
where i.Nome =@nomeIngrediente

declare @CODICE_PIZZA int
select @CODICE_PIZZA= pizIng.CodicePizza
from PizzaIngrediente pizIng
where pizIng.CodiceIngrediente = @CODICE_INGREDIENTE

update Pizza
set Prezzo += (Prezzo/100*10)
from Pizza join PizzaIngrediente on Pizza.CodicePizza=PizzaIngrediente.CodicePizza
where PizzaIngrediente.CodiceIngrediente = @CODICE_INGREDIENTE

select * from Ingrediente 
execute AumentaPrezzo 'Pomodoro'

select * from Pizza





------------------------------------------QUERY-----------------------------------------------------------

--1. Estrarre tutte le pizze con prezzo superiore a 6 euro.
select p.Nome, p.Prezzo
from Pizza p
where p.Prezzo>6

--2. Estrarre la pizza/le pizze più costosa/e.
select p.Nome, p.Prezzo
from Pizza p 
where p.Prezzo =( select max(p.Prezzo) from Pizza p)

--3. Estrarre le pizze «bianche»
select p.Nome
from Pizza p
where p.Nome not in (select p.Nome
                     from Pizza p join PizzaIngrediente pizIng on p.CodicePizza=pizIng.CodicePizza
                                  join Ingrediente i on i.CodiceIngrediente=pizIng.CodiceIngrediente
                     where i.Nome='Pomodoro')

--4. Estrarre le pizze che contengono funghi (di qualsiasi tipo).
select p.Nome
from Pizza p join PizzaIngrediente pizIng on p.CodicePizza=pizIng.CodicePizza
             join Ingrediente i on i.CodiceIngrediente=pizIng.CodiceIngrediente
where i.Nome like 'Funghi%'




---------------------------------------FUNZIONI----------------------------------------------
--1. Tabella listino pizze (nome, prezzo) (parametri: nessuno)

create function Listino_PizzaNe()
returns table
as
return 
select p.Nome, p.Prezzo
from Pizza p
go

select * from dbo.Listino_PizzaNe()

--2. Tabella listino pizze (nome, prezzo) contenenti un ingrediente (parametri: nome ingrediente)

create function Listino_PrezzoIng(@nomeIngrediente varchar(30))
returns table 
as 
return 
select p.Nome, p.Prezzo
from Pizza p join PizzaIngrediente pizIng on p.CodicePizza=pizIng.codicePizza
	join Ingrediente i on i.CodiceIngrediente=pizIng.codiceIngrediente
where i.Nome=@nomeIngrediente

select* from dbo.Listino_PrezzoIng('funghi')

--3. Tabella listino pizze (nome, prezzo) che non contengono un certo ingrediente (parametri: nome ingrediente)
create function Listino_NonContegono(@nomeIngrediente varchar(30))
returns table 
as 
return 
select distinct p.Nome, p.Prezzo
from Pizza p 
where p.CodicePizza not in (select p.CodicePizza
									from Pizza p join PizzaIngrediente pizIng on p.CodicePizza=pizIng.codicePizza
									join Ingrediente i on i.CodiceIngrediente=pizIng.codiceIngrediente
									where i.Nome=@nomeIngrediente)

select* from dbo.Listino_NonContegono('pomodoro')

--4. Calcolo numero pizze contenenti un ingrediente (parametri: nome ingrediente)
create function ListaNumeroPizzaIng(@nomeIngrediente varchar(30))
returns table 
as 
return 
select COUNT(*) as [Pizze contenenti un ingrediente]
from Pizza p join PizzaIngrediente pizIng on p.CodicePizza=pizIng.codicePizza
	join Ingrediente i on i.CodiceIngrediente=pizIng.codiceIngrediente
where i.Nome=@nomeIngrediente

select* from dbo.ListaNumeroPizzaIng('pomodoro')

--5. Calcolo numero pizze che non contengono un ingrediente (parametri: codice ingrediente)

create function ListaNumeroPizzaNonContengono(@nomeIngrediente varchar(30))
returns table 
as 
return 
select COUNT(*) as [Nuemro pizze che non contengono un ingrediente]
from Pizza p 
where p.CodicePizza not in (select p.CodicePizza
									from Pizza p join PizzaIngrediente pizIng on p.CodicePizza=pizIng.codicePizza
									join Ingrediente i on i.CodiceIngrediente=pizIng.codiceIngrediente
									where i.Nome=@nomeIngrediente)

select* from dbo.ListaNumeroPizzaNonContengono('pomodoro')

--6. Calcolo numero ingredienti contenuti in una pizza (parametri: nome pizza)
create function NumeroIngredientiPizza(@nomePizza varchar(30))
returns int
as
begin
declare @numeroPizze int

select @numeroPizze=Count(*) 
from Pizza p join PizzaIngrediente pizIng on p.CodicePizza=pizIng.codicePizza
	join Ingrediente i on i.CodiceIngrediente=pizIng.codiceIngrediente
where p.Nome=@nomePizza
return @numeroPizze
end

select dbo.NumeroIngredientiPizza('caprese') as [numero ingrediente]



----------------------------------view----------------------
create view [Menu] as(
select p.CodicePizza, p.Nome, i.Nome as 'Ingrediente', p.Prezzo
from Pizza p join PizzaIngrediente pizIng on p.CodicePizza=pizIng.codicePizza
	join Ingrediente i on i.CodiceIngrediente=pizIng.codiceIngrediente	);

select * from Menu