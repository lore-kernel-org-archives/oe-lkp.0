Content-Type: multipart/mixed; boundary="===============6815240672232285896=="
MIME-Version: 1.0
From: Xin Long <lucien.xin@gmail.com>
To: lkp@lists.01.org
Subject: Re: [sctp] a6c2f79287: netperf.Throughput_Mbps -37.2% regression
Date: Fri, 05 Aug 2016 19:53:38 +0800
Message-ID: <CADvbK_cRe5vjpaxuJAy7MNhA13BKhQRvOFuVufkxX_XCJa_3qg@mail.gmail.com>
In-Reply-To: <20160805033109.GA28539@aaronlu.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6815240672232285896==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

>> It doesn't make much sense to me. the codes I added cannot be
>> triggered without enable any pr policies. and I also did the tests in
>
> It seems these pr policies has to be turned on by user space, i.e.
> netperf in this case?
>
> I checked netperf's source code, it doesn't seem set any option
> related to SCTP PR POLICY but I'm new to network code so I could be
> wrong or missing something.
>
>> my local environment,  the result looks normal to me compare to
>> prior version.
>
> Can you share your number?
> We run netperf like this:
> netperf -4 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K -H 127.0.0.1
> The full log of the run is attached for your reference.

Now I also changed to linux-net.git

commit 96b585267f552d4b6a28ea8bd75e5ed03deb6e71
[root(a)hp-dl388g8-08 ~]# uname -r
4.7.0.new
[root(a)hp-dl388g8-08 ~]# netperf -4 -t SCTP_STREAM_MANY -c -C -l 300 --
-m 10K -H 127.0.0.1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to
127.0.0.1 () port 0 AF_INET
Recv   Send    Send                          Utilization       Service Dema=
nd
Socket Socket  Message  Elapsed              Send     Recv     Send    Recv
Size   Size    Size     Time     Throughput  local    remote   local   remo=
te
bytes  bytes   bytes    secs.    10^6bits/s  % S      % S      us/KB   us/KB

212992 212992  10240    300.00     11814.56   4.65     4.65     0.775   0.7=
74


commit f959fb442c35f4b61fea341401b8463dd0a1b959 (just before the buggie pat=
ch)
[root(a)localhost ~]# netperf -4 -t SCTP_STREAM_MANY -c -C -l 300 -- -m
10K -H 127.0.0.1
SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to
127.0.0.1 () port 0 AF_INET
Recv   Send    Send                          Utilization       Service Dema=
nd
Socket Socket  Message  Elapsed              Send     Recv     Send    Recv
Size   Size    Size     Time     Throughput  local    remote   local   remo=
te
bytes  bytes   bytes    secs.    10^6bits/s  % S      % S      us/KB   us/KB

212992 212992  10240    300.00     9454.90   5.22     5.22     1.086   1.085


I did tests on physical machine.
did you do it on guest ?

>
>>
>> Recently the sctp performance is not stable,  as during these patches,
>> netperf cannot get the result, but return ENOTCONN. which may
>> also affect the testing. anyway we've fixed the -ENOTCONN issue
>> already in the latest version.
>
> I tested commit 96b585267f55, which is Linus' git tree HEAD on 08/03, I
> guess the fix you mentioned should already be in there? But
> unfortunately, the throughput of netperf is still at low number(we did
> the test 5 times):
> $ cat */netperf.json
> {
>   "netperf.Throughput_Mbps": [
>     2470.6974999999998
>   ]
> }{
>   "netperf.Throughput_Mbps": [
>     2486.7675
>   ]
> }{
>   "netperf.Throughput_Mbps": [
>     2478.945
>   ]
> }{
>   "netperf.Throughput_Mbps": [
>     2429.465
>   ]
> }{
>   "netperf.Throughput_Mbps": [
>     2476.9150000000004
>   ]
>
> Considering what you have said that the patch shouldn't make a
> difference, the performance drop is really confusing. Any idea what
> could be the cause? Thanks.
Now I saw your tests result against the new kernel

Could you do the same test on the kernel before the problematic commit ?

--===============6815240672232285896==--

