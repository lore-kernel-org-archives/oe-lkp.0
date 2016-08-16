Content-Type: multipart/mixed; boundary="===============6616904143045321352=="
MIME-Version: 1.0
From: Aaron Lu <aaron.lu@intel.com>
To: lkp@lists.01.org
Subject: Re: [sctp] a6c2f79287: netperf.Throughput_Mbps -37.2% regression
Date: Tue, 16 Aug 2016 10:38:31 +0800
Message-ID: <40242f99-adce-752b-0859-d702a614bc5e@intel.com>
In-Reply-To: <20160808021031.GA17837@aaronlu.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6616904143045321352==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Any update on this, Long?

Regards,
Aaron

On 08/08/2016 10:10 AM, Aaron Lu wrote:
> On Fri, Aug 05, 2016 at 07:53:38PM +0800, Xin Long wrote:
>>>> It doesn't make much sense to me. the codes I added cannot be
>>>> triggered without enable any pr policies. and I also did the tests in
>>>
>>> It seems these pr policies has to be turned on by user space, i.e.
>>> netperf in this case?
>>>
>>> I checked netperf's source code, it doesn't seem set any option
>>> related to SCTP PR POLICY but I'm new to network code so I could be
>>> wrong or missing something.
>>>
>>>> my local environment,  the result looks normal to me compare to
>>>> prior version.
>>>
>>> Can you share your number?
>>> We run netperf like this:
>>> netperf -4 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K -H 127.0.0.1
>>> The full log of the run is attached for your reference.
>>
>> Now I also changed to linux-net.git
>>
>> commit 96b585267f552d4b6a28ea8bd75e5ed03deb6e71
>> [root(a)hp-dl388g8-08 ~]# uname -r
>> 4.7.0.new
>> [root(a)hp-dl388g8-08 ~]# netperf -4 -t SCTP_STREAM_MANY -c -C -l 300 --
>> -m 10K -H 127.0.0.1
>> SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to
>> 127.0.0.1 () port 0 AF_INET
>> Recv   Send    Send                          Utilization       Service D=
emand
>> Socket Socket  Message  Elapsed              Send     Recv     Send    R=
ecv
>> Size   Size    Size     Time     Throughput  local    remote   local   r=
emote
>> bytes  bytes   bytes    secs.    10^6bits/s  % S      % S      us/KB   u=
s/KB
>>
>> 212992 212992  10240    300.00     11814.56   4.65     4.65     0.775   =
0.774
>>
>>
>> commit f959fb442c35f4b61fea341401b8463dd0a1b959 (just before the buggie =
patch)
> =

> I'm testing on Linus' master, can we all use that please?
> =

>> [root(a)localhost ~]# netperf -4 -t SCTP_STREAM_MANY -c -C -l 300 -- -m
>> 10K -H 127.0.0.1
>> SCTP 1-TO-MANY STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to
>> 127.0.0.1 () port 0 AF_INET
>> Recv   Send    Send                          Utilization       Service D=
emand
>> Socket Socket  Message  Elapsed              Send     Recv     Send    R=
ecv
>> Size   Size    Size     Time     Throughput  local    remote   local   r=
emote
>> bytes  bytes   bytes    secs.    10^6bits/s  % S      % S      us/KB   u=
s/KB
>>
>> 212992 212992  10240    300.00     9454.90   5.22     5.22     1.086   1=
.085
>>
>>
>> I did tests on physical machine.
>> did you do it on guest ?
> =

> The test is done on a ivy-bridge desktop with 8G memory:
> # cpudesc : Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz
> # total memory : 8058152 kB
> =

>>
>>>
>>>>
>>>> Recently the sctp performance is not stable,  as during these patches,
>>>> netperf cannot get the result, but return ENOTCONN. which may
>>>> also affect the testing. anyway we've fixed the -ENOTCONN issue
>>>> already in the latest version.
>>>
>>> I tested commit 96b585267f55, which is Linus' git tree HEAD on 08/03, I
>>> guess the fix you mentioned should already be in there? But
>>> unfortunately, the throughput of netperf is still at low number(we did
>>> the test 5 times):
>>> $ cat */netperf.json
>>> {
>>>   "netperf.Throughput_Mbps": [
>>>     2470.6974999999998
>>>   ]
>>> }{
>>>   "netperf.Throughput_Mbps": [
>>>     2486.7675
>>>   ]
>>> }{
>>>   "netperf.Throughput_Mbps": [
>>>     2478.945
>>>   ]
>>> }{
>>>   "netperf.Throughput_Mbps": [
>>>     2429.465
>>>   ]
>>> }{
>>>   "netperf.Throughput_Mbps": [
>>>     2476.9150000000004
>>>   ]
>>>
>>> Considering what you have said that the patch shouldn't make a
>>> difference, the performance drop is really confusing. Any idea what
>>> could be the cause? Thanks.
>> Now I saw your tests result against the new kernel
>>
>> Could you do the same test on the kernel before the problematic commit ?
> =

> Yes, the throughput of its parent commit is higer enough to trigger the
> automatic bisect and then we send out the report.
> =

> Throughput of its parent commit 826d253d57b1("sctp: add SCTP_PR_ASSOC_STA=
TUS
> on sctp sockopt"):
> Average:
> "netperf.Throughput_Mbps": 3923.84375,
> =

> $ cat */netperf.json
> {
>   "netperf.Throughput_Mbps": [
>     3869.25375
>   ]
> }{
>   "netperf.Throughput_Mbps": [
>     3952.58875
>   ]
> }{
>   "netperf.Throughput_Mbps": [
>     3936.89625
>   ]
> }{
>   "netperf.Throughput_Mbps": [
>     3936.63625
>   ]
> }
> =

> Feel free to let me know if you need any more information or you want me
> to do more tests on other commits/machines, thanks.
> =

> Regards,
> Aaron
> =



--===============6616904143045321352==--

