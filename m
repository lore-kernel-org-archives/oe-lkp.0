Content-Type: multipart/mixed; boundary="===============4174315105084286988=="
MIME-Version: 1.0
From: Ming Lin <mlin@kernel.org>
To: lkp@lists.01.org
Subject: Re: [block] 86ecb9456ac:
Date: Tue, 14 Jul 2015 10:31:20 -0700
Message-ID: <CAF1ivSaRQcKvg+ogu+TfV-tw_zZ4pG1JtPkbgrCcJf2R58UY5Q@mail.gmail.com>
In-Reply-To: <1436880417.1264.16.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4174315105084286988==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2015 at 6:26 AM, Huang Ying <ying.huang@intel.com> wrote:
> FYI, we noticed the below changes on
>
> git://git.kernel.org/pub/scm/linux/kernel/git/mlin/linux.git block-generi=
c-req
> commit 86ecb9456ac74ba3996d05ca1b09a7756a31bfd7 ("block: make generic_mak=
e_request handle arbitrarily sized bios")
>
> We found the following new message in kernel log, do you increase vmalloc=
 usage in your patch?
>
> [    6.939422] vmap allocation for size 16384 failed: use vmalloc=3D<size=
> to increase size.

[    6.939422] vmap allocation for size 16384 failed: use
vmalloc=3D<size> to increase size.
[    6.955278] lguest: could not map switcher pages high

This actually comes from lguest.

Several weeks ago I tried lguest on qemu-kvm-i386 and saw similar problem.
I didn't debug it further, but it's OK if disable CONFIG_SMP.

I just double-checked it with v4.2-rc1(without this patchset)
CONFIG_SMP: see the vmalloc error
!CONFIG_SMP: no problem

Could you confirm?

BTW, it seams "qemu-kvm-i386 guest" as "lguest host" doesn't work.
Need to run lguest on bare metal.

Thanks.

>
>
> Thanks,
> Ying Huang

--===============4174315105084286988==--

