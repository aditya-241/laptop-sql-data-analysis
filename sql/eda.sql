USE sql_cx_live; 
SELECT * FROM laptops;
 -- head, tail and sample 
SELECT * FROM laptops 
ORDER BY `Unnamed: 0` LIMIT 5; 
SELECT * FROM laptops 
ORDER BY `Unnamed: 0` DESC LIMIT 5; 
SELECT * FROM laptops 
ORDER BY rand() LIMIT 5; 

SELECT COUNT(Price), 
MIN(Price), 
MAX(Price), 
AVG(Price), 
STD(Price) 
FROM laptops ; 

WITH quartiles AS (
    SELECT 
        Price,
        NTILE(4) OVER (ORDER BY Price) AS quartile
    FROM laptops
)
SELECT 
    MAX(CASE WHEN quartile = 1 THEN Price END) AS Q1,
    MAX(CASE WHEN quartile IN (2,3) THEN Price END) AS Q2, -- Median approx
    MAX(CASE WHEN quartile = 3 THEN Price END) AS Q3
FROM quartiles;

-- missing value 
SELECT COUNT(Price) 
FROM laptops 
WHERE Price IS NULL; 

SELECT t.buckets,REPEAT('*',COUNT(*)/5) FROM (SELECT price, 
CASE 
WHEN price BETWEEN 0 AND 25000 THEN '0-25K' 
WHEN price BETWEEN 25001 AND 50000 THEN '25K-50K' 
WHEN price BETWEEN 50001 AND 75000 THEN '50K-75K' 
WHEN price BETWEEN 75001 AND 100000 THEN '75K-100K' 
ELSE '>100K' 
END AS 'buckets' 
FROM laptops) t 
GROUP BY t.buckets;

SELECT Company,COUNT(Company) FROM laptops 
GROUP BY Company; 

SELECT cpu_speed,Price FROM laptops; 
SELECT * FROM laptops; 

SELECT Company, 
SUM(CASE WHEN Touchscreen = 1 THEN 1 ELSE 0 END) AS 'Touchscreen_yes', 
SUM(CASE WHEN Touchscreen = 0 THEN 1 ELSE 0 END) AS 'Touchscreen_no' 
FROM laptops 
GROUP BY Company; 

SELECT DISTINCT cpu_brand FROM laptops; 
SELECT Company, 
SUM(CASE WHEN cpu_brand = 'Intel' THEN 1 ELSE 0 END) AS 'intel', 
SUM(CASE WHEN cpu_brand = 'AMD' THEN 1 ELSE 0 END) AS 'amd', 
SUM(CASE WHEN cpu_brand = 'Samsung' THEN 1 ELSE 0 END) AS 'samsung' 
FROM laptops 
GROUP BY Company; 

-- Categorical Numerical Bivariate analysis 


-- Dealing with missing values 
SELECT * FROM laptops 
WHERE price IS NULL;

UPDATE laptops SET price = NULL WHERE `Unnamed: 0` IN (7,869,1148,827,865,821,1056,1043,692,1114);

-- replace missing values with mean of price 
UPDATE laptops 
JOIN (SELECT AVG(price) AS avg_price FROM laptops) AS t
SET laptops.price = t.avg_price
WHERE laptops.price IS NULL;

-- Feature Engineering 
ALTER TABLE laptops ADD COLUMN ppi INTEGER; 
UPDATE laptops 
SET ppi = ROUND(SQRT(resolution_width*resolution_width + 
resolution_height*resolution_height)/Inches); 
SELECT * FROM laptops 
ORDER BY ppi DESC;

ALTER TABLE laptops ADD COLUMN screen_size VARCHAR(255) AFTER Inches; 
UPDATE laptops 
SET screen_size = 
CASE 
WHEN Inches < 14.0 THEN 'small' 
WHEN Inches >= 14.0 AND Inches < 17.0 THEN 'medium' 
ELSE 'large' 
END; 
SELECT screen_size,AVG(price) FROM laptops 
GROUP BY screen_size; 

SELECT * FROM laptops;

-- company wise avg price
SELECT Company, AVG(Price) AS avg_price
FROM laptops
GROUP BY Company
ORDER BY avg_price DESC 
limit 5;

-- cpu speed vs price
SELECT 
    CASE 
        WHEN cpu_speed < 2.0 THEN 'Low'
        WHEN cpu_speed BETWEEN 2.0 AND 3.0 THEN 'Medium'
        ELSE 'High'
    END AS cpu_category,
    AVG(price) AS avg_price
FROM laptops
GROUP BY cpu_category;

-- compare touchscreen vs no touch screen
SELECT Touchscreen, AVG(price) AS avg_price
FROM laptops
GROUP BY Touchscreen;
 
 -- correlation between columns 
SELECT 
    (AVG(price * cpu_speed) - AVG(price) * AVG(cpu_speed)) /
    (STDDEV(price) * STDDEV(cpu_speed)) AS correlation
FROM laptops;








