Content-Type: multipart/mixed; boundary="===============7325376582471806689=="
MIME-Version: 1.0
From: David Rientjes <rientjes@google.com>
To: lkp@lists.01.org
Subject: Re: [scheduler] BUG: unable to handle kernel paging request at 000000000000d110
Date: Wed, 30 Jul 2014 16:44:29 -0700
Message-ID: <alpine.DEB.2.02.1407301643480.26444@chino.kir.corp.google.com>
In-Reply-To: <20140730135853.GL16537@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============7325376582471806689==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 30 Jul 2014, Fengguang Wu wrote:

> =

> Hi Christoph,
> =

> The parent commit is clean in this case.
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/tj/percpu.git for-3.17-cons=
istent-ops
> commit 9b0c63851edaf54e909475fe2a0946f57810e98a
> Author:     Christoph Lameter <cl@linux.com>
> AuthorDate: Fri Jun 20 14:31:18 2014 -0500
> Commit:     Tejun Heo <tj@kernel.org>
> CommitDate: Fri Jul 18 19:21:39 2014 -0400
> =

>     scheduler: Replace __get_cpu_var with this_cpu_ptr
>     =

>     Convert all uses of __get_cpu_var for address calculation to use
>     this_cpu_ptr instead.
>     =

>     Cc: Peter Zijlstra <peterz@infradead.org>
>     Acked-by: Ingo Molnar <mingo@kernel.org>
>     Signed-off-by: Christoph Lameter <cl@linux.com>
>     Signed-off-by: Tejun Heo <tj@kernel.org>

All the instances in kernel/sched/* should be of the form =

*this_cpu_ptr(&mask) due to the special handling of struct cpumask *, =

correct?

--===============7325376582471806689==--

