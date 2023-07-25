Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320D34C6D
	for <oe-lkp@lists.linux.dev>; Tue, 25 Jul 2023 03:14:08 +0000 (UTC)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-79470b88d88so1464330241.0
        for <oe-lkp@lists.linux.dev>; Mon, 24 Jul 2023 20:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690254848; x=1690859648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pPoaqDYcJEkR09Xy3FpP5oBGVCeGQp/4CQdqK1Gbj5c=;
        b=BB73+/M+sX5xO+KCcW3Jl0q0ySyDxLgQVnJ2HK+QJf/R6K9zeiFCpKWMq5vGVUNolV
         YAxY543h6FwJcbvACnYQZUbVXZ/7l2kkLJUXygAmxyTfGx2fsZ1xbGNw+mcFCfGy85Fr
         Fo5zAQDroIhhZgpuDoriL5TAC89l6jgG2gtP3KPIK5wdndfuEHGQEo3tHV6h6MXz7/L8
         Tt8Sa3zk14PL/L0xNppQ8724+2byyQCnnP0JMvTX9pC62OlxJ60b5WlaV5OnNIpkgp72
         JWndZmOYSx4wrvjiQJCq3NAT8BYa4gkNJqZ4NefuRx5fpsdoHkjcZBSmiFBlJsGUeU8q
         EaFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690254848; x=1690859648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pPoaqDYcJEkR09Xy3FpP5oBGVCeGQp/4CQdqK1Gbj5c=;
        b=HtPnVPVr+BP+SEzRebI+ynB9HgDSrGp9unEdUTev/HtBgNjoSjVHCiXNkE6oUik+qw
         NY7DjnYnQ08ANMTaGTXuUp+aIZRVPw3R5PT8yvvxZWPeZ9OD4eH6EC8kSMOqt4QcadXX
         3lcZE9ip9dgxB7g5LKQYZGvE2WY056ns4hRsmLvgB62QVIV9o4iQCKZRP4R3PBJeb6Vu
         E2IQo5TprIKjVIBKzYX9ob7gkfwLjevlobu/28GVs/MSy9f3bVG7z8VlQYdoF8CdLmq6
         p9jK2H1IehQiIzA8bAgxOnWtr8AI1O9oazqIOlOXgmaO+KJG5V9MFLMUXulRXvNDa6PN
         yjiA==
X-Gm-Message-State: ABy/qLaC4XEcCGMOVG1P2fwEqJerMGoERzbWmwGzqsx4v571HEqHdSzm
	seDuStCQ9TW0xNuAmtheN4+SNFKFyt1l+VprUBM=
X-Google-Smtp-Source: APBJJlHKLcCSIJFSl33h4HO2wVJ0ed/yhiKa8FRxQuvO0TvLyYMddW0AcrdGsTlS4N8NJFoimzn0qYQXC/aVB8WE5vw=
X-Received: by 2002:a1f:5fc5:0:b0:47e:30a:c7bc with SMTP id
 t188-20020a1f5fc5000000b0047e030ac7bcmr5167129vkb.12.1690254847495; Mon, 24
 Jul 2023 20:14:07 -0700 (PDT)
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
 <ZL6MQXOaOHTvdGti@feng-clx>
In-Reply-To: <ZL6MQXOaOHTvdGti@feng-clx>
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
Date: Tue, 25 Jul 2023 12:13:56 +0900
Message-ID: <CAB=+i9SNS-Z8-WARiivMBy5gibZDCkpS+sk8v+2awvyffAwB8g@mail.gmail.com>
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

On Mon, Jul 24, 2023 at 11:43=E2=80=AFPM Feng Tang <feng.tang@intel.com> wr=
ote:
>
> On Thu, Jul 20, 2023 at 11:05:17PM +0800, Hyeonggon Yoo wrote:
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
>
> I run the reproduce command in a local 2-socket box:
>
> "/usr/bin/hackbench" "-g" "128" "-f" "20" "--process" "-l" "30000" "-s" "=
100"
>
> And found 2 kmem_cache has been boost: 'kmalloc-cg-512' and
> 'skbuff_head_cache'. Only order of 'kmalloc-cg-512' was reduced
> from 3 to 2 with the patch, while its 'cpu_partial_slabs' was bumped
> from 2 to 4. The setting of 'skbuff_head_cache' was kept unchanged.
>
> And this compiled with the perf-profile info from 0Day's report, that the
> 'list_lock' contention is increased with the patch:
>
>     13.71%    13.70%  [kernel.kallsyms]         [k] native_queued_spin_lo=
ck_slowpath                            -      -
> 5.80% native_queued_spin_lock_slowpath;_raw_spin_lock_irqsave;__unfreeze_=
partials;skb_release_data;consume_skb;unix_stream_read_generic;unix_stream_=
recvmsg;sock_recvmsg;sock_read_iter;vfs_read;ksys_read;do_syscall_64;entry_=
SYSCALL_64_after_hwframe;__libc_read
> 5.56% native_queued_spin_lock_slowpath;_raw_spin_lock_irqsave;get_partial=
_node.part.0;___slab_alloc.constprop.0;__kmem_cache_alloc_node;__kmalloc_no=
de_track_caller;kmalloc_reserve;__alloc_skb;alloc_skb_with_frags;sock_alloc=
_send_pskb;unix_stream_sendmsg;sock_write_iter;vfs_write;ksys_write;do_sysc=
all_64;entry_SYSCALL_64_after_hwframe;__libc_write

Oh... neither of the assumptions were not true.
AFAICS it's a case of decreasing slab order increases lock contention,

The number of cached objects per CPU is mostly the same (not exactly same,
because the cpu slab is not accounted for), but only increases the
number of slabs
to process while taking slabs (get_partial_node()), and flushing the curren=
t
cpu partial list. (put_cpu_partial() -> __unfreeze_partials())

Can we do better in this situation? improve __unfreeze_partials()?

> Also I tried to restore the slub_max_order to 3, and the regression was
> gone.
>
>  static unsigned int slub_max_order =3D
> -       IS_ENABLED(CONFIG_SLUB_TINY) ? 1 : 2;
> +       IS_ENABLED(CONFIG_SLUB_TINY) ? 1 : 3;
>  static unsigned int slub_min_objects;
>
> Thanks,
> Feng
>
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
