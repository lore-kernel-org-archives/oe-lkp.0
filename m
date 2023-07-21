Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40E327F05
	for <oe-lkp@lists.linux.dev>; Fri, 21 Jul 2023 14:50:46 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-570877f7838so22990417b3.0
        for <oe-lkp@lists.linux.dev>; Fri, 21 Jul 2023 07:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689951045; x=1690555845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S3IVyzcUxMIPO3UOb7UuX/1sHZ4DjuJI2eD6DxXCT08=;
        b=lTiqwo+JxgARYEYl2yVXhHbp4yJkVj73yVNkjG+rYfiFNWcuK8zs2kNDaPLZMXV61J
         vh4Jlvnbkfmoe0OijRGgg1TammkaGaJfljCog9C55xcrjJfHyVK/Oi+YJ46e2ibiw0jo
         CvQa58AFjBOEziysJckS9J1qbkhvcOSm/bqDAFbVFbtweuTEbWZD49X6Tn6iRw17AZt5
         KzF5H2n0MT0Ggr6mIiG9uK2qmgSa+eAxz+0giex5byDru4XBhl1bQjW3YrNNEsp2vGpr
         ZbPyPaH2wJVB5HG1ZI0tJ4hiDz52mahcleJy4EGjc7319T+ZOWZnGPo9I0RSUQNieRRz
         3XKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689951045; x=1690555845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S3IVyzcUxMIPO3UOb7UuX/1sHZ4DjuJI2eD6DxXCT08=;
        b=RgIfgFdBnwZ4lhQfctv1wcHqtPTwL6N5gn1Xzb6wFJMRKwHZwL4trxfaTybPtLpEFc
         lQfeML7T50XfiyZVzXcGVZ77rNwyxodyfhmL4t5pa974x0LDWmvz3Z7sI1W/iZIl79ma
         9SyOxNgbP1rVNLE+5k8umtBNrSECiCrRacy+bmpt98qB6nHX8AvaHHw53t4Dah4lRouu
         fUQbKbWYrCf1902DQHngl3n7AQOQHnY/3Tnr5DJB/wxA35OycKgmYQwAvVOWGhC/Qbij
         gIgkM2iuCz3nkYHNckeaXUxierGTvQUSdhxPEEgP5lcN3VA8Zahovq+sy1hTBMQlkEoG
         Qsvg==
X-Gm-Message-State: ABy/qLZgxxVb7H+YQG+UTX9Dlv5CHf52lxdL7qPYwQCIEeP7CiItI8zm
	I2wr4kAkOaaiPHYbtQAAKVznoo9dm37nqbx5P7QPoA==
X-Google-Smtp-Source: APBJJlG7vPFbrM6L3rs9viZBbQhkS3waVB+cjjz9QQWZCLUWweTYsvzBINOk+HX3auQLAAYD+pAJlI8ctqXHWIkS+v4=
X-Received: by 2002:a25:fc05:0:b0:c41:a05d:5da7 with SMTP id
 v5-20020a25fc05000000b00c41a05d5da7mr1962505ybd.5.1689951045399; Fri, 21 Jul
 2023 07:50:45 -0700 (PDT)
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
In-Reply-To: <CAB=+i9S6Ykp90+4N1kCE=hiTJTE4wzJDi8k5pBjjO_3sf0aeqg@mail.gmail.com>
From: Binder Makin <merimus@google.com>
Date: Fri, 21 Jul 2023 10:50:33 -0400
Message-ID: <CAANmLtyj0=mkHD8xPEv6ERv48kg+LpJuEkOPofEMvuTa0NRjXg@mail.gmail.com>
Subject: Re: [PATCH] [RFC PATCH v2]mm/slub: Optimize slub memory usage
To: Hyeonggon Yoo <42.hyeyoo@gmail.com>
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

Quick run with hackbench and unixbench on large intel, amd, and arm machine=
s
Patch was applied to 6.1.38

hackbench
Intel performance -2.9% - +1.57% SReclaim -3.2% SUnreclaim -2.4%
Amd performance -28% - +7.58% SReclaim +21.31 SUnreclaim +20.72
ARM performance -0.6 - +1.6%  SReclaim +24% SUnreclaim +70%

unixbench
Intel performance -1.4 - +1.59% SReclaimm -1.65% SUnreclaim -1.59%
Amd performance -1.9% - +1.05% SReclaim -3.1% SUnreclaimm -0.81%
ARM performance -0.09% - +0.54% SReclaimm -1.05% SUnreclaim -2.03%

AMD Hackbench
28% drop on hackbench_thread_pipes_234


