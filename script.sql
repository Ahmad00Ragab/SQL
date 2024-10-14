/* foreign key */
create table new(
    foreingKeyColumn int,
    foreign key(foreingKeyColumn) references new2(pimaryKey) on delete set null
);


/* unique key */
create table new(
    uniqueKeyColumn  int UNIQUE
);


