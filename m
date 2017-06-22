Content-Type: multipart/mixed; boundary="===============2866658726957814424=="
MIME-Version: 1.0
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [libata] 818831c8b2: kmsg.ata#.#:failed_to_set_xfermode(err_mask=#)
Date: Thu, 22 Jun 2017 10:43:48 +1000
Message-ID: <20170622104348.169aa800@canb.auug.org.au>
In-Reply-To: <20170615025854.GB14017@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============2866658726957814424==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 15 Jun 2017 10:58:54 +0800 kernel test robot <xiaolong.ye@intel.c=
om> wrote:
>
> FYI, we noticed the following commit:
> =

> commit: 818831c8b22f75353f59a63a484e20736c0567c9 ("libata: implement SECU=
RITY PROTOCOL IN/OUT")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> in testcase: unixbench
> with following parameters:
> =

> 	runtime: 300s
> 	nr_task: 100%
> 	test: fsbuffer
> =

> test-description: UnixBench is the original BYTE UNIX benchmark suite aim=
s to test performance of Unix-like system.
> test-url: https://github.com/kdlucas/byte-unixbench
> =

> =

> on test machine: 8 threads Intel(R) Core(TM) i7 CPU 870 @ 2.93GHz with 4G=
 memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> [   16.104144] ata2.00: Security Log not supported
> [   16.104411] ata2.01: ATAPI: HL-DT-ST DVD+/-RW GH50N, B102, max UDMA/100
> [   16.104757] ata2.00: failed to set xfermode (err_mask=3D0x40)

Just wondering if this has been fixed.

-- =

Cheers,
Stephen Rothwell

--===============2866658726957814424==--

