Content-Type: multipart/mixed; boundary="===============7928465371454588425=="
MIME-Version: 1.0
From: Xin Long <lucien.xin@gmail.com>
To: lkp@lists.01.org
Subject: Re: [sctp] a6c2f79287: netperf.Throughput_Mbps -37.2% regression
Date: Thu, 28 Jul 2016 15:01:36 +0800
Message-ID: <CADvbK_fA=cLGz94Gd1BhR7JCHY7nzjsj7KNUfgV8d-+HqknDmA@mail.gmail.com>
In-Reply-To: <20160727015425.GL21454@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============7928465371454588425==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 27, 2016 at 9:54 AM, kernel test robot
<xiaolong.ye@intel.com> wrote:
>
> FYI, we noticed a -37.2% regression of netperf.Throughput_Mbps due to com=
mit:
>
> commit a6c2f792873aff332a4689717c3cd6104f46684c ("sctp: implement prsctp =
TTL policy")
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>
> in testcase: netperf
> on test machine: 4 threads Ivy Bridge with 8G memory
> with following parameters:
>
>         ip: ipv4
>         runtime: 300s
>         nr_threads: 200%
>         cluster: cs-localhost
>         send_size: 10K
>         test: SCTP_STREAM_MANY
>         cpufreq_governor: performance
>
>
>
> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
>
It doesn't make much sense to me. the codes I added cannot be
triggered without enable any pr policies. and I also did the tests in
my local environment,  the result looks normal to me compare to
prior version.

Recently the sctp performance is not stable,  as during these patches,
netperf cannot get the result, but return ENOTCONN. which may
also affect the testing. anyway we've fixed the -ENOTCONN issue
already in the latest version.

--===============7928465371454588425==--

