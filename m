Content-Type: multipart/mixed; boundary="===============1616836307930509108=="
MIME-Version: 1.0
From: Ammar Faizi <ammarfaizi2@gnuweeb.org>
To: lkp@lists.01.org
Subject: Re: [net] 5aa32dd9bd: INFO:task_blocked_for_more_than#seconds
Date: Wed, 04 May 2022 14:29:10 +0700
Message-ID: <64cbe8c1-a93f-1aad-2629-9feb6ee7a20e@gnuweeb.org>
In-Reply-To: <20220504060305.GF30775@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============1616836307930509108==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5/4/22 1:03 PM, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-11):
> =

> commit: 5aa32dd9bdb57e4a26143216df5e90f5e5c3dd2c ("net: add support for f=
ast socket release")
> https://github.com/ammarfaizi2/linux-block axboe/linux-block/sock-nolock.2
> =

> in testcase: ltp
> version: ltp-x86_64-14c1f76-1_20220430
> with following parameters:
> =

> 	test: cve
> 	ucode: 0x28
> =

> test-description: The LTP testsuite contains a collection of tools for te=
sting the Linux kernel and related features.
> test-url: http://linux-test-project.github.io/
> =

> =

> on test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4770 CPU @ 3.40=
GHz with 16G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):

Hello,

Thank you for the testing effort. But it's an abandoned branch, please stop
testing branch: axboe/linux-block/sock-nolock.2.

As Jens has said previously here:
https://lore.kernel.org/lkml/f8de18da-e6ae-e82c-c6eb-6f4de6ce8e98(a)kernel.=
dk

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
On Sat, 30 Apr 2022 at 08:58:21 -0600, Jens Axboe wrote:
> =

> Please just stop testing that branch, it's been abandoned.
> =

> -- =

> Jens Axboe
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

-- =

Ammar Faizi
--===============1616836307930509108==--

