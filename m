Content-Type: multipart/mixed; boundary="===============0658385626261639879=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [inet/connection_sock] 59f379f904: netperf.Throughput_Mbps 91.5% improvement
Date: Mon, 23 Oct 2017 00:58:33 -0700
Message-ID: <CAGXu5jKv0TqVM=6grOpf07QT9zjA5SV1mE64FVe1-sPt4gNgxw@mail.gmail.com>
In-Reply-To: <20171023051609.GD12058@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============0658385626261639879==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This seems unlikely... was the base benchmark broken?

-Kees

On Sun, Oct 22, 2017 at 10:16 PM, kernel test robot
<xiaolong.ye@intel.com> wrote:
>
> Greeting,
>
> FYI, we noticed a 91.5% improvement of netperf.Throughput_Mbps due to com=
mit:
>
>
> commit: 59f379f9046a9e0532ffd19b44e3c32fe79ec51b ("inet/connection_sock: =
Convert timers to use timer_setup()")
> git://internal_merge_and_test_tree devel-catchup-201710182111
>
> in testcase: netperf
> on test machine: qemu-system-x86_64 -enable-kvm -cpu host -smp 2 -m 4G
> with following parameters:
>
>         ip: ipv4
>         runtime: 300s
>         nr_threads: 1
>         cluster: cs-localhost
>         test: UDP_STREAM
>
> test-description: Netperf is a benchmark that can be use to measure vario=
us aspect of networking performance.
> test-url: http://www.netperf.org/netperf/
>
>
>
> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
>
>
> To reproduce:
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script  # job-script is attached in=
 this email
>
> testcase/path_params/tbox_group/run: netperf/ipv4-300s-1-cs-localhost-UDP=
_STREAM/vm-lkp-nex04-4G
>
> a92c5751b97cca55  59f379f9046a9e0532ffd19b44
> ----------------  --------------------------
>          %stddev      change         %stddev
>              \          |                \
>       7959 =C4=85 11%        92%      15243        netperf.Throughput_Mbps
>        262               5%        276        netperf.time.system_time
>         87               5%         92        netperf.time.percent_of_cpu=
_this_job_got
>        301                         303        netperf.time.elapsed_time
>        301                         303        netperf.time.elapsed_time.m=
ax
>
>
> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
>
>
> Thanks,
> Xiaolong



-- =

Kees Cook
Pixel Security

--===============0658385626261639879==--