On Thu, Jul 20, 2023 at 11:08=E2=80=AFAM Hyeonggon Yoo <42.hyeyoo@gmail.com=
> wrote:
>
> On Thu, Jul 20, 2023 at 11:16=E2=80=AFPM Feng Tang <feng.tang@intel.com> =
wrote:
> >
> > Hi Hyeonggon,
> >
> > On Thu, Jul 20, 2023 at 08:59:56PM +0800, Hyeonggon Yoo wrote:
> > > On Thu, Jul 20, 2023 at 12:01=E2=80=AFPM Oliver Sang <oliver.sang@int=
el.com> wrote:
> > > >
> > > > hi, Hyeonggon Yoo,
> > > >
> > > > On Tue, Jul 18, 2023 at 03:43:16PM +0900, Hyeonggon Yoo wrote:
> > > > > On Mon, Jul 17, 2023 at 10:41=E2=80=AFPM kernel test robot
> > > > > <oliver.sang@intel.com> wrote:
> > > > > >
> > > > > >
> > > > > >
> > > > > > Hello,
> > > > > >
> > > > > > kernel test robot noticed a -12.5% regression of hackbench.thro=
ughput on:
> > > > > >
> > > > > >
> > > > > > commit: a0fd217e6d6fbd23e91f8796787b621e7d576088 ("[PATCH] [RFC=
 PATCH v2]mm/slub: Optimize slub memory usage")
> > > > > > url: https://github.com/intel-lab-lkp/linux/commits/Jay-Patel/m=
m-slub-Optimize-slub-memory-usage/20230628-180050
> > > > > > base: git://git.kernel.org/cgit/linux/kernel/git/vbabka/slab.gi=
t for-next
> > > > > > patch link: https://lore.kernel.org/all/20230628095740.589893-1=
-jaypatel@linux.ibm.com/
> > > > > > patch subject: [PATCH] [RFC PATCH v2]mm/slub: Optimize slub mem=
ory usage
> > > > > >
> > > > > > testcase: hackbench
> > > > > > test machine: 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 =
CPU @ 2.00GHz (Ice Lake) with 256G memory
> > > > > > parameters:
> > > > > >
> > > > > >         nr_threads: 100%
> > > > > >         iterations: 4
> > > > > >         mode: process
> > > > > >         ipc: socket
> > > > > >         cpufreq_governor: performance
> > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > > > If you fix the issue in a separate patch/commit (i.e. not just =
a new version of
> > > > > > the same patch/commit), kindly add following tags
> > > > > > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > > > > > | Closes: https://lore.kernel.org/oe-lkp/202307172140.3b34825a-=
oliver.sang@intel.com
> > > > > >
> > > > > >
> > > > > > Details are as below:
> > > > > > ---------------------------------------------------------------=
----------------------------------->
> > > > > >
> > > > > >
> > > > > > To reproduce:
> > > > > >
> > > > > >         git clone https://github.com/intel/lkp-tests.git
> > > > > >         cd lkp-tests
> > > > > >         sudo bin/lkp install job.yaml           # job file is a=
ttached in this email
> > > > > >         bin/lkp split-job --compatible job.yaml # generate the =
yaml file for lkp run
> > > > > >         sudo bin/lkp run generated-yaml-file
> > > > > >
> > > > > >         # if come across any failure that blocks the test,
> > > > > >         # please remove ~/.lkp and /lkp dir to run from a clean=
 state.
