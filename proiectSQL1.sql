SELECT TOP 5
    c.CustomerId,
    c.FirstName + ' ' + c.LastName AS CustomerName,
    c.Country,
    SUM(i.Total) AS TotalSpent
FROM dbo.Customer c
JOIN dbo.Invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId, c.FirstName, c.LastName, c.Country
ORDER BY TotalSpent DESC;

SELECT 
    BillingCountry,
    SUM(Total) AS TotalRevenue
FROM dbo.Invoice
GROUP BY BillingCountry
ORDER BY TotalRevenue DESC;

SELECT 
    BillingCountry,
    ROUND(AVG(Total), 2) AS AverageOrderValue,
    COUNT(InvoiceId) AS TotalOrders
FROM dbo.Invoice
GROUP BY BillingCountry
ORDER BY AverageOrderValue DESC;

SELECT TOP 5
    g.Name AS GenreName,
    SUM(il.Quantity) AS TotalTracksSold
FROM dbo.Genre g
JOIN dbo.Track t ON g.GenreId = t.GenreId
JOIN dbo.InvoiceLine il ON t.TrackId = il.TrackId
GROUP BY g.GenreId, g.Name
ORDER BY TotalTracksSold DESC;

SELECT TOP 3
    t.Name AS TrackName,
    art.Name AS ArtistName,
    SUM(il.UnitPrice * il.Quantity) AS TotalRevenue
FROM dbo.Track t
JOIN dbo.InvoiceLine il ON t.TrackId = il.TrackId
JOIN dbo.Album al ON t.AlbumId = al.AlbumId
JOIN dbo.Artist art ON al.ArtistId = art.ArtistId
GROUP BY t.TrackId, t.Name, art.Name
ORDER BY TotalRevenue DESC;

SELECT 
    t.TrackId,
    t.Name AS TrackName,
    ar.Name AS ArtistName,
    al.Title AS AlbumTitle
FROM dbo.Track t
JOIN dbo.Album al ON t.AlbumId = al.AlbumId
JOIN dbo.Artist ar ON al.ArtistId = ar.ArtistId
LEFT JOIN dbo.InvoiceLine il ON t.TrackId = il.TrackId
WHERE il.InvoiceLineId IS NULL
ORDER BY ar.Name, t.Name;

SELECT 
    InvoiceId,
    CustomerId,
    InvoiceDate,
    Total
FROM dbo.Invoice
WHERE Total > (SELECT AVG(Total) FROM dbo.Invoice)
ORDER BY Total DESC;

SELECT TOP 1
    YEAR(InvoiceDate) AS SalesYear,
    MONTH(InvoiceDate) AS SalesMonth,
    SUM(Total) AS MonthlyRevenue
FROM dbo.Invoice
GROUP BY YEAR(InvoiceDate), MONTH(InvoiceDate)
ORDER BY MonthlyRevenue DESC;

SELECT 
    CustomerId,
    FirstName + ' ' + LastName AS CustomerName
FROM dbo.Customer
WHERE CustomerId NOT IN (
    SELECT DISTINCT CustomerId
    FROM dbo.Invoice
    WHERE YEAR(InvoiceDate) = 2019
);

SELECT TOP 3
    BillingCountry,
    SUM(Total) AS CountryRevenue
FROM dbo.Invoice
WHERE BillingCountry <> 'USA'
GROUP BY BillingCountry
ORDER BY CountryRevenue DESC;
