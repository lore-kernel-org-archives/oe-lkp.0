Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB61D1ED22
	for <oe-lkp@lists.linux.dev>; Fri, 21 Jul 2023 15:40:12 +0000 (UTC)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-4813422f311so871258e0c.2
        for <oe-lkp@lists.linux.dev>; Fri, 21 Jul 2023 08:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689954011; x=1690558811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=evK5HJGL5ye7tl1WXN57VN9jCRI5g3+DS9iwhFI+Agc=;
        b=AulURjwYSqQhxEezRu6dx9SiQY76giXfT2ze64rEI5lLM9b+eIBLgAXhwCsM/3MXJE
         YjjT5Avj/uyDPGnNCwVmRecLqr0EAn8x8xX6CHh2oegoCsknEe4jo6GLrGJSmT+m43Hc
         jakzyTBJUj46tj+t6zEYySKkrsw0a5nVQrHtkUVDwZeAjk00H7APZ/RYLxRFMLO56uxP
         l7E1ZI6DRzZNcNw8NNxzz6p0+QloyTpVUlTbZzmut2P8W6fbiy4a5II6o0j7rriB0WK1
         ZdEjGbBmQf9xCvbRdjtRB/HxZUQKAzJR4brYdc5tOoNZhvYjZolTgB0bFbImIiLFwBXF
         3T+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689954011; x=1690558811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=evK5HJGL5ye7tl1WXN57VN9jCRI5g3+DS9iwhFI+Agc=;
        b=d2uwcidEDFeOiMppyqnHCCpKSI0uJD7h3aWTAX/fiGcsH3rB2qrA3v7B/rQCnTum19
         uSShaX9/Q68KJmsOIpOzOx9hEvxC2QVEC8ajoeoekruALudiK2PHuFwGfXHT1n3IdObX
         bsp8dg3rHSxyoefbeq+FuYEZo62h+/Vkw/LtnjVBm7CnlULlAqZ+Mo824Lc1lb1UQhTe
         0+53ZTo9tHXbpHkrR7ZEewL7DGEFO+BUNcsB7fdFE0/lHUE2pBXfojwzyh3Sfo1dDd1b
         mMKOOFrMFu4+s+gde2bL73KTkcViqylXLRz3rxT5ZcclsTVsm3SnAVvpTfQulJAOfp/G
         YxPg==
X-Gm-Message-State: ABy/qLbNN7N/PpTKZNDc7RAh0i4ozU28oznkI32Mth7LgquojdREzpwU
	SMVNi5a8m8zALlSvuXRgbTsNkW9Fgm0qtqCebMg=
X-Google-Smtp-Source: APBJJlGsSPtVHBGlHRoGitshCh6/hsQGXPSSlGShzQYPm9/kczHhLpd7snDwj/KHgMtgJ1jAEs6LgQ9ETxEMhJt9kWk=
X-Received: by 2002:a1f:3d10:0:b0:47e:77f6:3a0f with SMTP id
 k16-20020a1f3d10000000b0047e77f63a0fmr1503581vka.13.1689954009730; Fri, 21
 Jul 2023 08:40:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230628095740.589893-1-jaypatel@linux.ibm.com>
 <202307172140.3b34825a-oliver.sang@intel.com> <CAB=+i9QY99=NzQugoMCdbEwkCKJObxx4DwWXwNjMqyMRYrgOHA@mail.gmail.com>
 <ZLijZ8QRc0FRgJIF@xsang-OptiPlex-9020> <CAB=+i9QmF2C7QsZBEW0HMT-PGcEf3MeCukVaq0_O1HkGy7n93w@mail.gmail.com>
 <ZLk7UpWWLf5agKDW@feng-clx> <CAB=+i9S6Ykp90+4N1kCE=hiTJTE4wzJDi8k5pBjjO_3sf0aeqg@mail.gmail.com>
 <CAANmLtyj0=mkHD8xPEv6ERv48kg+LpJuEkOPofEMvuTa0NRjXg@mail.gmail.com>
