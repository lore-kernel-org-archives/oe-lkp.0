Content-Type: multipart/mixed; boundary="===============8322315333487967395=="
MIME-Version: 1.0
From: Dave Hansen <dave.hansen@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/modules] f2c65fb322: will-it-scale.per_process_ops -2.9% regression
Date: Fri, 19 Jul 2019 10:05:01 -0700
Message-ID: <a66f8f04-7ccc-d72a-4905-f21347c1f8e1@intel.com>
In-Reply-To: <52D013BF-9B4B-4D03-B56F-3F378E4A2BA4@vmware.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8322315333487967395==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 7/18/19 10:59 AM, Nadav Amit wrote:
> I don=E2=80=99t understand how this patch has any impact on this workload.
> =

> I ran it and set a function tracer for any function that is impacted by t=
his
> patch:
> =

>   # cd /sys/kernel/debug/tracing
>   # echo text_poke_early > set_ftrace_filter
>   # echo module_alloc >> set_ftrace_filter
>   # echo bpf_int_jit_compile >> set_ftrace_filter
>   # tail -f trace
> =

> Nothing came up. Can you please check if you see any of them invoked on y=
our
> setup? Perhaps you have some bpf filters being installed, although even t=
hen
> this is a one-time (small) overhead for each process invocation.

I think the direct map's structure changed.  I noticed the following the
0day data:

> 7298e24f904224fa f2c65fb3221adc6b73b0549fc7b =

> ---------------- --------------------------- =

>        fail:runs  %reproduction    fail:runs
>            |             |             |    =

>            :4           50%           2:4     dmesg.WARNING:at#for_ip_int=
errupt_entry/0x
>          %stddev     %change         %stddev
>              \          |                \  =

>   10541056 =C2=B1  7%     +12.1%   11820032        meminfo.DirectMap2>  2=
.909e+08           -12.0%   2.56e+08 =C2=B1  2%  perf-stat.i.iTLB-load-miss=
es
>       1876           +10.4%       2071 =C2=B1  2%  perf-stat.i.instructio=
ns-per-iTLB-miss
>       1872           +10.4%       2068 =C2=B1  2%  perf-stat.overall.inst=
ructions-per-iTLB-miss
>  2.899e+08           -12.0%  2.551e+08 =C2=B1  2%  perf-stat.ps.iTLB-load=
-misses

So something with the direct map changed as did iTLB miss behavior.

--===============8322315333487967395==--

