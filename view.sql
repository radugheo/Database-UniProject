--alegem antrenorii care lucreaza cu un staff alcatuit din minim 21 de oameni
create view vizualizare as(
    select c.coach_name
    from Coach c
    join Staff s on s.id_staff = c.id_staff
    where s.staff_size > 20
    group by c.coach_name
);

select * from vizualizare;
drop view vizualizare;
