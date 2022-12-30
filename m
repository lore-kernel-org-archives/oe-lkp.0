Received: from smtpout.efficios.com (smtpout.efficios.com [167.114.26.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF68256D
	for <oe-lkp@lists.linux.dev>; Fri, 30 Dec 2022 13:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=efficios.com;
	s=smtpout1; t=1672407959;
	bh=ksN4+yXcEZh786ZHkB2irPN5To2fNnhab+DGw9fAu3s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=wLc4LQP54paJbC0kQ/j9785marUxFgd1EGqWEKgkdrNAExaEnmIIzaA0XTfuJIQ2D
	 g9KmKy8zGocFLZujAFVb+zd/CRaYBqeRRGQ3JlN1RsKZOzIUTc5iOqhDJ/w3zlrFKu
	 rNX/p2DXnCmotQ86e0gCZKjLh6KvaVUAGP+ngqNDMkt/oYPxNSdfDVVMP8IdaYf6pO
	 rKY/xyAR3bSUoxaaQUSaHn3jd9s5ouNKcSH+gpPrlrnAz4Q55U66NZswZNAGZYnAGC
	 4u5Fq4xsH9mENNRomL2yC8rBXQdOI73nicxfD0EgxQ+7Kb7RO/WzqPoyCAjuDsnJNF
	 iiW68p6hFgW0Q==
Received: from [10.1.0.205] (192-222-188-97.qc.cable.ebox.net [192.222.188.97])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4Nk63V66mxzcp5;
	Fri, 30 Dec 2022 08:45:58 -0500 (EST)
Message-ID: <fb7343a9-dc48-52f6-e899-d0283046a011@efficios.com>
Date: Fri, 30 Dec 2022 08:46:25 -0500
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [tip:sched/core] [sched] af7f588d8f:
 WARNING:at_kernel/sched/core.c:#sched_mm_cid_after_execve
Content-Language: en-US
To: kernel test robot <yujie.liu@intel.com>,
 Peter Zijlstra <peterz@infradead.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
 x86@kernel.org, linux-mm@kvack.org
References: <202212301353.5c959d72-yujie.liu@intel.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
In-Reply-To: <202212301353.5c959d72-yujie.liu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022-12-30 01:48, kernel test robot wrote:
> Greeting,
> 
> FYI, we noticed WARNING:at_kernel/sched/core.c:#sched_mm_cid_after_execve due to commit (built with gcc-11):
> 
[...]

> [ 17.747520][ T48] bprm_execve (exec.c:?)
> [ 17.748358][ T48] ? call_usermodehelper_exec_work (umh.c:?)
> [ 17.749462][ T48] kernel_execve (??:?)
> [ 17.750332][ T48] call_usermodehelper_exec_async (umh.c:?)
> [ 17.751363][ T48] ? call_usermodehelper_exec_work (umh.c:?)
> [ 17.752163][ T48] ret_from_fork (??:?)

I suspect this check:

void sched_mm_cid_after_execve(struct task_struct *t)
{
         struct mm_struct *mm = t->mm;
         unsigned long flags;

         WARN_ON_ONCE((t->flags & PF_KTHREAD) || !t->mm);

is too strict. AFAIU the usermodehelper thread is a kernel thread, which 
happens to have a non-NULL mm after execve. We want to allow 
usermodehelper threads to use rseq, so I think the appropriate approach 
here would be to just warn if !t->mm:

         WARN_ON_ONCE(!t->mm);

We should probably apply a similar change to the warning in 
sched_mm_cid_fork() as well.

Thoughts ?

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com