> > > > > >
> > > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_thread=
s/rootfs/tbox_group/testcase:
> > > > > >   gcc-12/performance/socket/4/x86_64-rhel-8.3/process/100%/debi=
an-11.1-x86_64-20220510.cgz/lkp-icl-2sp2/hackbench
> > > > > >
> > > > > > commit:
> > > > > >   7bc162d5cc ("Merge branches 'slab/for-6.5/prandom', 'slab/for=
-6.5/slab_no_merge' and 'slab/for-6.5/slab-deprecate' into slab/for-next")
> > > > > >   a0fd217e6d ("mm/slub: Optimize slub memory usage")
> > > > > >
> > > > > > 7bc162d5cc4de5c3 a0fd217e6d6fbd23e91f8796787
> > > > > > ---------------- ---------------------------
> > > > > >          %stddev     %change         %stddev
> > > > > >              \          |                \
> > > > > >     222503 =C4=85 86%    +108.7%     464342 =C4=85 58%  numa-me=
minfo.node1.Active
> > > > > >     222459 =C4=85 86%    +108.7%     464294 =C4=85 58%  numa-me=
minfo.node1.Active(anon)
> > > > > >      55573 =C4=85 85%    +108.0%     115619 =C4=85 58%  numa-vm=
stat.node1.nr_active_anon
> > > > > >      55573 =C4=85 85%    +108.0%     115618 =C4=85 58%  numa-vm=
stat.node1.nr_zone_active_anon
> > > > >
> > > > > I'm quite baffled while reading this.
> > > > > How did changing slab order calculation double the number of acti=
ve anon pages?
> > > > > I doubt two experiments were performed on the same settings.
> > > >
> > > > let me introduce our test process.
> > > >
> > > > we make sure the tests upon commit and its parent have exact same e=
nvironment
> > > > except the kernel difference, and we also make sure the config to b=
uild the
> > > > commit and its parent are identical.
> > > >
> > > > we run tests for one commit at least 6 times to make sure the data =
is stable.
> > > >
> > > > such like for this case, we rebuild the commit and its parent's ker=
nel, the
> > > > config is attached FYI.
> > >
> > > Hello Oliver,
> > >
> > > Thank you for confirming the testing environment is totally fine.
> > > and I'm sorry. I didn't mean to offend that your tests were bad.
> > >
> > > It was more like  "oh, the data totally doesn't make sense to me"
> > > and I blamed the tests rather than my poor understanding of the data =
;)
> > >
> > > Anyway,
> > > as the data shows a repeatable regression,
> > > let's think more about the possible scenario:
> > >
> > > I can't stop thinking that the patch must've affected the system's
> > > reclamation behavior in some way.
> > > (I think more active anon pages with a similar number total of anon
> > > pages implies the kernel scanned more pages)
> > >
> > > It might be because kswapd was more frequently woken up (possible if
> > > skbs were allocated with GFP_ATOMIC)
> > > But the data provided is not enough to support this argument.
> > >
> > > >  2.43 =C2=B1 7% +4.5 6.90 =C2=B1 11% perf-profile.children.cycles-p=
p.get_partial_node
> > > >  3.23 =C2=B1  5%      +4.5        7.77 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.___slab_alloc
> > > >  7.51 =C2=B1  2%      +4.6       12.11 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.kmalloc_reserve
> > > > 6.94 =C2=B1  2%      +4.7       11.62 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.__kmalloc_node_track_caller
> > > > 6.46 =C2=B1  2%      +4.8       11.22 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.__kmem_cache_alloc_node
> > > >  8.48 =C2=B1  4%      +7.9       16.42 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp._raw_spin_lock_irqsave
> > > >  6.12 =C2=B1  6%      +8.6       14.74 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.native_queued_spin_lock_slowpath
> > >
> > > And this increased cycles in the SLUB slowpath implies that the actua=
l
> > > number of objects available in
> > > the per cpu partial list has been decreased, possibly because of
> > > inaccuracy in the heuristic?
> > > (cuz the assumption that slabs cached per are half-filled, and that
> > > slabs' order is s->oo)
> >
> > From the patch:
> >
> >  static unsigned int slub_max_order =3D
> > -       IS_ENABLED(CONFIG_SLUB_TINY) ? 1 : PAGE_ALLOC_COSTLY_ORDER;
> > +       IS_ENABLED(CONFIG_SLUB_TINY) ? 1 : 2;
> >
> > Could this be related? that it reduces the order for some slab cache,
> > so each per-cpu slab will has less objects, which makes the contention
> > for per-node spinlock 'list_lock' more severe when the slab allocation
> > is under pressure from many concurrent threads.
>
> hackbench uses skbuff_head_cache intensively. So we need to check if
> skbuff_head_cache's
> order was increased or decreased. On my desktop skbuff_head_cache's
> order is 1 and I roughly
> guessed it was increased, (but it's still worth checking in the testing e=
nv)
>
> But decreased slab order does not necessarily mean decreased number
> of cached objects per CPU, because when oo_order(s->oo) is smaller,
> then it caches
> more slabs into the per cpu slab list.
>
> I think more problematic situation is when oo_order(s->oo) is higher,
> because the heuristic
> in SLUB assumes that each slab has order of oo_order(s->oo) and it's
> half-filled. if it allocates
> slabs with order lower than oo_order(s->oo), the number of cached
> objects per CPU
> decreases drastically due to the inaccurate assumption.
>
> So yeah, decreased number of cached objects per CPU could be the cause
> of the regression due to the heuristic.
>
> And I have another theory: it allocated high order slabs from remote node
> even if there are slabs with lower order in the local node.
>
> ofc we need further experiment, but I think both improving the
> accuracy of heuristic and
> avoiding allocating high order slabs from remote nodes would make SLUB
> more robust.
>
> > I don't have direct data to backup it, and I can try some experiment.
>
> Thank you for taking time for experiment!
>
> Thanks,
> Hyeonggon
>
> > > > then retest on this test machine:
> > > > 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (Ice=
 Lake) with 256G memory
>
