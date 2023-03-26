Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABF920F8
	for <oe-lkp@lists.linux.dev>; Sun, 26 Mar 2023 13:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RjRNfqSt/cZcdh2NlAVQZwyjFXasWigZvmeJpOPbLg0=; b=SKslSt4ARXe4rPkahfBqUw5DWo
	+n9Zo9pnI0cwbcrWrgIxUNXVEtOyeyF/oeUv5e3Ylx1CWOD/X4X3lR9LPEptwT64cCeIkJt2i43z/
	eQW+z0Ogg03shniHpCW/DTZ4+4OgUpA049lE75IYMpwQfUy63z6ynpWnGtB26MWi86OHeb70PVFwg
	hcBhATwYcc8pUqIKTzuFg0YN9L0/5Yo60Zy7RIWq2aW+jMU3uGDIB95x+HodAyRxuv5lCgLDzY22W
	uxDLOepvRkHmifsp9Y58kwpSqdgmTGpfsuxRyk5wSPgA0VBZfem7BenZmkELRpXJL8DraWSveAzxd
	DGjwlU8w==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pgQaC-005q5h-2t;
	Sun, 26 Mar 2023 13:38:53 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 581A13001E5;
	Sun, 26 Mar 2023 15:38:51 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 3AF25240FBBBC; Sun, 26 Mar 2023 15:38:51 +0200 (CEST)
Date: Sun, 26 Mar 2023 15:38:51 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Chen Yu <yu.c.chen@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
	Oliver Sang <oliver.sang@intel.com>,
	Chen Yu <yu.chen.surf@gmail.com>, Ingo Molnar <mingo@kernel.org>
Subject: Re: [peterz-queue:sched/eevdf] [sched/fair]  23669fce72:
 aim7.jobs-per-min -18.6% regression
Message-ID: <20230326133851.GA2994912@hirez.programming.kicks-ass.net>
References: <202303201517.399a9b16-oliver.sang@intel.com>
 <20230320075850.GA2194297@hirez.programming.kicks-ass.net>
 <ZBlg1Bx4L55oSfyR@xsang-OptiPlex-9020>
 <ZBllA/Qq3ZpAOwz+@chenyu5-mobl1>
 <20230321090318.GB2234901@hirez.programming.kicks-ass.net>
 <ZBxEuboumEifedjG@chenyu5-mobl1>
 <20230326110024.GA2990748@hirez.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230326110024.GA2990748@hirez.programming.kicks-ass.net>

On Sun, Mar 26, 2023 at 01:00:24PM +0200, Peter Zijlstra wrote:
> sched/eevdf + place_bonus (based on tip/sched/urgent -- will push out
> later today)
> 
> root@ivb-ep:~# echo NO_PLACE_BONUS > /debug/sched/features ; stress-ng --futex 40 -t 5 --metrics 2>&1 | awk '{ if ($4 == "futex") print $0 }'
> stress-ng: info:  [2373] futex           6541589      5.00      4.28    194.83   1308211.07       32854.97        99.54          2288
> root@ivb-ep:~# echo PLACE_BONUS > /debug/sched/features ; stress-ng --futex 40 -t 5 --metrics 2>&1 | awk '{ if ($4 == "futex") print $0 }'
> stress-ng: info:  [2537] futex           9745715      5.00      5.38    194.55   1948945.01       48745.49        99.96          2288
> 
> 
> The whole sleeper bonus is something that's fairly controversial but it
> was needed in CFS to make some 'starvation' cases go away -- the lag
> based placement cures them too. And given the whole (recent) trainwreck with:
> 
>   829c1651e9c4 ("sched/fair: sanitize vruntime of entity being placed")
>   a53ce18cacb4 ("sched/fair: Sanitize vruntime of entity being migrated")
> 
> I'm happy to delete all that. Still, let me think a little, perhaps I
> can come up with something slightly less horrible than all that which we
> can default-disable for now...

OK, pushed a new version of sched/eevdf that includes a default
disabled PLACE_BONUS.

(and lots of other cleanups, eg. moved to scale_load_down() for
avg_vruntime and measured the max delta to be ~44 bits for a
systemd/cgroup using kernel build -- after I fixed a cgroup placement
issue).
