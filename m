Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335C218AF9
	for <oe-lkp@lists.linux.dev>; Thu, 20 Jul 2023 15:05:29 +0000 (UTC)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-44504b2141bso343596137.2
        for <oe-lkp@lists.linux.dev>; Thu, 20 Jul 2023 08:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689865529; x=1690470329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JofDlbjc1DRpKgQhB82VgSxB/pWR0EN3su/4dd+KC50=;
        b=cHGe7hXp+RtKC3Uf+WIWAwdFle+5kOvJ9eP/6ocOL3CF88ZIWCJGCcwsNhAWI07kTo
         uKiGC927zQ9ndW7nlecxjS4BoNF8YI4FPlbic+1hCI+AzRZJxnu57/uGOlYmgY58nZgc
         174uqWRhokc+L1YzszYRYwMo9PNluYEnkyfjsc8+InRAmnjX3zw141oCiXJRa6VTp9dl
         wE/yvF1cV3WYnlUC25KIMeJ63ZQ0SPLfyOwQ6kcwMT4TGKVYXrv87PSL3vKYGM3f4JVO
         4WD/wKZn9/VaLDi/KIzmfuN9FG+VdGUSCPuBBUd0p5dBdPljyEi/dHlgo3FV0GrsX91V
         Yu5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689865529; x=1690470329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JofDlbjc1DRpKgQhB82VgSxB/pWR0EN3su/4dd+KC50=;
        b=CquLcptpivn8kGt1zlIi2I0/AG70siCI2AZNIX9m3DHnsGNM+VtXeVVQGoxJUG3IM6
         rkmmd5tAmv5arHlH6EXSjbf50wFc2IqUVpGojsSWjzr1ip5fpZ9l22aujnxGZssqKsoD
         veyKEIs8IwdqXDSJvSq52sOpoDcXkYm73loqgBRdH16ctoqJAI6aVhOybW47hc83nv9i
         9Hyy18rD8SsVlCF190LSW3Hhk/KHYLwcEIedO5dVndvYDhX/izw8UZlgyeckx4VgvfJ6
         xRmKeJNl9TGI20Bsnn47rxUyGQmiSDJgdKXyuhApqDhjE1qnK65QIInLEVeniX7xxIta
         5JmQ==
X-Gm-Message-State: ABy/qLbOGithDY7kB0y79yc29SR+5W9mCSHUJTkqrkaegHa/IaiwROjh
	QOV+xuZbrGSxA0wXzDSgXBkd2LsZ2EONj1kDGX/gQqJDOSjIwQ==
X-Google-Smtp-Source: APBJJlEZRnUVn4MNHERg0mWrJj+eAPxmzo7K+52OtiOJOkr38Ad6FF10DHjWMQik7qrWhCoaLaXz2KctBvQN2zn8R7Q=
X-Received: by 2002:a67:e3a5:0:b0:443:60d7:3925 with SMTP id
 j5-20020a67e3a5000000b0044360d73925mr3884845vsm.20.1689865528634; Thu, 20 Jul
 2023 08:05:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230628095740.589893-1-jaypatel@linux.ibm.com>
 <202307172140.3b34825a-oliver.sang@intel.com> <CAB=+i9QY99=NzQugoMCdbEwkCKJObxx4DwWXwNjMqyMRYrgOHA@mail.gmail.com>
 <ZLijZ8QRc0FRgJIF@xsang-OptiPlex-9020> <CAB=+i9QmF2C7QsZBEW0HMT-PGcEf3MeCukVaq0_O1HkGy7n93w@mail.gmail.com>
 <ZLk7UpWWLf5agKDW@feng-clx>
In-Reply-To: <ZLk7UpWWLf5agKDW@feng-clx>
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
Date: Fri, 21 Jul 2023 00:05:17 +0900
Message-ID: <CAB=+i9S6Ykp90+4N1kCE=hiTJTE4wzJDi8k5pBjjO_3sf0aeqg@mail.gmail.com>
Subject: Re: [PATCH] [RFC PATCH v2]mm/slub: Optimize slub memory usage
To: Feng Tang <feng.tang@intel.com>
Cc: "Sang, Oliver" <oliver.sang@intel.com>, Jay Patel <jaypatel@linux.ibm.com>, 
	"oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>, lkp <lkp@intel.com>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "Huang, Ying" <ying.huang@intel.com>, 
	"Yin, Fengwei" <fengwei.yin@intel.com>, "cl@linux.com" <cl@linux.com>, 
	"penberg@kernel.org" <penberg@kernel.org>, "rientjes@google.com" <rientjes@google.com>, 
	"iamjoonsoo.kim@lge.com" <iamjoonsoo.kim@lge.com>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "vbabka@suse.cz" <vbabka@suse.cz>, 
	"aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>, "tsahu@linux.ibm.com" <tsahu@linux.ibm.com>, 
	"piyushs@linux.ibm.com" <piyushs@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 20, 2023 at 11:16=E2=80=AFPM Feng Tang <feng.tang@intel.com> wr=
