select count(*) from music where albumNo = 1;

insert into playList (playListNo, musicNo, albumNo)
(select playList_seq.nextval, musicNo,albumNo from music where albumNo = 5);

select playList_seq.nextval, musicNo,albumNo from music where albumNo = 1;

drop table board cascade CONSTRAINTS purge;
drop SEQUENCE board_seq;

create table playList(
    playListNo number primary key,
    musicNo number REFERENCES music(musicNo),
    albumNo number REFERENCES album(albumNo)
);

create SEQUENCE playList_seq;