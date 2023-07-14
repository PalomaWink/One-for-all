CREATE TABLE favorite_song(
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES user_person (id),
    song_id INT,
    FOREIGN KEY (song_id) REFERENCES song (id),
    UNIQUE KEY (user_id, song_id)
) engine = InnoDB;

INSERT INTO favorite_song (user_id, song_id)
VALUES
  (1, 3),
  (1, 6),
  (1, 10),
  (2, 4),
  (3, 1),
  (3, 3),
  (4, 4),
  (4, 7),
  (5, 2),
  (5, 10),
  (8, 4),
  (9, 7),
  (10, 3);
  