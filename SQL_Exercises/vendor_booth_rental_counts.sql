-- how many times each vendor has rented a booth at the farmer's market
select vendor_id, count(vendor_id) from vendor_booth_assignments 
group by vendor_id
order by vendor_id;
