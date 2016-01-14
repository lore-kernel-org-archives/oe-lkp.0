Content-Type: multipart/mixed; boundary="===============0199186888516556566=="
MIME-Version: 1.0
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: lkp@lists.01.org
Subject: Re: [string_helpers] 26cfdc920f: kmsg.test_string_helpers:string_get_size(size=#, blk_size=#, units=
Date: Thu, 14 Jan 2016 10:17:48 +0100
Message-ID: <87lh7s4j0j.fsf@vitty.brq.redhat.com>
In-Reply-To: <87d1t4x48h.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0199186888516556566==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <ying.huang@linux.intel.com> writes:

> FYI, we noticed the below changes on
>
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> commit 26cfdc920f1bb5766ff1493712a4f5a97ee5e484 ("string_helpers: fix pre=
cision loss for some inputs")
>
> [    1.775834] test_string_helpers: Running tests...
> [    1.775834] test_string_helpers: Running tests...
> [    1.776987] test_string_helpers: Test 'test_string_get_size_one' faile=
d!
> [    1.776987] test_string_helpers: Test 'test_string_get_size_one' faile=
d!
> [    1.778265] test_string_helpers: string_get_size(size =3D 8192, blk_si=
ze =3D 4096, units =3D 0
> [    1.778265] test_string_helpers: string_get_size(size =3D 8192, blk_si=
ze =3D 4096, units =3D 0
> [    1.779732] test_string_helpers: expected: '32.7 MB', got '33.6 MB'
> [    1.779732] test_string_helpers: expected: '32.7 MB', got '33.6 MB'

Yes, there was a patch updating tests in my series but apparently James's
solution got merged without it. I'll dig it out and send.

-- =

  Vitaly

--===============0199186888516556566==--

