Content-Type: multipart/mixed; boundary="===============6330438726583472768=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@suse.com>
To: lkp@lists.01.org
Subject: Re: [fs, elf] 4ed2863951: 32bit.hugetlb_minimal_copy=no_xb_linkhuge.killed_by_signal
Date: Fri, 24 Aug 2018 11:11:56 +0200
Message-ID: <20180824091156.GF29735@dhcp22.suse.cz>
In-Reply-To: <8a7abb76-591d-0606-9276-cc42836b9377@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6330438726583472768==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri 24-08-18 15:29:00, Rong Chen wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit 4ed28639519c7bad5f518e70b3284c6e0763e650 ("fs, elf: drop MAP_FIXED
> usage from elf_map")
> git://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git
> tags/next-20180412~2^2~67
> =

> in testcase: libhugetlbfs-test
> with following parameters:
> =

> =C2=A0=C2=A0=C2=A0 pagesize: 2MB
> =C2=A0=C2=A0=C2=A0 pagenum: 32
> =

> on test machine: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz with
> 64G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire
> log/backtrace):

So the log says
kern  :info  : [   61.148875] 3691 (xB.linkhuge): Uhuuh, elf segment at 000=
00000edee789a requested but the memory is mapped already
kern  :info  : [   61.184587] 3700 (xB.linkhuge): Uhuuh, elf segment at 000=
00000edee789a requested but the memory is mapped already
kern  :info  : [   61.216521] 3704 (xB.linkshare): Uhuuh, elf segment at 00=
0000006da4f715 requested but the memory is mapped already
kern  :info  : [   61.269555] 3725 (xB.linkshare): Uhuuh, elf segment at 00=
0000006da4f715 requested but the memory is mapped already

This means that the linker has tried to map over an already existing
mapping. This is usually bad. Why is it legitimate in this case? What
does xB.linkhuge resp. xB.linkshare try to do?
-- =

Michal Hocko
SUSE Labs

--===============6330438726583472768==--

