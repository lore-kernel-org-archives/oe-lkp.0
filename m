Content-Type: multipart/mixed; boundary="===============2118194004771050786=="
MIME-Version: 1.0
From: Xin Long <lucien.xin@gmail.com>
To: lkp@lists.01.org
Subject: Re: [sctp] a6c2f79287: netperf.Throughput_Mbps -37.2% regression
Date: Tue, 16 Aug 2016 16:02:18 +0800
Message-ID: <CADvbK_cy+EW228-_R9rDu2Bkt2VSNmVwCYsHEv6KPB8YarNRiA@mail.gmail.com>
In-Reply-To: <20160808021031.GA17837@aaronlu.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2118194004771050786==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

>
> I'm testing on Linus' master, can we all use that please?
>

[git] git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

[mechine]
Intel(R) Xeon(R) CPU E5-2690 v2 @ 3.00GHz
mem 62G (66000220K)

[system]
# cat /etc/redhat-release
Red Hat Enterprise Linux Server release 7.3 Beta (Maipo)

[commit 3684b03]
[root(a)hp-dl380pg8-11 lxin]# uname -r
4.8.0-rc2.3684b03
[root(a)hp-dl380pg8-11 lxin]# cat test.sh
killall -0 netserver || netserver -4 &
netperf -4 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K -H 127.0.0.1
[root(a)hp-dl380pg8-11 lxin]# sh test.sh
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to
127.0.0.1 () port 0 AF_INET
Recv   Send    Send                          Utilization       Service Dema=
nd
Socket Socket  Message  Elapsed              Send     Recv     Send    Recv
Size   Size    Size     Time     Throughput  local    remote   local   remo=
te
bytes  bytes   bytes    secs.    10^6bits/s  % S      % S      us/KB   us/KB

212992 212992  10240    300.00     16914.99   3.28     3.28     0.636   0.6=
36

[commit f959fb4]
[root(a)localhost lxin]# uname -r
4.7.0-rc6.f959fb4
[root(a)localhost lxin]# cat test.sh
killall -0 netserver || netserver -4 &
netperf -4 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K -H 127.0.0.1
[root(a)localhost lxin]# sh test.sh
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to
127.0.0.1 () port 0 AF_INET
Recv   Send    Send                          Utilization       Service Dema=
nd
Socket Socket  Message  Elapsed              Send     Recv     Send    Recv
Size   Size    Size     Time     Throughput  local    remote   local   remo=
te
bytes  bytes   bytes    secs.    10^6bits/s  % S      % S      us/KB   us/KB

212992 212992  10240    300.00     12975.32   3.35     3.35     0.847   0.8=
46


Still, in my env, the latest kernel is better than old one.
Sorry, I'm not sure why it's so different in your env.

Could you do 'netperf' test manually, instead of lkp-tests, then check agai=
n.
Pls show you system's distros as well, like rhel, ubuntu or arch ?

--===============2118194004771050786==--

