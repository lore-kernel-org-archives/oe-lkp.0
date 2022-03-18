Content-Type: multipart/mixed; boundary="===============6756443123469179681=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/mm/tlb] 6035152d8e: will-it-scale.per_thread_ops -13.2% regression
Date: Fri, 18 Mar 2022 10:56:31 +0800
Message-ID: <20220318025631.GA12658@xsang-OptiPlex-9020>
In-Reply-To: <285cf565-ebf7-8cf5-4e57-2245608e79fb@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6756443123469179681==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Dave, Hi Nadav,

On Thu, Mar 17, 2022 at 01:49:48PM -0700, Dave Hansen wrote:
> On 3/17/22 13:32, Nadav Amit wrote:
> > Can you please clarify how the bot works - did it notice a performance
> > regression and then started bisecting, or did it just check one patch
> > at a time?
> =

> Oliver can tell us for sure, but it usually finds things by bisecting.
> It will pick an upstream commit and compare it to the latest baseline.
> If it sees a delta it starts bisecting for the triggering commit.
> =

> It isn't a literal 'git bisect', but it's logically similar.

yes, this is exactly how 0-day bot works.

regarding below from Nadav,
> > I ask because I got a different report from the report that a
> > subsequent patch ("x86/mm/tlb: Privatize cpu_tlbstate=E2=80=9D) made a
> > 23.3% improvement [1] for a very similar (yet different) test.

yes, we also noticed this:
* 2f4305b19fe6a x86/mm/tlb: Privatize cpu_tlbstate
* 4ce94eabac16b x86/mm/tlb: Flush remote and local TLBs concurrently
* 6035152d8eebe x86/mm/tlb: Open-code on_each_cpu_cond_mask() for tlb_is_no=
t_lazy()
* 4c1ba3923e6c8 x86/mm/tlb: Unify flush_tlb_func_local() and flush_tlb_func=
_remote()
* a32a4d8a815c4 smp: Run functions concurrently in smp_call_function_many_c=
ond()
* a38fd87484648 (tag: v5.12-rc2,

but we confirmed there is no obvious performance change on this test upon
2f4305b19fe6a ("x86/mm/tlb: Privatize cpu_tlbstate")

below are what we tested along mainline recently, from latest to old for th=
is
test:

7e57714cd0ad2 Linux 5.17-rc6                                               =
                                              5533 5551 5572 5536 5544 5523
9137eda53752e Merge tag 'configfs-5.17-2022-02-25' of git://git.infradead.o=
rg/users/hch/configfs                         5591
53ab78cd6d5ab Merge tag 'clk-fixes-for-linus' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/clk/linux                 5571 5569 5525 5542
d8152cfe2f21d Merge tag 'pci-v5.17-fixes-5' of git://git.kernel.org/pub/scm=
/linux/kernel/git/helgaas/pci                 5569 5541
23d04328444a8 Merge tag 'for-5.17/parisc-4' of git://git.kernel.org/pub/scm=
/linux/kernel/git/deller/parisc-linux         5535 5565 5526
5c1ee569660d4 Merge branch 'for-5.17-fixes' of git://git.kernel.org/pub/scm=
/linux/kernel/git/tj/cgroup                   5480 5527 5486
038101e6b2cd5 Merge tag 'platform-drivers-x86-v5.17-3' of git://git.kernel.=
org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86 5508
cfb92440ee71a Linux 5.17-rc5                                               =
                                              5506
754e0b0e35608 Linux 5.17-rc4                                               =
                                              5498
e783362eb54cd Linux 5.17-rc1                                               =
                                              5557
df0cc57e057f1 Linux 5.16                                                   =
                                              5571
2f4305b19fe6a x86/mm/tlb: Privatize cpu_tlbstate                           =
                                              5601 5642 5674 5634 5678 5702
6035152d8eebe x86/mm/tlb: Open-code on_each_cpu_cond_mask() for tlb_is_not_=
lazy()                                        5598 5571 5571 5639 5579 5587=
 5571 5582
4c1ba3923e6c8 x86/mm/tlb: Unify flush_tlb_func_local() and flush_tlb_func_r=
emote()                                       6292 6508 6478 6505 6411 6475=
 6269 6494 6474

as above show, the performance drop caused by 6035152d8eebe seems not recov=
er
on 2f4305b19fe6a and following.


as a contrast, for the report
"[x86/mm/tlb] 2f4305b19f: will-it-scale.per_thread_ops 23.3% improvement"
which is a different subtest under will-it-scale, also on another platform:
(we have much more history tests on it before we upgrade the ucode for
this platform, so I only show partial of them):

df0cc57e057f1 Linux 5.16                                                   =
                                              3247
fc74e0a40e4f9 Linux 5.16-rc7                                               =
                                              3242
8bb7eca972ad5 Linux 5.15                                                   =
                                              2856 2879 2900 2871 2890
519d81956ee27 Linux 5.15-rc6                                               =
                                              2822
64570fbc14f8d Linux 5.15-rc5                                               =
                                              2820 2839 2852 2833
62fb9874f5da5 Linux 5.13                                                   =
                                              3311 3299 3288
13311e74253fe Linux 5.13-rc7                                               =
                                              3302 3316 3303
9f4ad9e425a1d Linux 5.12                                                   =
                                              2765 2774 2779 2784 2768
1608e4cf31b88 x86/mm/tlb: Remove unnecessary uses of the inline keyword    =
                                              3448 3447 3483 3506 3494
291c4011dd7ac cpumask: Mark functions as pure                              =
                                              3469 3520 3419 3437 3418 3499
09c5272e48614 x86/mm/tlb: Do not make is_lazy dirty for no reason          =
                                              3421 3473 3392 3463 3474 3434
2f4305b19fe6a x86/mm/tlb: Privatize cpu_tlbstate                           =
                                              3509 3475 3368 3450 3445 3442
4ce94eabac16b x86/mm/tlb: Flush remote and local TLBs concurrently         =
                                              2796 2792 2796 2812 2784 2796=
 2779
6035152d8eebe x86/mm/tlb: Open-code on_each_cpu_cond_mask() for tlb_is_not_=
lazy()                                        2755 2797 2792
4c1ba3923e6c8 x86/mm/tlb: Unify flush_tlb_func_local() and flush_tlb_func_r=
emote()                                       2836 2827 2825
a38fd87484648 Linux 5.12-rc2                                               =
                                              2997 2981 3003

as above, there is a performance improvement on 2f4305b19fe6a.
but the data from this subtest seems more fluctuated along mainline.

> =

> I did ask the 0day folks privately if they had any more performance data
> on that commit: good, bad or neutral.

we don't have other performance data on this commit so far.
but this may mean there is no other bisection bisected to this commit.

> =

> That commit didn't actually look to me like it was fundamental to
> anything built after it.  It might not revert cleanly, but it doesn't
> look like it would be hard to logically remove.  What other side-effects
> are you worried about?
> =

> BTW, there's also a dirt simple hack to do the on_each_cpu_cond_mask()
> without a retpoline:
> =

> 	if ((cond_func =3D=3D tlb_is_not_lazy) &&
>             !tlb_is_not_lazy(...))
> 		continue;
> =

> You can't do that literally in arch-independent code, but you get the poi=
nt.
> =

> I know folks have discussed ways of doing this kind of stuff for other
> high-value indirect calls.  I need to see if there's anything around
> that we could use.
--===============6756443123469179681==--

