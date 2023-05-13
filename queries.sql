SELECT * 
FROM vehicles 
LEFT JOIN owners 
ON vehicles.owner_id = owners.id;

SELECT owners.first_name, owners.last_name, COUNT(vehicles.id) AS vehicle_count 
FROM owners 
LEFT JOIN vehicles 
ON owners.id = vehicles.owner_id 
GROUP BY owners.id, owners.first_name, owners.last_name 
ORDER BY owners.first_name ASC;

SELECT 
  first_name, last_name, 
  ROUND(AVG(price)) as average_price, 
  COUNT(owner_id) 
FROM owners o 
JOIN vehicles v on o.id=v.owner_id 
GROUP BY 
  (first_name, last_name) 
HAVING 
  COUNT(owner_id) > 1 AND ROUND(AVG(price)) > 10000 
ORDER BY first_name DESC;