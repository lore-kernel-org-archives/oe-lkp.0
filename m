Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307A220E6
	for <oe-lkp@lists.linux.dev>; Wed, 19 Apr 2023 05:59:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CA82C433D2;
	Wed, 19 Apr 2023 05:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681883960;
	bh=uMEP/rLMSuizQenPLrelbZAZmJG14sYh9fm/by6+dFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fuXRxOIj80rqK2A/dyzSWBRMytGf8o6ZQ3LNriU1TOAMu8iSwoVoiyVLBHq0nf9aJ
	 dzYc0Ll6oKk06ZEQpD6A2VeR3gB8AJFi8bNjFg5UQiXxUdWdeR5vtLacIdbSdsJA/a
	 QMmTfJJW+aKCidmgcd0ODd0T+ztpzcHiQrcRAXeMrSHzveyCau+vTcH/EXoYO3wpdw
	 /ib+QL3+xH7GyHWXATVkUzdjG/gX7gETPzFZu6SNYcHtMvLe8AhjSlV/P1zkGrTZ90
	 Ukish9v2oseVsi1U6VSpaVC1hAuKz+4JVTgJfXFFA0Nj6LQpsVOOAgE8dIQm/ZcraF
	 /r0tmQ+quF9/Q==
Date: Wed, 19 Apr 2023 08:59:16 +0300
From: Leon Romanovsky <leon@kernel.org>
To: David Ahern <dsahern@kernel.org>
Cc: kernel test robot <oliver.sang@intel.com>,
	Wangyang Guo <wangyang.guo@intel.com>,
	Jakub Kicinski <kuba@kernel.org>, oe-lkp@lists.linux.dev,
	lkp@intel.com, Linux Memory Management List <linux-mm@kvack.org>,
	Arjan van de Ven <arjan@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
	steffen.klassert@secunet.com
Subject: Re: [linux-next:master] [net] d288a162dd: canonical_address#:#[##]
Message-ID: <20230419055916.GB44666@unreal>
References: <202304162125.18b7bcdd-oliver.sang@intel.com>
 <20230418164133.GA44666@unreal>
 <509b08bd-d2bf-eaa8-6c49-c0860d1adbe0@kernel.org>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <509b08bd-d2bf-eaa8-6c49-c0860d1adbe0@kernel.org>

On Tue, Apr 18, 2023 at 02:43:02PM -0600, David Ahern wrote:
> On 4/18/23 10:41 AM, Leon Romanovsky wrote:
> > Hi,
> > 
> > I came to the following diff which eliminates the kernel panics,
> > unfortunately I can explain only second hunk, but first is required
> > too.
> > 
> > diff --git a/net/core/dst.c b/net/core/dst.c
> > index 3247e84045ca..750c8edfe29a 100644
> > --- a/net/core/dst.c
> > +++ b/net/core/dst.c
> > @@ -72,6 +72,8 @@ void dst_init(struct dst_entry *dst, struct dst_ops *ops,
> >         dst->flags = flags;
> >         if (!(flags & DST_NOCOUNT))
> >                 dst_entries_add(ops, 1);
> > +
> > +       INIT_LIST_HEAD(&dst->rt_uncached);
> 
> d288a162dd1c73507da582966f17dd226e34a0c0 moved rt_uncached from rt6_info
> and rtable to dst_entry. Only ipv4 and ipv6 usages initialize it. Since
> it is now in dst_entry, dst_init is the better place so it can be
> removed from rt_dst_alloc and rt6_info_init.

This is why I placed it there, but the rt_uncached list is initialized
in xfrm6 right before first call to rt6_uncached_list_add().

   70 static int xfrm6_fill_dst(struct xfrm_dst *xdst, struct net_device *dev,
   71                           const struct flowi *fl)
   72 {
...
   92         INIT_LIST_HEAD(&xdst->u.rt6.dst.rt_uncached);
   93         rt6_uncached_list_add(&xdst->u.rt6);

My silly explanation is that xfrm6_dst_destroy() can be called before xfrm6_fill_dst().

Thanks

> 
