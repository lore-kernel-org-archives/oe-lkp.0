Content-Type: multipart/mixed; boundary="===============8358413661046984974=="
MIME-Version: 1.0
From: Aaron Lu <aaron.lu@intel.com>
To: lkp@lists.01.org
Subject: Re: [sctp] a6c2f79287: netperf.Throughput_Mbps -37.2% regression
Date: Tue, 16 Aug 2016 16:51:43 +0800
Message-ID: <6e529b10-117d-8af0-66b3-2ccfb71acf2a@intel.com>
In-Reply-To: <CADvbK_cy+EW228-_R9rDu2Bkt2VSNmVwCYsHEv6KPB8YarNRiA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8358413661046984974==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 08/16/2016 04:02 PM, Xin Long wrote:
>>
>> I'm testing on Linus' master, can we all use that please?
>>
> =

> [git] git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> =

> [mechine]
> Intel(R) Xeon(R) CPU E5-2690 v2 @ 3.00GHz
> mem 62G (66000220K)
> =

> [system]
> # cat /etc/redhat-release
> Red Hat Enterprise Linux Server release 7.3 Beta (Maipo)
> =

> [commit 3684b03]
> [root(a)hp-dl380pg8-11 lxin]# uname -r
> 4.8.0-rc2.3684b03
> [root(a)hp-dl380pg8-11 lxin]# cat test.sh
> killall -0 netserver || netserver -4 &
> netperf -4 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K -H 127.0.0.1

I just realized the test we are doing is not exactly the same.
As the original report says:
        ip: ipv4
        runtime: 300s
        nr_threads: 200%
        cluster: cs-localhost
        send_size: 10K
        test: SCTP_STREAM_MANY
        cpufreq_governor: performance

Note the nr_threads: 200%, which means to start 2 times of CPU number
processes of netperf.

In our IVB i3(2 cores, 2 threads per core) case, 8 netperf processes
are started concurrently:

2016-07-27 03:48:09 netperf -4 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K -=
H 127.0.0.1 &
2016-07-27 03:48:09 netperf -4 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K -=
H 127.0.0.1 &
2016-07-27 03:48:09 netperf -4 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K -=
H 127.0.0.1 &
2016-07-27 03:48:09 netperf -4 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K -=
H 127.0.0.1 &
2016-07-27 03:48:09 netperf -4 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K -=
H 127.0.0.1 &
2016-07-27 03:48:09 netperf -4 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K -=
H 127.0.0.1 &
2016-07-27 03:48:09 netperf -4 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K -=
H 127.0.0.1 &
2016-07-27 03:48:09 netperf -4 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K -=
H 127.0.0.1 &

The throughput is the average of those runs.

And I think we should be doing test on:
commit a6c2f79287 ("sctp: implement prsctp TTL policy") (the bisected one)
and
commit 826d253d57 ("sctp: add SCTP_PR_ASSOC_STATUS on sctp sockopt") (its i=
mmediate parent)
instead of Linus' master HEAD to avoid other factors.

Thanks,
Aaron

--===============8358413661046984974==--

