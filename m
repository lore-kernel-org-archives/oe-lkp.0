Content-Type: multipart/mixed; boundary="===============5578349552269903363=="
MIME-Version: 1.0
From: Cyril Hrubis <chrubis@suse.cz>
To: lkp@lists.01.org
Subject: Re: [LTP] [lkp-robot] [KEYS] bdf7c0f8bf: ltp.add_key02.fail
Date: Thu, 20 Apr 2017 14:57:50 +0200
Message-ID: <20170420125750.GD10246@rei.lan>
In-Reply-To: <20170417172955.GA31469@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5578349552269903363==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi!
> > commit: bdf7c0f8bf282ba44827ce3c7fd7936c8e90a18a ("KEYS: fix dereferenc=
ing NULL payload with nonzero length")
> > url: https://github.com/0day-ci/linux/commits/Eric-Biggers/KEYS-fix-der=
eferencing-NULL-payload-with-nonzero-length/20170403-102013
> > base: https://git.kernel.org/cgit/linux/kernel/git/jmorris/linux-securi=
ty.git next
> > =

> ...
> > caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
> > =

> > =

> > user  :notice: [   45.447047] <<<test_start>>>
> > =

> > user  :notice: [   45.447365] tag=3Dadd_key02 stime=3D1492169102
> > =

> > user  :notice: [   45.447567] cmdline=3D"add_key02"
> > =

> > user  :notice: [   45.447685] contacts=3D""
> > =

> > user  :notice: [   45.447826] analysis=3Dexit
> > =

> > user  :notice: [   45.448011] <<<test_output>>>
> > =

> > user  :notice: [   45.448568] tst_test.c:760: INFO: Timeout per run is =
0h 05m 00s
> > =

> > user  :notice: [   45.449439] add_key02.c:65: FAIL: add_key() failed un=
expectedly, expected EINVAL: EFAULT
> =

> In my opinion this is a valid behavior, and the test is just weird; it's =
passing
> in *both* an unaddressable payload and an invalid description, so it's no=
t clear
> which case it's meant to be testing.  (Generally, if a syscall will fail =
for
> more than one reason, it's not guaranteed which error code you'll get.)

That is quite common problem with LTP testcases. Do you care to send a
patch or should I fix that?

> In any case, once we have a fix merged, it would be nice for there to be =
an ltp
> test added for the "NULL payload with nonzero length" case with one of th=
e key
> types that crashed the kernel.

Here as well, feel free to send a patch or at least point us to a
reproducer that could be turned into a testcase.

-- =

Cyril Hrubis
chrubis(a)suse.cz

--===============5578349552269903363==--

