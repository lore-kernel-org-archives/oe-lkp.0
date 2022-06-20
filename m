Content-Type: multipart/mixed; boundary="===============7526703673334915709=="
MIME-Version: 1.0
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [locking/lockdep] 4051a81774: page_allocation_failure:order:#, mode:#(GFP_KERNEL), nodemask=(null)
Date: Mon, 20 Jun 2022 11:42:07 +0200
Message-ID: <YrBA7ysAif4I9nPv@linutronix.de>
In-Reply-To: <20220620020727.GA3669@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============7526703673334915709==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

+ rtrs, infiniband folks. =


On 2022-06-20 10:07:27 [+0800], kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-11):
> =

> commit: 4051a81774d6d8e28192742c26999d6f29bc0e68 ("locking/lockdep: Use s=
ched_clock() for random numbers")
> https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git locking/urgent
=E2=80=A6
> in testcase: boot
> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 16G
> =

=E2=80=A6
> [   17.451787][    T1] rtrs_server L2256: Loading module rtrs_server, pro=
to 2.0: (max_chunk_size: 131072 (pure IO 126976, headers 4096) , sess_queue=
_depth: 512, always_invalidate: 1)
> [   17.470894][    T1] swapper: page allocation failure: order:5, mode:0x=
cc0(GFP_KERNEL), nodemask=3D(null)

If I read this right, it allocates "512 * 10" chunks of order 5 / 128KiB
of memory (contiguous memory). And this appears to fail. =

This is either a lot of memory or something that shouldn't be used on
i386.

Either way, locking/urgent is innocent.

> [   17.470905][    T1] CPU: 0 PID: 1 Comm: swapper Not tainted 5.19.0-rc2=
-00001-g4051a81774d6 #1
=E2=80=A6
> [   17.471016][    T1] Node 0 active_anon:0kB inactive_anon:0kB active_fi=
le:0kB inactive_file:0kB unevictable:350872kB isolated(anon):0kB isolated(f=
ile):0kB mapped:0kB dirty:0kB writeback:0kB shmem:0kB writeback_tmp:0kB ker=
nel_stack:304kB pagetables:4kB all_unreclaimable? no
> [   17.471022][    T1] DMA free:2304kB boost:0kB min:80kB low:100kB high:=
120kB reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file=
:0kB inactive_file:0kB unevictable:0kB writepending:0kB present:15992kB man=
aged:15360kB mlocked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
> [   17.471029][    T1] lowmem_reserve[]: 0 544 2867 2867
> [   17.471034][    T1] Normal free:3040kB boost:0kB min:2940kB low:3672kB=
 high:4404kB reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB acti=
ve_file:0kB inactive_file:0kB unevictable:16348kB writepending:0kB present:=
749560kB managed:671404kB mlocked:0kB bounce:0kB free_pcp:900kB local_pcp:9=
00kB free_cma:0kB
> [   17.471041][    T1] lowmem_reserve[]: 0 0 18591 18591
> [   17.471045][    T1] HighMem free:2040716kB boost:0kB min:512kB low:365=
2kB high:6792kB reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB a=
ctive_file:0kB inactive_file:0kB unevictable:334524kB writepending:0kB pres=
ent:2379656kB managed:2379656kB mlocked:0kB bounce:0kB free_pcp:296kB local=
_pcp:296kB free_cma:0kB
> [   17.471052][    T1] lowmem_reserve[]: 0 0 0 0
> [   17.471056][    T1] DMA: 0*4kB 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 1*25=
6kB (U) 0*512kB 0*1024kB 1*2048kB (U) 0*4096kB =3D 2304kB
> [   17.471073][    T1] Normal: 4*4kB (UM) 2*8kB (UM) 2*16kB (U) 3*32kB (U=
M) 3*64kB (UM) 1*128kB (M) 2*256kB (M) 0*512kB 2*1024kB (M) 0*2048kB 0*4096=
kB =3D 3040kB
> [   17.471093][    T1] HighMem: 1*4kB (M) 1*8kB (U) 0*16kB 0*32kB 0*64kB =
1*128kB (M) 1*256kB (U) 1*512kB (M) 2*1024kB (UM) 1*2048kB (M) 497*4096kB (=
M) =3D 2040716kB
> [   17.471114][    T1] 87718 total pagecache pages
> [   17.471116][    T1] 786302 pages RAM
> [   17.471116][    T1] 594914 pages HighMem/MovableOnly
> [   17.471117][    T1] 19697 pages reserved
> [   17.471118][    T1] 0 pages hwpoisoned

Sebastian
--===============7526703673334915709==--

