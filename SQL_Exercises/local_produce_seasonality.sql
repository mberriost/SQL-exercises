-- When is each type of fresh fruit or vegatable in season,locally?
select 
pc.product_category_name,
p.product_name,
MIN(vi.market_date),
MAX(vi.market_date)
 from product p
 join product_category pc on p.product_category_id = pc.product_category_id
join vendor_inventory vi on p.product_id = vi.product_id
join market_date_info md on vi.market_date = md.market_date
where p.product_category_id = 1
group by p.product_id;
