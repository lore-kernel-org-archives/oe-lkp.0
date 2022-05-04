Content-Type: multipart/mixed; boundary="===============0688344895707295022=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [net] 5aa32dd9bd: INFO:task_blocked_for_more_than#seconds
Date: Wed, 04 May 2022 17:07:00 +0800
Message-ID: <20220504090700.GG30775@xsang-OptiPlex-9020>
In-Reply-To: <64cbe8c1-a93f-1aad-2629-9feb6ee7a20e@gnuweeb.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============0688344895707295022==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hi Ammar,

On Wed, May 04, 2022 at 02:29:10PM +0700, Ammar Faizi wrote:
> On 5/4/22 1:03 PM, kernel test robot wrote:
> > =

> > =

> > Greeting,
> > =

> > FYI, we noticed the following commit (built with gcc-11):
> > =

> > commit: 5aa32dd9bdb57e4a26143216df5e90f5e5c3dd2c ("net: add support for=
 fast socket release")
> > https://github.com/ammarfaizi2/linux-block axboe/linux-block/sock-noloc=
k.2
> > =

> > in testcase: ltp
> > version: ltp-x86_64-14c1f76-1_20220430
> > with following parameters:
> > =

> > 	test: cve
> > 	ucode: 0x28
> > =

> > test-description: The LTP testsuite contains a collection of tools for =
testing the Linux kernel and related features.
> > test-url: http://linux-test-project.github.io/
> > =

> > =

> > on test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4770 CPU @ 3.=
40GHz with 16G memory
> > =

> > caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
> =

> Hello,
> =

> Thank you for the testing effort. But it's an abandoned branch, please st=
op
> testing branch: axboe/linux-block/sock-nolock.2.
> =

> As Jens has said previously here:
> https://lore.kernel.org/lkml/f8de18da-e6ae-e82c-c6eb-6f4de6ce8e98(a)kerne=
l.dk


sorry for this, will ignore this branch.


> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> On Sat, 30 Apr 2022 at 08:58:21 -0600, Jens Axboe wrote:
> > =

> > Please just stop testing that branch, it's been abandoned.
> > =

> > -- =

> > Jens Axboe
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =

> -- =

> Ammar Faizi
--===============0688344895707295022==--

