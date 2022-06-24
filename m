Content-Type: multipart/mixed; boundary="===============2477165315388210569=="
MIME-Version: 1.0
From: Jakub Kicinski <kuba@kernel.org>
To: lkp@lists.01.org
Subject: Re: [net] 4890b686f4: netperf.Throughput_Mbps -69.4% regression
Date: Thu, 23 Jun 2022 18:57:30 -0700
Message-ID: <20220623185730.25b88096@kernel.org>
In-Reply-To: <CADvbK_eQUmb942vC+bG+NRzM1ki1LiCydEDR1AezZ35Jvsdfnw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2477165315388210569==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 23 Jun 2022 18:50:07 -0400 Xin Long wrote:
> From the perf data, we can see __sk_mem_reduce_allocated() is the one
> using CPU the most more than before, and mem_cgroup APIs are also
> called in this function. It means the mem cgroup must be enabled in
> the test env, which may explain why I couldn't reproduce it.
> =

> The Commit 4890b686f4 ("net: keep sk->sk_forward_alloc as small as
> possible") uses sk_mem_reclaim(checking reclaimable >=3D PAGE_SIZE) to
> reclaim the memory, which is *more frequent* to call
> __sk_mem_reduce_allocated() than before (checking reclaimable >=3D
> SK_RECLAIM_THRESHOLD). It might be cheap when
> mem_cgroup_sockets_enabled is false, but I'm not sure if it's still
> cheap when mem_cgroup_sockets_enabled is true.
> =

> I think SCTP netperf could trigger this, as the CPU is the bottleneck
> for SCTP netperf testing, which is more sensitive to the extra
> function calls than TCP.
> =

> Can we re-run this testing without mem cgroup enabled?

FWIW I defer to Eric, thanks a lot for double checking the report =

and digging in!
--===============2477165315388210569==--

