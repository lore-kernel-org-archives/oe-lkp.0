Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF8A1C14
	for <oe-lkp@lists.linux.dev>; Mon,  7 Aug 2023 08:39:48 +0000 (UTC)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-48735dd1b98so505796e0c.2
        for <oe-lkp@lists.linux.dev>; Mon, 07 Aug 2023 01:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691397587; x=1692002387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPzZTlICzLYEHMNh2iGs7nTLC2Ztxao8NLG8OMNUOK0=;
        b=FM53P8h7ve9is3BOG/5+xvjnPTfH5lB0YQcOp3ZovLoZKpjTgwypoT9loSaVciRU4V
         +P0bzq1sFOpMZCn66RaRdve2DTdRn47tBO+7nlmCcY7GHBV96ISMSWhef3k26Gy7Mcfp
         AqPBxGhncfT8VH91Y+JagWTYuQ+veYPbZI1I0kXUjF8HRs8A8cD/1znwNCoZNE3rDJ4l
         7zGtBVY7Ah+t38pnjZF+B8oVo+FKOd7cKl/UYgEfvo3HLpy2KDJcUikhuPtVIDJ8pJK9
         JMC0L15Snj6ToehTMzpjJaAg31eQy9LLS48Q4RRn8rFMBrLMztV7efxHsC9EzXRSkEkl
         1Y7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691397587; x=1692002387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BPzZTlICzLYEHMNh2iGs7nTLC2Ztxao8NLG8OMNUOK0=;
        b=Jcvm3BrhpXLlxBLeBtzReGYlyNfRXUHK9bUwO+SzTj6CzecBOSfxS852BIAA6W8Cfd
         Q5zFeKGlEayjpbTnzwBMh8rs2B6x2nsULcuti34VFTgTXC+/HyAMV9s6+4TFHeCc2Fk4
         BDld7ocTuO0ie41mGFb5mGf3uz5ZOSuHtWnX/ni+7kbdW6N5En49Qi9Bj1iFo1t5qq4Z
         mrOAeNXEplEyA8MNRc8rAAEhWfXWPA7L6WWDRfAUHDSCKRyJ/6Zw2OYvfcn3Bn974rhP
         N0Hu4bei8Wrv5hg5nvjq4Rw78NGbEaPvyrbxovaxztYyPUqDrPakJbc4tIosIGfHPcCz
         Vt5w==
X-Gm-Message-State: AOJu0YxrYckdrrUEvUBVt8xOxGxlTGk3YLOLDnh8WplqVGsHB3T5654y
	ZkMZC/H09of01oaMnmqsVcDsjxNJnGWC2VqvaNw=
X-Google-Smtp-Source: AGHT+IHL5u3t52XLQEfHjY0HO8ytpXExG0xmtQIZn6rLE5AItd5HTGIYn8AxhWWp1BT4sRC/YFbTfh8JxD1CjlWRyQs=
X-Received: by 2002:a1f:3d95:0:b0:485:e984:779e with SMTP id
 k143-20020a1f3d95000000b00485e984779emr3965774vka.2.1691397587074; Mon, 07
 Aug 2023 01:39:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230723190906.4082646-1-42.hyeyoo@gmail.com> <20230723190906.4082646-3-42.hyeyoo@gmail.com>
 <1f88aff2-8027-1020-71b2-6a6528f82207@suse.cz>
In-Reply-To: <1f88aff2-8027-1020-71b2-6a6528f82207@suse.cz>
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
Date: Mon, 7 Aug 2023 17:39:35 +0900
Message-ID: <CAB=+i9R52jLzD9eAMxhRTMHTFDmAGPDPcD0pwCxxDwq5yFZbxQ@mail.gmail.com>
Subject: Re: [RFC 2/2] mm/slub: prefer NUMA locality over slight memory saving
 on NUMA machines
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, 
	Joonsoo Kim <iamjoonsoo.kim@lge.com>, David Rientjes <rientjes@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Feng Tang <feng.tang@intel.com>, "Sang, Oliver" <oliver.sang@intel.com>, 
	Jay Patel <jaypatel@linux.ibm.com>, Binder Makin <merimus@google.com>, aneesh.kumar@linux.ibm.com, 
	tsahu@linux.ibm.com, piyushs@linux.ibm.com, fengwei.yin@intel.com, 
	ying.huang@intel.com, lkp <lkp@intel.com>, 
	"oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 3, 2023 at 11:54=E2=80=AFPM Vlastimil Babka <vbabka@suse.cz> wr=
ote:
>
> On 7/23/23 21:09, Hyeonggon Yoo wrote:
> > By default, SLUB sets remote_node_defrag_ratio to 1000, which makes it
> > (in most cases) take slabs from remote nodes first before trying alloca=
ting
> > new folios on the local node from buddy.
> >
> > Documentation/ABI/testing/sysfs-kernel-slab says:
> >> The file remote_node_defrag_ratio specifies the percentage of
> >> times SLUB will attempt to refill the cpu slab with a partial
> >> slab from a remote node as opposed to allocating a new slab on
> >> the local node.  This reduces the amount of wasted memory over
> >> the entire system but can be expensive.
> >
> > Although this made sense when it was introduced, the portion of
> > per node partial lists in the overall SLUB memory usage has been decrea=
sed
> > since the introduction of per cpu partial lists. Therefore, it's worth
> > reevaluating its overhead on performance and memory usage.
> >
> > [
> >       XXX: Add performance data. I tried to measure its impact on
> >       hackbench with a 2 socket NUMA  machine. but it seems hackbench i=
s
> >       too synthetic to benefit from this, because the skbuff_head_cache=
's
> >       size fits into the last level cache.
> >
> >       Probably more realistic workloads like netperf would benefit
> >       from this?
> > ]
> >
> > Set remote_node_defrag_ratio to zero by default, and the new behavior i=
s:
> >       1) try refilling per CPU partial list from the local node
> >       2) try allocating new slabs from the local node without reclamati=
on
> >       3) try refilling per CPU partial list from remote nodes
> >       4) try allocating new slabs from the local node or remote nodes
> >
> > If user specified remote_node_defrag_ratio, it probabilistically tries
> > 3) first and then try 2) and 4) in order, to avoid unexpected behaviora=
l
> > change from user's perspective.
>
> It makes sense to me, but as you note it would be great to demonstrate
> benefits, because it adds complexity, especially in the already complex
> ___slab_alloc(). Networking has been indeed historically a workload very
> sensitive to slab performance, so seems a good candidate.

Thank you for looking at it!

Yeah, it was a PoC for what I thought "oh, it might be useful"
and definitely I will try to measure it.

> We could also postpone this until we have tried the percpu arrays
> improvements discussed at LSF/MM.

Possibly, but can you please share your plans/opinions on it?
I think one possible way is simply to allow the cpu freelist to be
mixed by objects from different slabs
if we want to minimize changes, Or introduce a per cpu array similar
to what SLAB does now.

And one thing I'm having difficulty understanding is - what is the
mind behind/or impact of managing objects
on a slab basis, other than avoiding array queues in 2007?
