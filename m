Content-Type: multipart/mixed; boundary="===============8967530390722239985=="
MIME-Version: 1.0
From: Aaron Lu <aaron.lu@intel.com>
To: lkp@lists.01.org
Subject: Re: [sctp] a6c2f79287: netperf.Throughput_Mbps -37.2% regression
Date: Wed, 17 Aug 2016 14:14:05 +0800
Message-ID: <20160817061405.GA5401@aaronlu.sh.intel.com>
In-Reply-To: <CADvbK_f1exO4YaPCjmBQ0MorrXB2vPMZsSSbPh=AB2-XrU3xpg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8967530390722239985==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 17, 2016 at 01:41:04PM +0800, Xin Long wrote:
> > The perf-profile data for the two commits are attached(for the case of
> > prsctp_enable=3D1, the perf-profile data doesn't get collected for the 0
> > case for some reason, I'm checking the problem now).
> >
> > The CPU gets much more idle time in the bisected commit a6c2f79287:
> >
> >     68.89%     0.70%  [kernel.kallsyms]   [k] entry_SYSCALL_64_fastpath
> >     49.32%     0.12%  [kernel.kallsyms]   [k] sys_sendmsg
> >     49.17%     0.12%  [kernel.kallsyms]   [k] __sys_sendmsg
> >     48.58%     0.22%  [kernel.kallsyms]   [k] ___sys_sendmsg
> >     46.69%     0.06%  [kernel.kallsyms]   [k] sock_sendmsg
> >     46.31%     0.16%  [kernel.kallsyms]   [k] inet_sendmsg
> >     45.90%     0.98%  [kernel.kallsyms]   [k] sctp_sendmsg
> >     29.66%     0.45%  [kernel.kallsyms]   [k] sctp_do_sm
> >     29.54%     0.23%  [kernel.kallsyms]   [k] cpu_startup_entry
> >     28.81%     0.68%  [kernel.kallsyms]   [k] sctp_cmd_interpreter.isra=
.24
> >     26.20%     0.00%  [kernel.kallsyms]   [k] start_secondary
> >     23.04%     0.09%  [kernel.kallsyms]   [k] sctp_inq_push
> >     23.03%     0.08%  [kernel.kallsyms]   [k] call_cpuidle
> >     22.94%     0.00%  [kernel.kallsyms]   [k] cpuidle_enter
> >     22.60%     0.18%  [kernel.kallsyms]   [k] cpuidle_enter_state
> >     21.99%    21.99%  [kernel.kallsyms]   [k] intel_idle
> > ... ...
> >
> > While its immediate parent commit 826d253d57 is mostly busy working:
> >
> >     98.53%     0.83%  [kernel.kallsyms]   [k] entry_SYSCALL_64_fastpath
> >     78.13%     0.12%  [kernel.kallsyms]   [k] sys_sendmsg
> >     78.03%     0.16%  [kernel.kallsyms]   [k] __sys_sendmsg
> >     77.08%     0.28%  [kernel.kallsyms]   [k] ___sys_sendmsg
> >     74.44%     0.08%  [kernel.kallsyms]   [k] sock_sendmsg
> >     73.82%     0.13%  [kernel.kallsyms]   [k] inet_sendmsg
> >     73.34%     1.44%  [kernel.kallsyms]   [k] sctp_sendmsg
> >     47.52%     0.75%  [kernel.kallsyms]   [k] sctp_do_sm
> >     46.19%     0.90%  [kernel.kallsyms]   [k] sctp_cmd_interpreter.isra=
.24
> >     37.17%     1.43%  [kernel.kallsyms]   [k] sctp_outq_flush
> >     36.93%     0.08%  [kernel.kallsyms]   [k] sctp_outq_uncork
> >     34.24%     0.15%  [kernel.kallsyms]   [k] sctp_inq_push
> > ... ...
> > No idle related function above 1%.
> >
> > Will the bisected commit make the idle possible?
> No, not at all. :)
> =

> pls help to debug as I said in the last reply.

OK, will see how to do that.

In the meantime, I just tried to reproduce on my own desktop:
Sandybridge i7-2600 CPU @ 3.40GHz and it reproduced:
$ cat 4.7.0-rc6-01198-ga6c2f792873a/0/netperf.json
{
  "netperf.Throughput_Mbps": [
   752.9450000000002
  ]
}
$ cat 4.7.0-rc6-01197-g826d253d57b1/0/netperf.json
{
  "netperf.Throughput_Mbps": [
   1068.5556249999997
  ]
}

--===============8967530390722239985==--