In-Reply-To: <CAANmLtyj0=mkHD8xPEv6ERv48kg+LpJuEkOPofEMvuTa0NRjXg@mail.gmail.com>
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
Date: Sat, 22 Jul 2023 00:39:58 +0900
Message-ID: <CAB=+i9RhdfVeeEROizQt17DW_q2SRo+gZg3ZV_t5OaNpoSB8oA@mail.gmail.com>
Subject: Re: [PATCH] [RFC PATCH v2]mm/slub: Optimize slub memory usage
To: Binder Makin <merimus@google.com>
Cc: Feng Tang <feng.tang@intel.com>, "Sang, Oliver" <oliver.sang@intel.com>, 
	Jay Patel <jaypatel@linux.ibm.com>, "oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>, lkp <lkp@intel.com>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "Huang, Ying" <ying.huang@intel.com>, 
	"Yin, Fengwei" <fengwei.yin@intel.com>, "cl@linux.com" <cl@linux.com>, 
	"penberg@kernel.org" <penberg@kernel.org>, "rientjes@google.com" <rientjes@google.com>, 
	"iamjoonsoo.kim@lge.com" <iamjoonsoo.kim@lge.com>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "vbabka@suse.cz" <vbabka@suse.cz>, 
	"aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>, "tsahu@linux.ibm.com" <tsahu@linux.ibm.com>, 
	"piyushs@linux.ibm.com" <piyushs@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 21, 2023 at 11:50=E2=80=AFPM Binder Makin <merimus@google.com> =
wrote:
>
> Quick run with hackbench and unixbench on large intel, amd, and arm machi=
nes
> Patch was applied to 6.1.38
>
> hackbench
> Intel performance -2.9% - +1.57% SReclaim -3.2% SUnreclaim -2.4%
> Amd performance -28% - +7.58% SReclaim +21.31 SUnreclaim +20.72
> ARM performance -0.6 - +1.6%  SReclaim +24% SUnreclaim +70%
>
> unixbench
> Intel performance -1.4 - +1.59% SReclaimm -1.65% SUnreclaim -1.59%
> Amd performance -1.9% - +1.05% SReclaim -3.1% SUnreclaimm -0.81%
> ARM performance -0.09% - +0.54% SReclaimm -1.05% SUnreclaim -2.03%
>
> AMD Hackbench
> 28% drop on hackbench_thread_pipes_234

Hi Binder,
Thank you for measuring!!

Can you please provide more information?
Baseline is 6.1.38, and the other is the one, or two patches applied
on baseline?
(optimizing slub memory usage v2, and not allocating high order slabs
from remote nodes)

The 28% drop in AMD is quite huge, and the overall memory usage increased a=
 lot.

Does the AMD machine have 2 sockets?
Did remote node allocations increase or decrease? `numastat`

Can you get some profiles indicating increased list_lock contention?
(or change in values provided by `slabinfo skbuff_head_cache` when
with CONFIG_SLUB_STATS built?)

> On Thu, Jul 20, 2023 at 11:08=E2=80=AFAM Hyeonggon Yoo <42.hyeyoo@gmail.c=
om> wrote:
> >
> > On Thu, Jul 20, 2023 at 11:16=E2=80=AFPM Feng Tang <feng.tang@intel.com=
> wrote:
> > >
> > > Hi Hyeonggon,
> > >
> > > On Thu, Jul 20, 2023 at 08:59:56PM +0800, Hyeonggon Yoo wrote:
> > > > On Thu, Jul 20, 2023 at 12:01=E2=80=AFPM Oliver Sang <oliver.sang@i=
ntel.com> wrote:
> > > > >
> > > > > hi, Hyeonggon Yoo,
> > > > >
> > > > > On Tue, Jul 18, 2023 at 03:43:16PM +0900, Hyeonggon Yoo wrote:
> > > > > > On Mon, Jul 17, 2023 at 10:41=E2=80=AFPM kernel test robot
> > > > > > <oliver.sang@intel.com> wrote:
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > Hello,
> > > > > > >
> > > > > > > kernel test robot noticed a -12.5% regression of hackbench.th=
roughput on:
> > > > > > >
> > > > > > >
> > > > > > > commit: a0fd217e6d6fbd23e91f8796787b621e7d576088 ("[PATCH] [R=
FC PATCH v2]mm/slub: Optimize slub memory usage")
> > > > > > > url: https://github.com/intel-lab-lkp/linux/commits/Jay-Patel=
/mm-slub-Optimize-slub-memory-usage/20230628-180050
> > > > > > > base: git://git.kernel.org/cgit/linux/kernel/git/vbabka/slab.=
git for-next
> > > > > > > patch link: https://lore.kernel.org/all/20230628095740.589893=
-1-jaypatel@linux.ibm.com/
> > > > > > > patch subject: [PATCH] [RFC PATCH v2]mm/slub: Optimize slub m=
emory usage
> > > > > > >
> > > > > > > testcase: hackbench
> > > > > > > test machine: 128 threads 2 sockets Intel(R) Xeon(R) Gold 633=
8 CPU @ 2.00GHz (Ice Lake) with 256G memory
> > > > > > > parameters:
> > > > > > >
> > > > > > >         nr_threads: 100%
> > > > > > >         iterations: 4
> > > > > > >         mode: process
> > > > > > >         ipc: socket
> > > > > > >         cpufreq_governor: performance
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > If you fix the issue in a separate patch/commit (i.e. not jus=
t a new version of
> > > > > > > the same patch/commit), kindly add following tags
> > > > > > > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > > > > > > | Closes: https://lore.kernel.org/oe-lkp/202307172140.3b34825=
a-oliver.sang@intel.com
> > > > > > >
> > > > > > >
> > > > > > > Details are as below:
> > > > > > > -------------------------------------------------------------=
------------------------------------->
> > > > > > >
> > > > > > >
> > > > > > > To reproduce:
> > > > > > >
> > > > > > >         git clone https://github.com/intel/lkp-tests.git
> > > > > > >         cd lkp-tests
> > > > > > >         sudo bin/lkp install job.yaml           # job file is=
 attached in this email
