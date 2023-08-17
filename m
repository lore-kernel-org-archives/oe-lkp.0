Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D366379
	for <oe-lkp@lists.linux.dev>; Thu, 17 Aug 2023 01:25:18 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4fe28f92d8eso11248424e87.1
        for <oe-lkp@lists.linux.dev>; Wed, 16 Aug 2023 18:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692235516; x=1692840316;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=avXiTIG03toHWdc7WMPS+YtjXMBqex6QzMUCbC7BK54=;
        b=Cxp0DVlHWbizHDV6rQuGcgSj47HHAzAvDbqrVzjrBtZ1ezjHcdiLb44UPA1ZWEJauS
         Q9hxNrZtHFO0q2zQOF0AXwOGqvGspGkKUOafw5O8rswmwI1DyYSelTMyqh4xfNODhEAD
         PBRAEMGJhQr+q+JoLQcVhuV8SB061qKjEFcRpyvcB3C3QC0PdAIMwgc5834p6yoanKkv
         SShdqMQLcz2dIwK2tCdPXaCNxo8R7e8ZdmHsyVeS0Rch3y9YN5dzwJVvILYBkpktF3pC
         92WuIhoveVhRJFlfwqkM4BNZ93Xg+Hb6MMZ/oLL3bJhXbbUsrrqONUfZpeYleVyd54jr
         fMpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692235516; x=1692840316;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=avXiTIG03toHWdc7WMPS+YtjXMBqex6QzMUCbC7BK54=;
        b=TIqEYTZHcxSWFo0JzqWEj8IxmvNxnNAaJapFu8VqMD2ZnxpOgJCUQGBCdYgqx+NVHW
         6RqwzRFlSjN2Wfojkm6qSfN6bU0A7Gp5krsZy37lbvlw7KvpdZA+lzxN9z6HG88UR2i7
         uz4MU8Svj0TxhPfII5XqzwjiDa8NnYYDoAW+rwrjZfaT6B+SMALqsVy4KuO37ZFXvG4x
         rnpaAghuIagPngY7KVtHAAzeibhGtdtBc6kBlq1UKTaRB+W0GuD2Zuk2ZL5pVI/5BIM4
         hM3XiOuVck8PMGDA9jiWEDgHmafZCGTZKY8z6iDZPt6vywpv6pNUHTTEipGZA2DlIMYc
         UA5g==
X-Gm-Message-State: AOJu0YzhNtcPyr9T0RTQiYJsjfayCC0cya4LET6uFlLYk7OC7MhGGWH+
	zAVp/7TGX2vciCJE7+rR/vo=
X-Google-Smtp-Source: AGHT+IGS4aL3nfWLiddTUcmAdSQwWE+pVjKaJWyLChFPwOA+uVrg8z3TLx+83k6d70RGQLhZjnp9pg==
X-Received: by 2002:ac2:5b85:0:b0:4ff:834b:e01b with SMTP id o5-20020ac25b85000000b004ff834be01bmr2705975lfn.19.1692235515892;
        Wed, 16 Aug 2023 18:25:15 -0700 (PDT)
Received: from homer.fritz.box ([185.221.151.99])
        by smtp.googlemail.com with ESMTPSA id v10-20020aa7d64a000000b00521d2f7459fsm9006678edr.49.2023.08.16.18.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 18:25:15 -0700 (PDT)
Message-ID: <5f12fc76188cc664ce27606b34152f6c3f4d295c.camel@gmail.com>
Subject: Re: [tip:sched/eevdf] [sched/fair]  e0c2ff903c:
 phoronix-test-suite.blogbench.Write.final_score -34.8% regression
From: Mike Galbraith <umgwanakikbuti@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Chen Yu <yu.c.chen@intel.com>, kernel test robot
 <oliver.sang@intel.com>,  oe-lkp@lists.linux.dev, lkp@intel.com,
 linux-kernel@vger.kernel.org,  x86@kernel.org, Ingo Molnar
 <mingo@kernel.org>
Date: Thu, 17 Aug 2023 03:25:14 +0200
In-Reply-To: <20230816200405.GA998718@hirez.programming.kicks-ass.net>
References: <202308101628.7af4631a-oliver.sang@intel.com>
	 <ZNWKuccyWnS3UJjK@chenyu5-mobl2.bbrouter>
	 <ZNWgAeN/EVS/vOLi@chenyu5-mobl2.bbrouter>
	 <20230814132935.GK776869@hirez.programming.kicks-ass.net>
	 <bd96d883d0d1575ebbee4323f4396596adb0ad09.camel@gmail.com>
	 <20230816123716.GI980931@hirez.programming.kicks-ass.net>
	 <20230816134059.GC982867@hirez.programming.kicks-ass.net>
	 <3d10fbfb0171cc017e19adf39fa97a3160a76206.camel@gmail.com>
	 <20230816200405.GA998718@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Wed, 2023-08-16 at 22:04 +0200, Peter Zijlstra wrote:
> > Here's hoping test bots don't have a cow. 
> 
> You want to write up a Changelog for this, or should I attempt to write
> one?

You write way better changelogs, you took the sting out, taking the
basic notion to solid ground.. and I'm at least as much of a lazy sod
as the next guy, so am all for you making it a real patch :)

	-Mike
