Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2770F322A
	for <oe-lkp@lists.linux.dev>; Wed, 16 Aug 2023 12:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=meButugzK+c8b7F/2W247t2wjtoumPjf98JrcWTnXLk=; b=clHXquPzLZPNUfJ/MkxaqbYb3Y
	I2vcp4UlQJFz7KT+/RXOOlNFUMtMsUK6prRFwzZKkrTHa+lIasMeLbY0824nvgbF7e8LOn1gDRFGB
	hyU4qzRQpF2Tcxyml4YJOBtlQLIW7GpJ5dP55DkKjVrzt9Z5c5ANn7Ugp8ePPz/6kJMAeeQl98FQv
	deIeS42+iR/FLxgKMT5ILnoR+gfjqE81YZLe4q+nQJ8xW9FJHNp0RcW9dTFCv0MHvQsIL6obrDMDu
	iEcpsffCybCb0CfnY8DAGLUKuQoJluykptTZ+Wt62rIuyfWiULmEfFqh+BImwUhQK23YETX+V8679
	MbJTmnWA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qWFm0-00CzLf-2c;
	Wed, 16 Aug 2023 12:37:17 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 32ED13001FD;
	Wed, 16 Aug 2023 14:37:16 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 1AB6A2C2FDF3F; Wed, 16 Aug 2023 14:37:16 +0200 (CEST)
Date: Wed, 16 Aug 2023 14:37:16 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mike Galbraith <umgwanakikbuti@gmail.com>
Cc: Chen Yu <yu.c.chen@intel.com>,
	kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org, x86@kernel.org,
	Ingo Molnar <mingo@kernel.org>
Subject: Re: [tip:sched/eevdf] [sched/fair]  e0c2ff903c:
 phoronix-test-suite.blogbench.Write.final_score -34.8% regression
Message-ID: <20230816123716.GI980931@hirez.programming.kicks-ass.net>
References: <202308101628.7af4631a-oliver.sang@intel.com>
 <ZNWKuccyWnS3UJjK@chenyu5-mobl2.bbrouter>
 <ZNWgAeN/EVS/vOLi@chenyu5-mobl2.bbrouter>
 <20230814132935.GK776869@hirez.programming.kicks-ass.net>
 <bd96d883d0d1575ebbee4323f4396596adb0ad09.camel@gmail.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd96d883d0d1575ebbee4323f4396596adb0ad09.camel@gmail.com>

On Mon, Aug 14, 2023 at 08:32:55PM +0200, Mike Galbraith wrote:

> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -875,6 +875,12 @@ static struct sched_entity *pick_eevdf(s
>  	if (curr && (!curr->on_rq || !entity_eligible(cfs_rq, curr)))
>  		curr = NULL;
>  
> +	/*
> +	 * Once selected, run the task to parity to avoid overscheduling.
> +	 */
> +	if (sched_feat(RUN_TO_PARITY) && curr)
> +		return curr;
> +
>  	while (node) {
>  		struct sched_entity *se = __node_2_se(node);
>  

So I read it wrong last night... but I rather like this idea. But
there's something missing. When curr starts a new slice it should
probably do a full repick and not stick with it.

Let me poke at this a bit.. nice

