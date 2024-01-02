use e_commerce_d;
-- 1)Query the address, starttime and endtime of the servicepoints in the same city as userid 5  ?
select servicepoint.streetAddr,starttime,endtime from servicepoint
inner join address
on address.city=servicepoint.city
left join user
on user.userid=address.userId 
where user.userId=5;

-- 2)Query the information of laptop



-- 3)Query the total quantity of products from store with storeid 8 in the shopping cart?
select product.name,sum(quantity) from product
join store 
on product.s_id=store.s_id
left join save_to_shopping_cart
on save_to_shopping_cart.p_id=product.p_id
where store.s_id='8'
group by product.name;

-- 4)Query the name and address of orders delivered on 2017-02-17?
select name,streetAddr from address 
 inner join Deliver_to 
on address.addr_id=Deliver_to.addr_id
left join orders
on orders.ordernumber=deliver_to.ordernumber
where timedelivered='2017-02-17';

-- 5)Query the comments of product 12345678?

-- 6)Insert the user id of sellers whose name starts with A into buyer?
insert into buyer 
(select user.userId from user
inner join seller
on user.userId=seller.userId
where user.name regexp '^a');

-- 7) Update the payment state of orders to unpaid which created after year 2017 and with total amount greater than 50.?

update orders
set paymentStatus='Unpaid'
where totalAmount > 50 and year(creationtime)>=2017;

-- 8)Update the name and contact phone number of address where the provice is Quebec and city is montreal.?
update address
set  name= 'Vito Carleone',phone_number='824-977-2892'
where province='Quebec' and city='montreal';



-- 9)Create view of all products whose price above average price?


create view products_average as
select * from product
where price > (select avg(price) as avgg from product);

-- 10)Create view of all products sales in 2016.?

create view products_2016 as
select * from product 
 join comments 
on product.p_id=comments.p_id
where year(comments.creationtime) =2016 ;


