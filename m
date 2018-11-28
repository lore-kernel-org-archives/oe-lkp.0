Content-Type: multipart/mixed; boundary="===============8589733004048415787=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Wed, 28 Nov 2018 11:20:06 +0800
Message-ID: <87tvk1yjkp.fsf@yhuang-dev.intel.com>
In-Reply-To: <20181127205737.GI16136@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8589733004048415787==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Andrea Arcangeli <aarcange@redhat.com> writes:

> Hi Linus,
>
> On Tue, Nov 27, 2018 at 09:08:50AM -0800, Linus Torvalds wrote:
>> On Mon, Nov 26, 2018 at 10:24 PM kernel test robot
>> <rong.a.chen@intel.com> wrote:
>> >
>> > FYI, we noticed a -61.3% regression of vm-scalability.throughput due
>> > to commit ac5b2c18911f ("mm: thp: relax __GFP_THISNODE for
>> > MADV_HUGEPAGE mappings")
>> =

>> Well, that's certainly noticeable and not good.
>
> Noticed this email too.
>
> This difference can only happen with defrag=3Dalways, and that's not the
> current upstream default.
>
>         thp_enabled: always
>         thp_defrag: always
>         ^^^^^^^^^^^^^^^^^^ emulates MADV_HUGEPAGE always set
>
>> Andrea, I suspect it might be causing fights with auto numa migration..
>
> That MADV_HUGEPAGE causes flights with NUMA balancing is not great
> indeed, qemu needs NUMA locality too, but then the badness caused by
> __GFP_THISNODE was a larger regression in the worst case for qemu.
>
> When the kernel wants to allocate a THP from node A, if there are no
> THP generated on node A but there are in node B, they'll be picked from
> node B now.
>
> __GFP_THISNODE previously prevented any THP to be allocated from any
> node except A. This introduces a higher chance of initial misplacement
> which NUMA balancing will correct over time, but it should only apply
> to long lived allocations under MADV_HUGEPAGE. Perhaps the workload
> here uses short lived allocations and sets defrag=3Dalways which is not
> optimal to begin with?
>
> The motivation of the fix, is that the previous code invoked reclaim
> with __GFP_THISNODE set. That looked insecure and such behavior should
> only have been possible under a mlock/mempolicy
> capability. __GFP_THISNODE is like a transient but still privileged
> mbind for reclaim.
>
> Before the fix, __GFP_THISNODE would end up swapping out everything
> from node A to free 4k pages from node A, despite perhaps there were
> gigabytes of memory free in node B. That caused severe regression to
> threaded workloads whose memory spanned more than one NUMA node. So
> again going back doesn't sounds great for NUMA in general.
>
> The vmscalability test is most certainly not including any
> multithreaded process whose memory doesn't fit in a single NUMA node
> or we'd see also the other side of the tradeoff. It'd be nice to add
> such a test to be sure that the old __GFP_THISNODE behavior won't
> happen again for apps that don't fit in a single node.

The test case is to test swap subsystem.  Where tens (32 in test job)
processes are run to eat memory to trigger to swap to NVMe disk.  The
memory size to eat is almost same in this commit and its parent.  But I
found the swap triggered is much more for this commit.

  70934968 =C2=B1 10%     +51.7%  1.076e+08 =C2=B1  3%  proc-vmstat.pswpout

One possibility is that for parent commit, some processes exit much
earlier than other processes, so the total memory requirement of the
whole system is much lower.  So I dig more on test log and found,


For the parent commit,

$ grep 'usecs =3D' vm-scalability
24573771360 bytes / 13189705 usecs =3D 1819435 KB/s
24573771360 bytes / 13853913 usecs =3D 1732205 KB/s
24573771360 bytes / 42953388 usecs =3D 558694 KB/s
24573771360 bytes / 52782761 usecs =3D 454652 KB/s
24573771360 bytes / 84026989 usecs =3D 285596 KB/s
24573771360 bytes / 111677310 usecs =3D 214885 KB/s
24573771360 bytes / 146084698 usecs =3D 164273 KB/s
24573771360 bytes / 146978329 usecs =3D 163274 KB/s
24573771360 bytes / 149371224 usecs =3D 160658 KB/s
24573771360 bytes / 162892070 usecs =3D 147323 KB/s
24573771360 bytes / 177949001 usecs =3D 134857 KB/s
24573771360 bytes / 181729992 usecs =3D 132052 KB/s
24573771360 bytes / 189812698 usecs =3D 126428 KB/s
24573771360 bytes / 190992698 usecs =3D 125647 KB/s
24573771360 bytes / 200039238 usecs =3D 119965 KB/s
24573771360 bytes / 201254461 usecs =3D 119241 KB/s
24573771360 bytes / 202825077 usecs =3D 118317 KB/s
24573771360 bytes / 203441285 usecs =3D 117959 KB/s
24573771360 bytes / 205378150 usecs =3D 116847 KB/s
24573771360 bytes / 204840555 usecs =3D 117153 KB/s
24573771360 bytes / 206235458 usecs =3D 116361 KB/s
24573771360 bytes / 206419877 usecs =3D 116257 KB/s
24573771360 bytes / 206619347 usecs =3D 116145 KB/s
24573771360 bytes / 206942267 usecs =3D 115963 KB/s
24573771360 bytes / 210289229 usecs =3D 114118 KB/s
24573771360 bytes / 210504531 usecs =3D 114001 KB/s
24573771360 bytes / 210521351 usecs =3D 113992 KB/s
24573771360 bytes / 211012852 usecs =3D 113726 KB/s
24573771360 bytes / 211547509 usecs =3D 113439 KB/s
24573771360 bytes / 212179521 usecs =3D 113101 KB/s
24573771360 bytes / 212907825 usecs =3D 112714 KB/s
24573771360 bytes / 215558786 usecs =3D 111328 KB/s

For this commit,

$ grep 'usecs =3D' vm-scalability
24573681072 bytes / 203705073 usecs =3D 117806 KB/s
24573681072 bytes / 216146130 usecs =3D 111025 KB/s
24573681072 bytes / 257234408 usecs =3D 93291 KB/s
24573681072 bytes / 259530715 usecs =3D 92465 KB/s
24573681072 bytes / 261335046 usecs =3D 91827 KB/s
24573681072 bytes / 260134706 usecs =3D 92251 KB/s
24573681072 bytes / 258848653 usecs =3D 92709 KB/s
24573681072 bytes / 259889050 usecs =3D 92338 KB/s
24573681072 bytes / 265457907 usecs =3D 90401 KB/s
24573681072 bytes / 261698183 usecs =3D 91700 KB/s
24573681072 bytes / 266806783 usecs =3D 89944 KB/s
24573681072 bytes / 273096611 usecs =3D 87872 KB/s
24573681072 bytes / 273601276 usecs =3D 87710 KB/s
24573681072 bytes / 276132454 usecs =3D 86906 KB/s
24573681072 bytes / 274162852 usecs =3D 87530 KB/s
24573681072 bytes / 277901662 usecs =3D 86353 KB/s
24573681072 bytes / 282373557 usecs =3D 84985 KB/s
24573681072 bytes / 278202538 usecs =3D 86259 KB/s
24573681072 bytes / 283311157 usecs =3D 84704 KB/s
24573681072 bytes / 284181483 usecs =3D 84445 KB/s
24573681072 bytes / 283331985 usecs =3D 84698 KB/s
24573681072 bytes / 284573067 usecs =3D 84328 KB/s
24573681072 bytes / 277832459 usecs =3D 86374 KB/s
24573681072 bytes / 284753391 usecs =3D 84275 KB/s
24573681072 bytes / 287701035 usecs =3D 83412 KB/s
24573681072 bytes / 287816910 usecs =3D 83378 KB/s
24573681072 bytes / 287871244 usecs =3D 83362 KB/s
24573681072 bytes / 288322443 usecs =3D 83232 KB/s
24573681072 bytes / 288750156 usecs =3D 83108 KB/s
24573681072 bytes / 289595079 usecs =3D 82866 KB/s
24573681072 bytes / 289741926 usecs =3D 82824 KB/s
24573681072 bytes / 290746427 usecs =3D 82538 KB/s


>From the above data, for the parent commit 3 processes exited within
14s, another 3 exited within 100s.  For this commit, the first process
exited at 203s.  That is, this commit makes memory allocation more fair
among processes, so that processes proceeded at more similar speed.  But
this raises system memory footprint too, so triggered much more swap,
thus lower benchmark score.

In general, memory allocation fairness among processes should be a good
thing.  So I think the report should have been a "performance
improvement" instead of "performance regression".

Best Regards,
Huang, Ying

--===============8589733004048415787==--

