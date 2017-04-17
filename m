Content-Type: multipart/mixed; boundary="===============7881554569447843316=="
MIME-Version: 1.0
From: Eric Biggers <ebiggers3@gmail.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [KEYS] bdf7c0f8bf: ltp.add_key02.fail
Date: Mon, 17 Apr 2017 10:29:55 -0700
Message-ID: <20170417172955.GA31469@gmail.com>
In-Reply-To: <20170417062641.GN31394@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============7881554569447843316==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 17, 2017 at 02:26:41PM +0800, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> commit: bdf7c0f8bf282ba44827ce3c7fd7936c8e90a18a ("KEYS: fix dereferencin=
g NULL payload with nonzero length")
> url: https://github.com/0day-ci/linux/commits/Eric-Biggers/KEYS-fix-deref=
erencing-NULL-payload-with-nonzero-length/20170403-102013
> base: https://git.kernel.org/cgit/linux/kernel/git/jmorris/linux-security=
.git next
> =

...
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> user  :notice: [   45.447047] <<<test_start>>>
> =

> user  :notice: [   45.447365] tag=3Dadd_key02 stime=3D1492169102
> =

> user  :notice: [   45.447567] cmdline=3D"add_key02"
> =

> user  :notice: [   45.447685] contacts=3D""
> =

> user  :notice: [   45.447826] analysis=3Dexit
> =

> user  :notice: [   45.448011] <<<test_output>>>
> =

> user  :notice: [   45.448568] tst_test.c:760: INFO: Timeout per run is 0h=
 05m 00s
> =

> user  :notice: [   45.449439] add_key02.c:65: FAIL: add_key() failed unex=
pectedly, expected EINVAL: EFAULT

In my opinion this is a valid behavior, and the test is just weird; it's pa=
ssing
in *both* an unaddressable payload and an invalid description, so it's not =
clear
which case it's meant to be testing.  (Generally, if a syscall will fail for
more than one reason, it's not guaranteed which error code you'll get.)

In any case, once we have a fix merged, it would be nice for there to be an=
 ltp
test added for the "NULL payload with nonzero length" case with one of the =
key
types that crashed the kernel.

Eric

--===============7881554569447843316==--

