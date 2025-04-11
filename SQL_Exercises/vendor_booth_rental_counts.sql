select vendor_id, count(vendor_id) from vendor_booth_assignments 
group by vendor_id
order by vendor_id;
