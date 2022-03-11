Content-Type: multipart/mixed; boundary="===============1243673878502909944=="
MIME-Version: 1.0
From: Hugh Dickins <hughd@google.com>
To: lkp@lists.01.org
Subject: Re: [mm] aae2359b1a: BUG:Bad_rss-counter_state_mm:#type:MM_ANONPAGES_val
Date: Fri, 11 Mar 2022 01:44:54 -0800
Message-ID: <a98d4b1-da3f-c183-52a7-af72131ee5@google.com>
In-Reply-To: <20220311022718.GC18612@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============1243673878502909944==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 11 Mar 2022, kernel test robot wrote:
> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: aae2359b1a514180633c4a4e6666c91e44a928c8 ("mm: thp: don't have to=
 lock page anymore when splitting PMD")

Yes, known bad patch, replaced by good patch a day or two later.

> url: https://github.com/0day-ci/linux/commits/Qianggui-Song/arm64-dts-mes=
on-s4-add-gpio_intc-node/20220310-172923
> =

> in testcase: trinity
> version: trinity-static-i386-x86_64-f93256fb_2019-08-28
> with following parameters:
> =

> 	runtime: 300s
> 	group: group-01
> =

> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 16G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> [   20.947643][ T4079] mm/pgtable-generic.c:51: bad pmd e7d8e333(80000004=
33c000c5)
> [   20.949757][  T427] BUG: Bad rss-counter state mm:84638533 type:MM_ANO=
NPAGES val:512
> [   20.951030][  T427] BUG: non-zero pgtables_bytes on freeing mm: 4096
> [   20.960329][ T4080] mm/pgtable-generic.c:51: bad pmd 6dc594d8(80000004=
33c000c5)
> [   20.961775][  T427] BUG: Bad rss-counter state mm:bf324b3f type:MM_ANO=
NPAGES val:512
> [   20.963109][  T427] BUG: non-zero pgtables_bytes on freeing mm: 4096
> [   20.974600][ T4081] mm/pgtable-generic.c:51: bad pmd d1c9ec63(80000004=
33c000c5)
> [   20.977758][  T427] BUG: Bad rss-counter state mm:e038d31c type:MM_ANO=
NPAGES val:512
> [   20.978918][  T427] BUG: non-zero pgtables_bytes on freeing mm: 4096
> [   20.982960][ T4082] mm/pgtable-generic.c:51: bad pmd 8d2043e0(80000004=
33c000c5)
> [   20.994138][ T4083] BUG: Bad rss-counter state mm:890a50d8 type:MM_ANO=
NPAGES val:512
> [   20.995441][ T4083] BUG: non-zero pgtables_bytes on freeing mm: 4096
> [   20.997140][ T4083] mm/pgtable-generic.c:51: bad pmd 78b279e7(80000004=
33c000c5)
> [   21.088268][ T3649] BUG: Bad rss-counter state mm:10e6eb4f type:MM_ANO=
NPAGES val:512
> [   21.089552][ T3649] BUG: non-zero pgtables_bytes on freeing mm: 4096
--===============1243673878502909944==--