> > > > > > >         bin/lkp split-job --compatible job.yaml # generate th=
e yaml file for lkp run
> > > > > > >         sudo bin/lkp run generated-yaml-file
> > > > > > >
> > > > > > >         # if come across any failure that blocks the test,
> > > > > > >         # please remove ~/.lkp and /lkp dir to run from a cle=
an state.
> > > > > > >
> > > > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > > compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_thre=
ads/rootfs/tbox_group/testcase:
> > > > > > >   gcc-12/performance/socket/4/x86_64-rhel-8.3/process/100%/de=
bian-11.1-x86_64-20220510.cgz/lkp-icl-2sp2/hackbench
> > > > > > >
> > > > > > > commit:
> > > > > > >   7bc162d5cc ("Merge branches 'slab/for-6.5/prandom', 'slab/f=
or-6.5/slab_no_merge' and 'slab/for-6.5/slab-deprecate' into slab/for-next"=
)
> > > > > > >   a0fd217e6d ("mm/slub: Optimize slub memory usage")
> > > > > > >
> > > > > > > 7bc162d5cc4de5c3 a0fd217e6d6fbd23e91f8796787
> > > > > > > ---------------- ---------------------------
> > > > > > >          %stddev     %change         %stddev
> > > > > > >              \          |                \
> > > > > > >     222503 =C4=85 86%    +108.7%     464342 =C4=85 58%  numa-=
meminfo.node1.Active
> > > > > > >     222459 =C4=85 86%    +108.7%     464294 =C4=85 58%  numa-=
meminfo.node1.Active(anon)
> > > > > > >      55573 =C4=85 85%    +108.0%     115619 =C4=85 58%  numa-=
vmstat.node1.nr_active_anon
> > > > > > >      55573 =C4=85 85%    +108.0%     115618 =C4=85 58%  numa-=
vmstat.node1.nr_zone_active_anon
> > > > > >
> > > > > > I'm quite baffled while reading this.
> > > > > > How did changing slab order calculation double the number of ac=
tive anon pages?
> > > > > > I doubt two experiments were performed on the same settings.
> > > > >
> > > > > let me introduce our test process.
> > > > >
> > > > > we make sure the tests upon commit and its parent have exact same=
 environment
> > > > > except the kernel difference, and we also make sure the config to=
 build the
