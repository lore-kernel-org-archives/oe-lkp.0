Content-Type: multipart/mixed; boundary="===============8319092926662898188=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [mm] 122708b1b9: PANIC: early exception
Date: Wed, 17 Aug 2016 12:18:08 -0700
Message-ID: <20160817121808.bf31e27382554bf532368c38@linux-foundation.org>
In-Reply-To: <20160817161028.GE20762@e104818-lin.cambridge.arm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8319092926662898188==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 17 Aug 2016 17:10:28 +0100 Catalin Marinas <catalin.marinas@arm.c=
om> wrote:

> On Wed, Aug 17, 2016 at 11:51:41PM +0800, kernel test robot wrote:
> > FYI, we noticed the following commit:
> > =

> > https://github.com/0day-ci/linux Catalin-Marinas/mm-kmemleak-Avoid-usin=
g-__va-on-addresses-that-don-t-have-a-lowmem-mapping/20160816-232733
> > commit 122708b1b91eb3d253baf86a263ead0f1f5cac78 ("mm: kmemleak: Avoid u=
sing __va() on addresses that don't have a lowmem mapping")
> > =

> > in testcase: boot
> > =

> > on test machine: 1 threads qemu-system-i386 -enable-kvm with 320M memory
> > =

> > caused below changes:
> > =

> > +--------------------------------+------------+------------+
> > |                                | 304bec1b1d | 122708b1b9 |
> > +--------------------------------+------------+------------+
> > | boot_successes                 | 3          | 0          |
> > | boot_failures                  | 5          | 8          |
> > | invoked_oom-killer:gfp_mask=3D0x | 1          |            |
> > | Mem-Info                       | 1          |            |
> > | BUG:kernel_test_crashed        | 4          |            |
> > | PANIC:early_exception          | 0          | 8          |
> > | EIP_is_at__phys_addr           | 0          | 8          |
> > | BUG:kernel_hang_in_boot_stage  | 0          | 2          |
> > | BUG:kernel_boot_hang           | 0          | 6          |
> > +--------------------------------+------------+------------+
> =

> Please disregard this patch. I posted v2 here:
> =

> http://lkml.kernel.org/g/1471426130-21330-1-git-send-email-catalin.marina=
s(a)arm.com
> =

> (and I'm eager to see the kbuild/kernel test robot results ;))

I don't see how the v1->v2 changes could fix a panic?

--===============8319092926662898188==--

