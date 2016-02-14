Content-Type: multipart/mixed; boundary="===============8630717048507844415=="
MIME-Version: 1.0
From: Jiri Kosina <jkosina@suse.cz>
To: lkp@lists.01.org
Subject: Re: [floppy] 09954bad44: kmsg.blk_update_request:I/O_error, dev_fd#, sector
Date: Mon, 15 Feb 2016 00:01:56 +0100
Message-ID: <alpine.LNX.2.00.1602150001150.22727@cbobk.fhfr.pm>
In-Reply-To: <87k2m86lix.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8630717048507844415==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, 14 Feb 2016, kernel test robot wrote:

> FYI, we noticed the below changes on
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/jikos/linux-block.git for=
-4.5/for-jens
> commit 09954bad448791ef01202351d437abdd9497a804 ("floppy: refactor open()=
 flags handling")
> =

> =

> [    6.750917] blk_update_request: I/O error, dev fd0, sector 0
> [    6.751922] floppy: error -5 while reading block 0
> =

> =

> To reproduce:
> =

>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-t=
ests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml

Seem like I am probably rather bad reading the job.yaml syntax. Do you =

happen to have C source that reproduces this? It's very likely that it's =

actually an intended change in bahavior.

Thanks,

-- =

Jiri Kosina
SUSE Labs

--===============8630717048507844415==--

