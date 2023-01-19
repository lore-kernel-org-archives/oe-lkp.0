Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54D6A935
	for <oe-lkp@lists.linux.dev>; Thu, 19 Jan 2023 16:24:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A06A1C433EF;
	Thu, 19 Jan 2023 16:24:36 +0000 (UTC)
Date: Thu, 19 Jan 2023 11:24:33 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
 lkp@intel.com, linux-kernel@vger.kernel.org, x86@kernel.org, Ingo Molnar
 <mingo@kernel.org>, linux-trace-kernel@vger.kernel.org
Subject: Re: [tip:sched/core] [tracing, hardirq]  9aedeaed6f:
 WARNING:suspicious_RCU_usage
Message-ID: <20230119112433.611fa273@gandalf.local.home>
In-Reply-To: <Y8llrdNT6RD/0dbq@hirez.programming.kicks-ass.net>
References: <202301192148.58ece903-oliver.sang@intel.com>
	<Y8llrdNT6RD/0dbq@hirez.programming.kicks-ass.net>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 19 Jan 2023 16:45:49 +0100
Peter Zijlstra <peterz@infradead.org> wrote:

> Steve, what's the easiest way to figure out what triggers this? Put a
> printk() in prepare_ftrace_return() or so?

Does it only trigger if all functions are enabled when running function
graph tracer?

That is, if you just trace one function, say "schedule" does it
have an issue?

 trace-cmd start -p function_graph -l schedule

And then run your code, and it doesn't trigger, but:


 trace-cmd reset # make sure schedule is no longer filtered
 trace-cmd start -p function_graph

does trigger the issue, you can then bisect the functions with the script:

  scripts/tracing/ftrace-bisect.sh

in the kernel tree.

I need to update this script, because I've optimized it with the "number"
trick. That is, instead echoing in the names of functions, you echo in the
location of were they exist in the available_filter_functions file.

That is: echo 5 > set_ftrace_filter

Will enable the fifth function in available_filter_functions. The reason
for this is because this is an O(1) operation. And echoing in thousands of
these numbers is an O(n) operation where n is the number of functions you
echo in. But by doing it via names, its an O(n*m) operation, where m is the
number of *all* functions, and this can take several minutes to complete,
were as the "number" version usually takes less than a second.

Here's what you can do (ignore the instructions in the script, as that
needs to be updated):

 # cd /sys/kernel/tracing
 # seq `wc -l available_filter_functions | cut -d' ' -f1` > ~/full-file
 # /path/to/ftrace-bisect ~/full-file ~/test-file ~/non-test-file
 # cat ~/test-file > set_ftrace_filter

run your tests. If they don't fail (bisect good), then, you can assume that
the bad function is in ~/non-test-file

 # /path/to/ftrace-bisect ~/non-test-file ~/test-file.1 ~/non-test-file.1

And repeat:

 # cat ~/test-file.1 > set_ftrace_filter

I suggest appending the ".1", ".2", etc, in case something goes wrong and
you want to go back (basically a bisect log).

If the test fails, then you use the first file:

 # /path/to/ftrace-bisect ~/test-file.1 ~/test-file.2 ~/non-test-file.2

Keep going until you find a single function that causes the issue.

Always cat the "test-file*" into the set_ftrace_filter.

If it works use the "non-test-file*" for the next iteration. If it fails,
use the "test-file*" for the next iteration.

-- Steve
