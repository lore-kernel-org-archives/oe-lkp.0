Content-Type: multipart/mixed; boundary="===============5363971654988514633=="
MIME-Version: 1.0
From: Cyril Hrubis <chrubis@suse.cz>
To: lkp@lists.01.org
Subject: Re: [LTP] [lkp-robot] [fs] b220238d4b: INFO:ltp-pan_reported_some_tests_FAIL
Date: Thu, 01 Jun 2017 12:48:10 +0200
Message-ID: <20170601104809.GA10526@rei.suse.de>
In-Reply-To: <20170601082938.GB4765@rei.lan>
List-Id: <oe-lkp.lists.linux.dev>

--===============5363971654988514633==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi!
> > <<<test_output>>>
> > io_submit01    1  TPASS  :  expected failure - returned value =3D -22 :=
 Invalid argument
> > io_submit01    2  TPASS  :  expected failure - returned value =3D -22 :=
 Invalid argument
> > io_submit01    3  TFAIL  :  io_submit01.c:138: unexpected failure - ret=
urned value =3D -95 : Operation not supported, expected one of -EINVAL, -EB=
ADF, -EFAULT
> > io_submit01    4  TPASS  :  expected failure - returned value =3D -14 :=
 Bad address
> > io_submit01    5  TPASS  :  expected failure - returned value =3D -22 :=
 Invalid argument
> > io_submit01    6  TPASS  :  expected failure - returned value =3D -9 : =
Bad file descriptor
> > io_submit01    7  TPASS  :  expected success - returned value =3D 0
> > io_submit01    8  TPASS  :  expected success - returned value =3D 1
> > <<<execution_status>>>
> > initiation_status=3D"ok"
> > duration=3D0 termination_type=3Dexited termination_id=3D1 corefile=3Dno
> > cutime=3D0 cstime=3D0
> > <<<test_end>>>
> =

> =

> Looks like an invalid testcase to me, feel free to ignored it.
> =

> What the test does is to try with uninitialized "radnom" iocb to
> io_submit() and expects certain subset of errors to be returned.

FYI: Should be fixed in:

https://github.com/linux-test-project/ltp/commit/89d1e69d5953eac71b121b8ec5=
ee31d769e17ee2

-- =

Cyril Hrubis
chrubis(a)suse.cz

--===============5363971654988514633==--

