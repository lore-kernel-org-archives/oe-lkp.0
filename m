Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF26748E
	for <oe-lkp@lists.linux.dev>; Sat, 21 Jan 2023 16:49:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00EF2C433D2;
	Sat, 21 Jan 2023 16:49:06 +0000 (UTC)
Date: Sat, 21 Jan 2023 11:49:04 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
 lkp@intel.com, linux-kernel@vger.kernel.org, x86@kernel.org, Ingo Molnar
 <mingo@kernel.org>, linux-trace-kernel@vger.kernel.org
Subject: Re: [tip:sched/core] [tracing, hardirq]  9aedeaed6f:
 WARNING:suspicious_RCU_usage
Message-ID: <20230121114904.13d6825d@gandalf.local.home>
In-Reply-To: <Y8pkFhi32XhvCVOo@hirez.programming.kicks-ass.net>
References: <202301192148.58ece903-oliver.sang@intel.com>
	<Y8llrdNT6RD/0dbq@hirez.programming.kicks-ass.net>
	<20230119112433.611fa273@gandalf.local.home>
	<Y8pkFhi32XhvCVOo@hirez.programming.kicks-ass.net>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 20 Jan 2023 10:51:18 +0100
Peter Zijlstra <peterz@infradead.org> wrote:

> > does trigger the issue, you can then bisect the functions with the script:
> > 
> >   scripts/tracing/ftrace-bisect.sh  
> 
> Pff, that all sounds like actual work :-)
> 
> Instead I did me the below hack and added my early_printk() hacks and
> that got me a usable backtrace.

Well, if you system is still running after the issue, then sure. I created
this when it would cause a triple fault reboot. In which case, there was no
real debugging output to use.

-- Steve


> 
> diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
> index 5e7ead52cfdb..7defc6e24f8f 100644
> --- a/arch/x86/kernel/ftrace.c
> +++ b/arch/x86/kernel/ftrace.c
> @@ -646,6 +646,9 @@ void prepare_ftrace_return(unsigned long ip, unsigned long *parent,
>  	if (unlikely(atomic_read(&current->tracing_graph_pause)))
>  		return;
>  
> +	if (WARN_ONCE(!rcu_is_watching(), "RCU not on for: %pS\n", (void *)ip))
> +		return;
> +
>  	bit = ftrace_test_recursion_trylock(ip, *parent);
>  	if (bit < 0)
>  		return;

