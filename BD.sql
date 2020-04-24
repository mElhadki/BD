/*Creation Base De Donnée*/

Create database GRecette ;
use GRecette;



/*==============================================================*/
/* Table: Ingredient                                            */
/*==============================================================*/
create table Ingredient (
   Ref_Ingredient       int                  not null,
   Nom_Ingredient       varchar(254)         null,
   Calories_Ingredient  varchar(254)         null,
   constraint PK_INGREDIENT primary key nonclustered (Ref_Ingredient)
)
go

/*==============================================================*/
/* Table: Produit                                               */
/*==============================================================*/
create table Produit (
   Ref_Produit          int                  not null,
   Ref_Rangement        int                  not null,
   Ref_Ingredient       int                  not null,
   Description_Produit  varchar(254)         null,
   Quantite_Produit     int                  null,
   Prix_Produit         float                null,
   constraint PK_PRODUIT primary key nonclustered (Ref_Produit)
)
go

/*==============================================================*/
/* Table: Rangement                                             */
/*==============================================================*/
create table Rangement (
   Ref_Rangement        int                  not null,
   Nom_Rangement        varchar(254)         null,
   constraint PK_RANGEMENT primary key nonclustered (Ref_Rangement)
)
go

/*==============================================================*/
/* Table: Recette                                               */
/*==============================================================*/
create table Recette (
   Ref_Recette          int                  not null,
   Nom_Recette          varchar(254)         null,
   Description_Recette  varchar(254)         null,
   Calories_Recette     varchar(254)         null,
   Niveau_Difficulte    varchar(254)         null,
   NbrPersonne          int                  null,
   constraint PK_RECETTE primary key nonclustered (Ref_Recette)
)
go

/*==============================================================*/
/* Index: ASSOCIATION_1_FK                                      */
/*==============================================================*/
create index ASSOCIATION_1_FK on Produit (
Ref_Rangement ASC
)
go

/*==============================================================*/
/* Index: ASSOCIATION_2_FK                                      */
/*==============================================================*/
create index ASSOCIATION_2_FK on Produit (
Ref_Ingredient ASC
)
go

/*==============================================================*/
/* Table: Association_3                                         */
/*==============================================================*/
create table Association_3 (
   Ref_Ingredient       int                  not null,
   Ref_Recette          int                  not null,
   constraint PK_ASSOCIATION_3 primary key (Ref_Ingredient, Ref_Recette)
)
go


/*==============================================================*/
/* Index: ASSOCIATION_3_FK                                      */
/*==============================================================*/
create index ASSOCIATION_3_FK on Association_3 (
Ref_Ingredient ASC
)
go

/*==============================================================*/
/* Index: ASSOCIATION_3_FK2                                     */
/*==============================================================*/
create index ASSOCIATION_3_FK2 on Association_3 (
Ref_Recette ASC
)
go



alter table Association_3
   add constraint FK_ASSOCIAT_ASSOCIATI_INGREDIE foreign key (Ref_Ingredient)
      references Ingredient (Ref_Ingredient)
go

alter table Association_3
   add constraint FK_ASSOCIAT_ASSOCIATI_RECETTE foreign key (Ref_Recette)
      references Recette (Ref_Recette)
go

alter table Produit
   add constraint FK_PRODUIT_ASSOCIATI_RANGEMEN foreign key (Ref_Rangement)
      references Rangement (Ref_Rangement)
go

alter table Produit
   add constraint FK_PRODUIT_ASSOCIATI_INGREDIE foreign key (Ref_Ingredient)
      references Ingredient (Ref_Ingredient)
go


/* Creation des utilisateurs */


-- Creates the login Mariem with password 'Admin123'.  
CREATE LOGIN Mariem   
    WITH PASSWORD = 'Admin123';  
GO  

-- Creates a database user for the login created above.  
CREATE USER Mariem FOR LOGIN Mariem;  
GO  
 
GRANT all TO Mariem;  
GO 

-- Creates the login Utilisateur with password 'Utilisateur123'.  
CREATE LOGIN Utilisateur   
    WITH PASSWORD = 'Utilisateur123';  
GO  

-- Creates a database user for the login created above.  
CREATE USER Utilisateur FOR LOGIN Utilisateur;  
GO  
 
GRANT select,insert to Utilisateur ;  
GO 

-- Insertion --

-- Insert Into Table Recette --

insert into Recette values (1,'Artichauts poivrade','des petits artichauts violets','25500 Kcal','Facile',4) 
insert into Recette values (2,'Avocat au thon','avocat, thon, herbes hachées et mayonnaise','7000 Kcal','Moyenne',2) 
insert into Recette values (3,'Coleslaw Breton','salade de chou et carotte','37500 Kcal','Facile',5) 

-- Insert Into Table Rangement --

insert into Rangement values (1,'Rangement1')

-- Insert Into Table Ingredient --

insert into Ingredient values (1,'artichauts violets','2000 Lcal')

-- Insert Into Table Produit --

insert into Produit values (1,1,1,'salade avec des herbes',2,200.49)

-- Insert Into Table Association --

insert into Association_3 values (1,1)
insert into Association_3 values (1,2)

-- Select From All tables --

select * from Recette
select * from Rangement
select * from Ingredient
select * from Produit

-- Update -- 

UPDATE Recette
SET Calories_Recette='30087 Kcal', NbrPersonne=6
WHERE Ref_Recette=1;

UPDATE Rangement
SET Nom_Rangement='Rangement A'
WHERE Ref_Rangement=1;

UPDATE Ingredient
SET Calories_Ingredient='34000 Kcal'
WHERE Ref_Ingredient=1;

UPDATE Produit
SET Quantite_Produit=5
WHERE Ref_Ingredient=1;

--Delete --

DELETE FROM Produit WHERE Ref_Produit=1;
DELETE FROM Rangement WHERE Ref_Rangement=1;
Delete From Association_3 Where Ref_Ingredient=1 and Ref_Recette=1;
Delete From Association_3 Where Ref_Ingredient=1 and Ref_Recette=2;
DELETE FROM Recette WHERE Ref_Recette=1;
DELETE FROM Ingredient WHERE Ref_Ingredient=1;

