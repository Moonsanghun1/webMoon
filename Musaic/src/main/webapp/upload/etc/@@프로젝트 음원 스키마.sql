-- ���̺�� �������� �����ϸ� ����
DROP TABLE music CASCADE CONSTRAINTS PURGE;
DROP SEQUENCE music_seq;

CREATE TABLE music (
musicNo NUMBER PRIMARY key,
albumNo NUMBER REFERENCES album(albumNo),
musicTitle VARCHAR2(30) not null,
musicFile VARCHAR2(200) not null,
musicStatus VARCHAR2(9)DEFAULT '����' CHECK (musicStatus IN ('����','�����'))not null,
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
    1,  -- musicNo (���ڷ� �Է�)
    'FOREVER',  -- musicTitle
    'BABYMONSTER_FOREVER.mp3',  -- musicFile
    'CHOICE37',  -- songWriter
    'BLVSH',  -- lyricist
    'BABYMONSTER',  -- singer
    'Alright ok ok ok ok
Alright ok
BABYMONSTER

I got no worries on my mind
�� ������ �ʾ�
So you can say goodbye

I��ll fulfill my fantasy
And you can watch and see
�ڼ��� �ĺ���

���μ�
They say she looking flawless
I know
Ÿ���� Like this

She��s unlike unlike anybody
�������� �� ���� ����
�����ٶ󸶹� �ΰ���
Gotta gotta go so c��est la vie

I��m dancing in the moonlight
Ooh ooh ooh ooh ooh ooh
Ooh ooh ooh ooh ay

Can��t stop this feeling tonight
What you waiting for

Baby it was all a dream
You thought I was yours
�ڴ�� ���������� ��

It��s bitter it��s sweet
�� �ϴ� ����
I��m spreading my wings
Like I��mma live

Forever
Like I��mma live forever
Forever
Like I��mma like I��mma

Forever
Like I��m gonna live
Like I��m gonna live forever

OK you know what it is

I��m that nice �� �� ���� �ʿ� �� ����
Pull up on me pay the price
Put a milli on a rock my type
Never seen it in your life

���� �׷��ϱ� �ٺ� �ƴ� ���� �� ���� �︮�� Bad girl
B (B) A (A) B (B) Y (Y) M (M) O (O) N
Get money

Bout it bout it �߳����� ����
���� Ÿ�� Ÿ�� ��� ¥��¥��
Everybody get down
Roll up on ��em with the motor running
I��mma give you something
Bet you put the money in the bag

I��m dancing in the moonlight
Ooh ooh ooh ooh ooh ooh
Ooh ooh ooh ooh ay

Can��t stop this feeling tonight
What you waiting for

Baby it was all a dream
You thought I was yours
�ڴ�� ���������� ��

It��s bitter it��s sweet
�� �ϴ� ����
I��m spreading my wings
Like I��mma live

Forever
Like I��mma live forever
Forever
Like I��mma like I��mma

Forever
Like I��m gonna live
Like I��m gonna live forever

I can see the bright horizon
�����̶� ���� �Ѿ
No nothing can stop me now

We forever forever
Forever ever ever

Ooh ooh
Baby it was all a dream
You thought I was yours
�ڴ�� ���������� ��

It��s bitter it��s sweet
�� �ϴ� ����
I��m spreading my wings
Like I��mma live

Forever (Forever ever ever)
Forever (We forever forever forever ever ever)
Forever

Like I��m gonna live
Like I��m gonna live forever'
);

-- music ���̺� ���� ������ ����
INSERT INTO music (
    musicNo, albumNo, musicTitle, musicFile, musicStatus, songWriter, lyricist, singer, lyric
) VALUES (
    music_seq.nextval, 1, 'FOREVER', 'BABYMONSTER_FOREVER.mp3', '����', 'CHOICE37', 'BLVSH', 'BABYMONSTER', 'Alright ok ok ok ok Alright ok BABYMONSTER...'
);

INSERT INTO music (
    musicNo, albumNo, musicTitle, musicFile, musicStatus, songWriter, lyricist, singer, lyric
) VALUES (
    music_seq.nextval, 2, 'SONG 2', 'SONG2.mp3', '����', 'SONGWRITER2', 'LYRICIST2', 'SINGER2', '����2�� �����Դϴ�...'
);

INSERT INTO music (
    musicNo, albumNo, musicTitle, musicFile, musicStatus, songWriter, lyricist, singer, lyric
) VALUES (
    music_seq.nextval, 3, 'SONG 3', 'SONG3.mp3', '����', 'SONGWRITER3', 'LYRICIST3', 'SINGER3', '����3�� �����Դϴ�...'
);

INSERT INTO music (
    musicNo, albumNo, musicTitle, musicFile, musicStatus, songWriter, lyricist, singer, lyric
) VALUES (
    music_seq.nextval, 4, 'SONG 4', 'SONG4.mp3', '����', 'SONGWRITER4', 'LYRICIST4', 'SINGER4', '����4�� �����Դϴ�...'
);

INSERT INTO music (
    musicNo, albumNo, musicTitle, musicFile, musicStatus, songWriter, lyricist, singer, lyric
) VALUES (
    music_seq.nextval, 5, 'SONG 5', 'SONG5.mp3', '����', 'SONGWRITER5', 'LYRICIST5', 'SINGER5', '����5�� �����Դϴ�...'
);

INSERT INTO music (
    musicNo, albumNo, musicTitle, musicFile, musicStatus, songWriter, lyricist, singer, lyric
) VALUES (
    music_seq.nextval, 6, 'SONG 6', 'SONG6.mp3', '�����', 'SONGWRITER6', 'LYRICIST6', 'SINGER6', '����6�� �����Դϴ�...'
);

INSERT INTO music (
    musicNo, albumNo, musicTitle, musicFile, musicStatus, songWriter, lyricist, singer, lyric
) VALUES (
    music_seq.nextval, 7, 'SONG 7', 'SONG7.mp3', '�����', 'SONGWRITER7', 'LYRICIST7', 'SINGER7', '����7�� �����Դϴ�...'
);
commit;