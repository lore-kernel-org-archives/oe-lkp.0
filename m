Content-Type: multipart/mixed; boundary="===============8155308195039052197=="
MIME-Version: 1.0
From: Cyril Hrubis <chrubis@suse.cz>
To: lkp@lists.01.org
Subject: Re: [LTP] [lkp-robot] [fs] b220238d4b: INFO:ltp-pan_reported_some_tests_FAIL
Date: Thu, 01 Jun 2017 10:29:39 +0200
Message-ID: <20170601082938.GB4765@rei.lan>
In-Reply-To: <20170601015815.GB16905@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============8155308195039052197==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi!
> <<<test_output>>>
> io_submit01    1  TPASS  :  expected failure - returned value =3D -22 : I=
nvalid argument
> io_submit01    2  TPASS  :  expected failure - returned value =3D -22 : I=
nvalid argument
> io_submit01    3  TFAIL  :  io_submit01.c:138: unexpected failure - retur=
ned value =3D -95 : Operation not supported, expected one of -EINVAL, -EBAD=
F, -EFAULT
> io_submit01    4  TPASS  :  expected failure - returned value =3D -14 : B=
ad address
> io_submit01    5  TPASS  :  expected failure - returned value =3D -22 : I=
nvalid argument
> io_submit01    6  TPASS  :  expected failure - returned value =3D -9 : Ba=
d file descriptor
> io_submit01    7  TPASS  :  expected success - returned value =3D 0
> io_submit01    8  TPASS  :  expected success - returned value =3D 1
> <<<execution_status>>>
> initiation_status=3D"ok"
> duration=3D0 termination_type=3Dexited termination_id=3D1 corefile=3Dno
> cutime=3D0 cstime=3D0
> <<<test_end>>>


Looks like an invalid testcase to me, feel free to ignored it.

What the test does is to try with uninitialized "radnom" iocb to
io_submit() and expects certain subset of errors to be returned.

-- =

Cyril Hrubis
chrubis(a)suse.cz

--===============8155308195039052197==--