> > > > > commit and its parent are identical.
> > > > >
> > > > > we run tests for one commit at least 6 times to make sure the dat=
a is stable.
> > > > >
> > > > > such like for this case, we rebuild the commit and its parent's k=
ernel, the
> > > > > config is attached FYI.
> > > >
> > > > Hello Oliver,
> > > >
> > > > Thank you for confirming the testing environment is totally fine.
> > > > and I'm sorry. I didn't mean to offend that your tests were bad.
> > > >
> > > > It was more like  "oh, the data totally doesn't make sense to me"
> > > > and I blamed the tests rather than my poor understanding of the dat=
a ;)
> > > >
> > > > Anyway,
> > > > as the data shows a repeatable regression,
> > > > let's think more about the possible scenario:
> > > >
> > > > I can't stop thinking that the patch must've affected the system's
> > > > reclamation behavior in some way.
> > > > (I think more active anon pages with a similar number total of anon
> > > > pages implies the kernel scanned more pages)
> > > >
> > > > It might be because kswapd was more frequently woken up (possible i=
f
> > > > skbs were allocated with GFP_ATOMIC)
> > > > But the data provided is not enough to support this argument.
> > > >
> > > > >  2.43 =C2=B1 7% +4.5 6.90 =C2=B1 11% perf-profile.children.cycles=
-pp.get_partial_node
> > > > >  3.23 =C2=B1  5%      +4.5        7.77 =C2=B1  9%  perf-profile.c=
hildren.cycles-pp.___slab_alloc
> > > > >  7.51 =C2=B1  2%      +4.6       12.11 =C2=B1  5%  perf-profile.c=
hildren.cycles-pp.kmalloc_reserve
> > > > > 6.94 =C2=B1  2%      +4.7       11.62 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.__kmalloc_node_track_caller
> > > > > 6.46 =C2=B1  2%      +4.8       11.22 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.__kmem_cache_alloc_node
> > > > >  8.48 =C2=B1  4%      +7.9       16.42 =C2=B1  8%  perf-profile.c=
hildren.cycles-pp._raw_spin_lock_irqsave
> > > > >  6.12 =C2=B1  6%      +8.6       14.74 =C2=B1  9%  perf-profile.c=
hildren.cycles-pp.native_queued_spin_lock_slowpath
> > > >
> > > > And this increased cycles in the SLUB slowpath implies that the act=
ual
> > > > number of objects available in
> > > > the per cpu partial list has been decreased, possibly because of
> > > > inaccuracy in the heuristic?
> > > > (cuz the assumption that slabs cached per are half-filled, and that
> > > > slabs' order is s->oo)
> > >
> > > From the patch:
> > >
> > >  static unsigned int slub_max_order =3D
> > > -       IS_ENABLED(CONFIG_SLUB_TINY) ? 1 : PAGE_ALLOC_COSTLY_ORDER;
> > > +       IS_ENABLED(CONFIG_SLUB_TINY) ? 1 : 2;
> > >
> > > Could this be related? that it reduces the order for some slab cache,
> > > so each per-cpu slab will has less objects, which makes the contentio=
n
> > > for per-node spinlock 'list_lock' more severe when the slab allocatio=
n
> > > is under pressure from many concurrent threads.
> >
> > hackbench uses skbuff_head_cache intensively. So we need to check if
> > skbuff_head_cache's
> > order was increased or decreased. On my desktop skbuff_head_cache's
> > order is 1 and I roughly
> > guessed it was increased, (but it's still worth checking in the testing=
 env)
> >
> > But decreased slab order does not necessarily mean decreased number
> > of cached objects per CPU, because when oo_order(s->oo) is smaller,
> > then it caches
> > more slabs into the per cpu slab list.
> >
> > I think more problematic situation is when oo_order(s->oo) is higher,
> > because the heuristic
> > in SLUB assumes that each slab has order of oo_order(s->oo) and it's
> > half-filled. if it allocates
> > slabs with order lower than oo_order(s->oo), the number of cached
> > objects per CPU
> > decreases drastically due to the inaccurate assumption.
> >
> > So yeah, decreased number of cached objects per CPU could be the cause
> > of the regression due to the heuristic.
> >
> > And I have another theory: it allocated high order slabs from remote no=
de
> > even if there are slabs with lower order in the local node.
> >
> > ofc we need further experiment, but I think both improving the
> > accuracy of heuristic and
> > avoiding allocating high order slabs from remote nodes would make SLUB
> > more robust.
> >
> > > I don't have direct data to backup it, and I can try some experiment.
> >
> > Thank you for taking time for experiment!
> >
> > Thanks,
> > Hyeonggon
> >
> > > > > then retest on this test machine:
> > > > > 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (I=
ce Lake) with 256G memory
> >
