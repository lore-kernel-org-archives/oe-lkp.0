Content-Type: multipart/mixed; boundary="===============5877424388996690699=="
MIME-Version: 1.0
From: Aaron Lu <aaron.lu@intel.com>
To: lkp@lists.01.org
Subject: Re: [sctp] a6c2f79287: netperf.Throughput_Mbps -37.2% regression
Date: Tue, 16 Aug 2016 16:30:43 +0800
Message-ID: <614ad3e6-b231-92da-1d28-9ad3faec691a@intel.com>
In-Reply-To: <CADvbK_cy+EW228-_R9rDu2Bkt2VSNmVwCYsHEv6KPB8YarNRiA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5877424388996690699==
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
> [root(a)hp-dl380pg8-11 lxin]# sh test.sh
> SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to
> 127.0.0.1 () port 0 AF_INET
> Recv   Send    Send                          Utilization       Service De=
mand
> Socket Socket  Message  Elapsed              Send     Recv     Send    Re=
cv
> Size   Size    Size     Time     Throughput  local    remote   local   re=
mote
> bytes  bytes   bytes    secs.    10^6bits/s  % S      % S      us/KB   us=
/KB
> =

> 212992 212992  10240    300.00     16914.99   3.28     3.28     0.636   0=
.636
> =

> [commit f959fb4]
> [root(a)localhost lxin]# uname -r
> 4.7.0-rc6.f959fb4
> [root(a)localhost lxin]# cat test.sh
> killall -0 netserver || netserver -4 &
> netperf -4 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K -H 127.0.0.1
> [root(a)localhost lxin]# sh test.sh
> SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to
> 127.0.0.1 () port 0 AF_INET
> Recv   Send    Send                          Utilization       Service De=
mand
> Socket Socket  Message  Elapsed              Send     Recv     Send    Re=
cv
> Size   Size    Size     Time     Throughput  local    remote   local   re=
mote
> bytes  bytes   bytes    secs.    10^6bits/s  % S      % S      us/KB   us=
/KB
> =

> 212992 212992  10240    300.00     12975.32   3.35     3.35     0.847   0=
.846
> =

> =

> Still, in my env, the latest kernel is better than old one.
> Sorry, I'm not sure why it's so different in your env.

Could the test have anything to do with the hardware? i.e. yours is Xeon
E5-2690 while mine is IVB i3?

> =

> Could you do 'netperf' test manually, instead of lkp-tests, then check ag=
ain.

Manually test under LKP is not easy as those test machines are all doing
things automatically. But if you think that is necessary, I can do that.

> Pls show you system's distros as well, like rhel, ubuntu or arch ?

We do not use any of these distros.
The rootfs is derived from debian:
https://github.com/fengguang/reproduce-kernel-bug/blob/master/debian/debian=
-x86_64-2015-02-07.cgz

Thanks,
Aaron

--===============5877424388996690699==--

