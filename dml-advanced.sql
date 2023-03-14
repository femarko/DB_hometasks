-- 1. количество исполнителей в каждом жанре
SELECT genre_name, count (*) FROM genre g 
JOIN performer_genre pg ON g.id = pg.genre_id
JOIN performer p ON pg.performer_id = p.id
GROUP BY genre_name
ORDER BY count DESC;

-- 2. количество треков, вошедших в альбомы 2019-2020 годов
SELECT count(*) FROM album a
JOIN track t ON a.id = t.album_id
WHERE release_year >= 2019 AND release_year <= 2020;
--GROUP BY album_name; -- не нужна группировка, потому что необходимо получить общее количество, а не по каждому альбому.

-- 3. средняя продолжительность треков по каждому альбому
SELECT album_name, avg(duration)  FROM album a 
JOIN track ON a.id = album_id
GROUP BY album_name
ORDER BY album_name;

-- 4. все исполнители, которые не выпустили альбомы в 2020 году
/*SELECT performer_name FROM performer p 
JOIN album a ON p.id = a.performer_id
WHERE release_year <> 2020;*/

SELECT performer_name/* Получаем имена исполнителей */
FROM performer p /* Из таблицы исполнителей */
WHERE performer_name NOT IN ( /* Где имя исполнителя не входит в вложенную выборку */
    SELECT performer_name /* Получаем имена исполнителей */
    FROM performer p2  /* Из таблицы исполнителей */
    JOIN performer_album pa  ON p2.id  = pa.performer_id  /* Объединяем с промежуточной таблицей */
    JOIN album a  ON pa.album_id  = a.id  /* Объединяем с таблицей альбомов */
    WHERE release_year = 2020 /* Где год альбома равен 2020 */
);

-- 5. названия сборников, в которых присутствует конкретный исполнитель (выберите сами)
SELECT compilation_name FROM compilation c 
JOIN track_compilation tc ON c.id = tc.compilation_id 
JOIN track t ON tc.track_id = t.id 
JOIN album a ON t.album_id = a.id 
JOIN performer_album pa ON a.id = pa.album_id 
JOIN performer p ON pa.performer_id = p.id 
WHERE performer_name = 'Oneword';

-- 6. название альбомов, в которых присутствуют исполнители более 1 жанра
SELECT album_name FROM album a 
JOIN performer_album pa ON a.id = pa.album_id 
JOIN performer p ON pa.performer_id = p.id 
JOIN performer_genre pg ON p.id = pg.genre_id 
--JOIN genre g ON pg.genre_id = g.id 
--WHERE (SELECT count(performer_id) > 1  FROM performer_genre pg)
GROUP BY a.album_name, performer_name
HAVING count(pg.genre_id) > 1;
--ORDER BY a.album_name;

-- 7. наименование треков, которые не входят в сборники
SELECT track_name, compilation_name FROM track t 
LEFT JOIN track_compilation tc ON t.id = tc.track_id
LEFT JOIN compilation c ON tc.compilation_id  = c.id
WHERE compilation_name IS NULL;

-- 8. исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько)
SELECT performer_name FROM performer p
JOIN performer_album pa ON p.id = pa.performer_id 
JOIN album a ON pa.album_id = a.id 
JOIN track t ON a.id = t.album_id
WHERE duration = (SELECT min(duration) FROM track);

-- 9. название альбомов, содержащих наименьшее количество треков
SELECT album_name FROM album
JOIN track ON album.id = track.album_id
GROUP BY album_name
HAVING count(track.album_id) = (SELECT count(album_id) FROM track GROUP BY album_id LIMIT 1)
ORDER BY album_name;