ote:
>
> Hi Hyeonggon,
>
> On Thu, Jul 20, 2023 at 08:59:56PM +0800, Hyeonggon Yoo wrote:
> > On Thu, Jul 20, 2023 at 12:01=E2=80=AFPM Oliver Sang <oliver.sang@intel=
.com> wrote:
> > >
> > > hi, Hyeonggon Yoo,
> > >
> > > On Tue, Jul 18, 2023 at 03:43:16PM +0900, Hyeonggon Yoo wrote:
> > > > On Mon, Jul 17, 2023 at 10:41=E2=80=AFPM kernel test robot
> > > > <oliver.sang@intel.com> wrote:
> > > > >
> > > > >
> > > > >
> > > > > Hello,
> > > > >
> > > > > kernel test robot noticed a -12.5% regression of hackbench.throug=
hput on:
> > > > >
> > > > >
> > > > > commit: a0fd217e6d6fbd23e91f8796787b621e7d576088 ("[PATCH] [RFC P=
ATCH v2]mm/slub: Optimize slub memory usage")
> > > > > url: https://github.com/intel-lab-lkp/linux/commits/Jay-Patel/mm-=
slub-Optimize-slub-memory-usage/20230628-180050
> > > > > base: git://git.kernel.org/cgit/linux/kernel/git/vbabka/slab.git =
for-next
> > > > > patch link: https://lore.kernel.org/all/20230628095740.589893-1-j=
aypatel@linux.ibm.com/
> > > > > patch subject: [PATCH] [RFC PATCH v2]mm/slub: Optimize slub memor=
y usage
> > > > >
> > > > > testcase: hackbench
> > > > > test machine: 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CP=
U @ 2.00GHz (Ice Lake) with 256G memory
> > > > > parameters:
> > > > >
> > > > >         nr_threads: 100%
> > > > >         iterations: 4
> > > > >         mode: process
> > > > >         ipc: socket
> > > > >         cpufreq_governor: performance
> > > > >
> > > > >
> > > > >
> > > > >
> > > > > If you fix the issue in a separate patch/commit (i.e. not just a =
new version of
> > > > > the same patch/commit), kindly add following tags
> > > > > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > > > > | Closes: https://lore.kernel.org/oe-lkp/202307172140.3b34825a-ol=
iver.sang@intel.com
> > > > >
> > > > >
> > > > > Details are as below:
> > > > > -----------------------------------------------------------------=
--------------------------------->
> > > > >
> > > > >
> > > > > To reproduce:
> > > > >
> > > > >         git clone https://github.com/intel/lkp-tests.git
> > > > >         cd lkp-tests
> > > > >         sudo bin/lkp install job.yaml           # job file is att=
ached in this email
> > > > >         bin/lkp split-job --compatible job.yaml # generate the ya=
ml file for lkp run
> > > > >         sudo bin/lkp run generated-yaml-file
> > > > >
> > > > >         # if come across any failure that blocks the test,
> > > > >         # please remove ~/.lkp and /lkp dir to run from a clean s=
tate.
> > > > >
> > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_threads/=
rootfs/tbox_group/testcase:
> > > > >   gcc-12/performance/socket/4/x86_64-rhel-8.3/process/100%/debian=
-11.1-x86_64-20220510.cgz/lkp-icl-2sp2/hackbench
> > > > >
> > > > > commit:
> > > > >   7bc162d5cc ("Merge branches 'slab/for-6.5/prandom', 'slab/for-6=
.5/slab_no_merge' and 'slab/for-6.5/slab-deprecate' into slab/for-next")
> > > > >   a0fd217e6d ("mm/slub: Optimize slub memory usage")
> > > > >
> > > > > 7bc162d5cc4de5c3 a0fd217e6d6fbd23e91f8796787
> > > > > ---------------- ---------------------------
> > > > >          %stddev     %change         %stddev
> > > > >              \          |                \
> > > > >     222503 =C4=85 86%    +108.7%     464342 =C4=85 58%  numa-memi=
nfo.node1.Active
> > > > >     222459 =C4=85 86%    +108.7%     464294 =C4=85 58%  numa-memi=
nfo.node1.Active(anon)
> > > > >      55573 =C4=85 85%    +108.0%     115619 =C4=85 58%  numa-vmst=
at.node1.nr_active_anon
> > > > >      55573 =C4=85 85%    +108.0%     115618 =C4=85 58%  numa-vmst=
at.node1.nr_zone_active_anon
> > > >
> > > > I'm quite baffled while reading this.
> > > > How did changing slab order calculation double the number of active=
 anon pages?
> > > > I doubt two experiments were performed on the same settings.
> > >
> > > let me introduce our test process.
> > >
> > > we make sure the tests upon commit and its parent have exact same env=
ironment
> > > except the kernel difference, and we also make sure the config to bui=
ld the
> > > commit and its parent are identical.
> > >
> > > we run tests for one commit at least 6 times to make sure the data is=
 stable.
> > >
> > > such like for this case, we rebuild the commit and its parent's kerne=
l, the
> > > config is attached FYI.
> >
> > Hello Oliver,
> >
> > Thank you for confirming the testing environment is totally fine.
> > and I'm sorry. I didn't mean to offend that your tests were bad.
> >
> > It was more like  "oh, the data totally doesn't make sense to me"
> > and I blamed the tests rather than my poor understanding of the data ;)
> >
> > Anyway,
> > as the data shows a repeatable regression,
> > let's think more about the possible scenario:
> >
> > I can't stop thinking that the patch must've affected the system's
> > reclamation behavior in some way.
> > (I think more active anon pages with a similar number total of anon
> > pages implies the kernel scanned more pages)
> >
> > It might be because kswapd was more frequently woken up (possible if
> > skbs were allocated with GFP_ATOMIC)
> > But the data provided is not enough to support this argument.
> >
> > >  2.43 =C2=B1 7% +4.5 6.90 =C2=B1 11% perf-profile.children.cycles-pp.=
get_partial_node
> > >  3.23 =C2=B1  5%      +4.5        7.77 =C2=B1  9%  perf-profile.child=
ren.cycles-pp.___slab_alloc
> > >  7.51 =C2=B1  2%      +4.6       12.11 =C2=B1  5%  perf-profile.child=
ren.cycles-pp.kmalloc_reserve
> > > 6.94 =C2=B1  2%      +4.7       11.62 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.__kmalloc_node_track_caller
> > > 6.46 =C2=B1  2%      +4.8       11.22 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.__kmem_cache_alloc_node
> > >  8.48 =C2=B1  4%      +7.9       16.42 =C2=B1  8%  perf-profile.child=
ren.cycles-pp._raw_spin_lock_irqsave
> > >  6.12 =C2=B1  6%      +8.6       14.74 =C2=B1  9%  perf-profile.child=
ren.cycles-pp.native_queued_spin_lock_slowpath
> >
> > And this increased cycles in the SLUB slowpath implies that the actual
> > number of objects available in
> > the per cpu partial list has been decreased, possibly because of
> > inaccuracy in the heuristic?
> > (cuz the assumption that slabs cached per are half-filled, and that
> > slabs' order is s->oo)
>
> From the patch:
>
>  static unsigned int slub_max_order =3D
> -       IS_ENABLED(CONFIG_SLUB_TINY) ? 1 : PAGE_ALLOC_COSTLY_ORDER;
> +       IS_ENABLED(CONFIG_SLUB_TINY) ? 1 : 2;
>
> Could this be related? that it reduces the order for some slab cache,
> so each per-cpu slab will has less objects, which makes the contention
> for per-node spinlock 'list_lock' more severe when the slab allocation
> is under pressure from many concurrent threads.

hackbench uses skbuff_head_cache intensively. So we need to check if
skbuff_head_cache's
order was increased or decreased. On my desktop skbuff_head_cache's
order is 1 and I roughly
guessed it was increased, (but it's still worth checking in the testing env=
)

But decreased slab order does not necessarily mean decreased number
of cached objects per CPU, because when oo_order(s->oo) is smaller,
then it caches
more slabs into the per cpu slab list.

I think more problematic situation is when oo_order(s->oo) is higher,
because the heuristic
in SLUB assumes that each slab has order of oo_order(s->oo) and it's
half-filled. if it allocates
slabs with order lower than oo_order(s->oo), the number of cached
objects per CPU
decreases drastically due to the inaccurate assumption.

So yeah, decreased number of cached objects per CPU could be the cause
of the regression due to the heuristic.

And I have another theory: it allocated high order slabs from remote node
even if there are slabs with lower order in the local node.

ofc we need further experiment, but I think both improving the
accuracy of heuristic and
avoiding allocating high order slabs from remote nodes would make SLUB
more robust.

> I don't have direct data to backup it, and I can try some experiment.

Thank you for taking time for experiment!

Thanks,
Hyeonggon

> > > then retest on this test machine:
> > > 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (Ice L=
ake) with 256G memory
