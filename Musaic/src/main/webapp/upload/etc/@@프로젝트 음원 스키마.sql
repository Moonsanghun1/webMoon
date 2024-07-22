-- 테이블과 시퀀스가 존재하면 삭제
DROP TABLE music CASCADE CONSTRAINTS PURGE;
DROP SEQUENCE music_seq;

CREATE TABLE music (
musicNo NUMBER PRIMARY key,
albumNo NUMBER REFERENCES album(albumNo),
musicTitle VARCHAR2(30) not null,
musicFile VARCHAR2(200) not null,
musicStatus VARCHAR2(9)DEFAULT '공개' CHECK (musicStatus IN ('공개','비공개'))not null,
songWriter VARCHAR2(30) not null,
lyricist VARCHAR2(30) not null,
singer VARCHAR2(300) not null,
lyric VARCHAR2(3000) not null);

CREATE SEQUENCE music_seq;

INSERT INTO music (
    musicNo,
    musicTitle,
    musicFile,
    songWriter,
    lyricist,
    singer,
    lyric
) VALUES (
    1,  -- musicNo (숫자로 입력)
    'FOREVER',  -- musicTitle
    'BABYMONSTER_FOREVER.mp3',  -- musicFile
    'CHOICE37',  -- songWriter
    'BLVSH',  -- lyricist
    'BABYMONSTER',  -- singer
    'Alright ok ok ok ok
Alright ok
BABYMONSTER

I got no worries on my mind
난 멈추지 않아
So you can say goodbye

I’ll fulfill my fantasy
And you can watch and see
박수나 쳐보지

눈부셔
They say she looking flawless
I know
타고났지 Like this

She’s unlike unlike anybody
여기저기 다 난리 난리
가나다라마바 싸가지
Gotta gotta go so c’est la vie

I’m dancing in the moonlight
Ooh ooh ooh ooh ooh ooh
Ooh ooh ooh ooh ay

Can’t stop this feeling tonight
What you waiting for

Baby it was all a dream
You thought I was yours
멋대로 착각하지는 마

It’s bitter it’s sweet
저 하늘 높이
I’m spreading my wings
Like I’mma live

Forever
Like I’mma live forever
Forever
Like I’mma like I’mma

Forever
Like I’m gonna live
Like I’m gonna live forever

OK you know what it is

I’m that nice 뭘 것 같아 너와 내 차이
Pull up on me pay the price
Put a milli on a rock my type
Never seen it in your life

예뻐 그러니까 바빠 아니 나빠 온 세상 울리는 Bad girl
B (B) A (A) B (B) Y (Y) M (M) O (O) N
Get money

Bout it bout it 발끝까지 까지
리듬 타지 타지 기분 짜릿짜릿
Everybody get down
Roll up on ‘em with the motor running
I’mma give you something
Bet you put the money in the bag

I’m dancing in the moonlight
Ooh ooh ooh ooh ooh ooh
Ooh ooh ooh ooh ay

Can’t stop this feeling tonight
What you waiting for

Baby it was all a dream
You thought I was yours
멋대로 착각하지는 마

It’s bitter it’s sweet
저 하늘 높이
I’m spreading my wings
Like I’mma live

Forever
Like I’mma live forever
Forever
Like I’mma like I’mma

Forever
Like I’m gonna live
Like I’m gonna live forever

I can see the bright horizon
세상이란 벽을 넘어서
No nothing can stop me now

We forever forever
Forever ever ever

Ooh ooh
Baby it was all a dream
You thought I was yours
멋대로 착각하지는 마

It’s bitter it’s sweet
저 하늘 높이
I’m spreading my wings
Like I’mma live

Forever (Forever ever ever)
Forever (We forever forever forever ever ever)
Forever

Like I’m gonna live
Like I’m gonna live forever'
);

-- music 테이블에 샘플 데이터 삽입
INSERT INTO music (
    musicNo, albumNo, musicTitle, musicFile, musicStatus, songWriter, lyricist, singer, lyric
) VALUES (
    music_seq.nextval, 1, 'FOREVER', 'BABYMONSTER_FOREVER.mp3', '공개', 'CHOICE37', 'BLVSH', 'BABYMONSTER', 'Alright ok ok ok ok Alright ok BABYMONSTER...'
);

INSERT INTO music (
    musicNo, albumNo, musicTitle, musicFile, musicStatus, songWriter, lyricist, singer, lyric
) VALUES (
    music_seq.nextval, 2, 'SONG 2', 'SONG2.mp3', '공개', 'SONGWRITER2', 'LYRICIST2', 'SINGER2', '가사2의 내용입니다...'
);

INSERT INTO music (
    musicNo, albumNo, musicTitle, musicFile, musicStatus, songWriter, lyricist, singer, lyric
) VALUES (
    music_seq.nextval, 3, 'SONG 3', 'SONG3.mp3', '공개', 'SONGWRITER3', 'LYRICIST3', 'SINGER3', '가사3의 내용입니다...'
);

INSERT INTO music (
    musicNo, albumNo, musicTitle, musicFile, musicStatus, songWriter, lyricist, singer, lyric
) VALUES (
    music_seq.nextval, 4, 'SONG 4', 'SONG4.mp3', '공개', 'SONGWRITER4', 'LYRICIST4', 'SINGER4', '가사4의 내용입니다...'
);

INSERT INTO music (
    musicNo, albumNo, musicTitle, musicFile, musicStatus, songWriter, lyricist, singer, lyric
) VALUES (
    music_seq.nextval, 5, 'SONG 5', 'SONG5.mp3', '공개', 'SONGWRITER5', 'LYRICIST5', 'SINGER5', '가사5의 내용입니다...'
);

INSERT INTO music (
    musicNo, albumNo, musicTitle, musicFile, musicStatus, songWriter, lyricist, singer, lyric
) VALUES (
    music_seq.nextval, 6, 'SONG 6', 'SONG6.mp3', '비공개', 'SONGWRITER6', 'LYRICIST6', 'SINGER6', '가사6의 내용입니다...'
);

INSERT INTO music (
    musicNo, albumNo, musicTitle, musicFile, musicStatus, songWriter, lyricist, singer, lyric
) VALUES (
    music_seq.nextval, 7, 'SONG 7', 'SONG7.mp3', '비공개', 'SONGWRITER7', 'LYRICIST7', 'SINGER7', '가사7의 내용입니다...'
);
commit;