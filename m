Content-Type: multipart/mixed; boundary="===============5597502885198022188=="
MIME-Version: 1.0
From: Jet Chen <jet.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [sched, rcu] 9234566d3a3: +1.6% will-it-scale.scalability, +1302.6% time.involuntary_context_switches
Date: Tue, 22 Apr 2014 10:41:12 +0800
Message-ID: <5355D6C8.7080200@intel.com>
In-Reply-To: <20140422015958.GB4496@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5597502885198022188==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 04/22/2014 09:59 AM, Paul E. McKenney wrote:
> On Mon, Apr 21, 2014 at 02:28:21PM +0800, Jet Chen wrote:
>> Hi Paul,
>>
>> we noticed the below changes on
>> git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git tort=
ure.2014.04.18a
>> commit 9234566d3a36c0aead8852e3c2ca94cd8ebfe219 ("sched,rcu: Make cond_r=
esched() report RCU quiescent states")
>
> My impression of these statistics is that this commit results in huge
> numbers of additional context switches and interrupts, but has a slightly
> positive effect on performance and a larger negative effect on
> scalability.
>
> Is this a reasonable interpretation?
>
Yes, you're right.


> 							Thanx, Paul
>
>> Comparison 1 - parent commit of 9234566d3a36c0aead8852e3c2ca94cd8ebfe219=
 vs 9234566d3a36c0aead8852e3c2ca94cd8ebfe219
>>
>> e119454e74a852f  9234566d3a36c0aead8852e3c
>> ---------------  -------------------------
>>      1035948 ~ 0%      +1.6%    1052990 ~ 0%  TOTAL will-it-scale.per_th=
read_ops
>>      1271322 ~ 0%      +1.8%    1294004 ~ 0%  TOTAL will-it-scale.per_pr=
ocess_ops
>>         0.63 ~ 0%      -5.2%       0.60 ~ 0%  TOTAL will-it-scale.scalab=
ility
>>        22470 ~ 2%   +1302.6%     315168 ~ 2%  TOTAL time.involuntary_con=
text_switches
>>        84265 ~ 5%   +1047.1%     966581 ~ 1%  TOTAL interrupts.IWI
>>         1828 ~44%    +189.6%       5295 ~13%  TOTAL time.voluntary_conte=
xt_switches
>>         5337 ~ 1%     +82.1%       9720 ~ 1%  TOTAL vmstat.system.cs
>>       118599 ~ 0%     -30.4%      82545 ~ 0%  TOTAL interrupts.0:IO-APIC=
-edge.timer
>>       224021 ~ 4%     +34.7%     301858 ~ 2%  TOTAL interrupts.RES
>>        25148 ~ 0%      +7.0%      26917 ~ 0%  TOTAL vmstat.system.in
>>      7063439 ~ 0%      -5.2%    6694536 ~ 0%  TOTAL interrupts.LOC
>>       188866 ~ 0%      -3.1%     183008 ~ 0%  TOTAL interrupts.NMI
>>       188866 ~ 0%      -3.1%     183008 ~ 0%  TOTAL interrupts.PMI
>>         3720 ~ 0%      -1.5%       3665 ~ 0%  TOTAL time.system_time
>>         1215 ~ 0%      -1.4%       1198 ~ 0%  TOTAL time.percent_of_cpu_=
this_job_got
>>
>>
>> Comparison 2 - b84c4e08143c98dad4b4d139f08db0b98b0d3ec4 vs 9234566d3a36c=
0aead8852e3c2ca94cd8ebfe219
>>
>> Fengguang has reported stats changes about b84c4e08143c98dad4b4d139f08db=
0b98b0d3ec4 to you days ago.
>> git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.=
2014.04.14a
>> commit b84c4e08143c98dad4b4d139f08db0b98b0d3ec4 ("sched,rcu: Make cond_r=
esched() report RCU quiescent states")
>>
>> Let's have a compare here.
>>
>> b84c4e08143c98d  9234566d3a36c0aead8852e3c
>> ---------------  -------------------------
>>       809309 ~ 0%      -2.6%     788400 ~ 0%  TOTAL will-it-scale.per_pr=
ocess_ops
>>         0.61 ~ 0%      -1.9%       0.60 ~ 0%  TOTAL will-it-scale.scalab=
ility
>>       434080 ~ 0%      -1.5%     427643 ~ 0%  TOTAL will-it-scale.per_th=
read_ops
>>            4 ~11%  +1.2e+05%       5249 ~ 2%  TOTAL interrupts.IWI
>>          607 ~ 7%     +28.0%        778 ~14%  TOTAL interrupts.47:PCI-MS=
I-edge.eth0
>>        12349 ~ 2%     -14.6%      10548 ~ 1%  TOTAL interrupts.0:IO-APIC=
-edge.timer
>>         3078 ~ 3%     +20.9%       3722 ~ 6%  TOTAL interrupts.RES
>>
>>
>> Comparison 3 - parent commit of b84c4e08143c98dad4b4d139f08db0b98b0d3ec4=
 vs b84c4e08143c98dad4b4d139f08db0b98b0d3ec4
>>
>> Duplicated with Fengguang's report. Help you to see these info in a page=
 :)
>>
>> ad86a04266f9b49  b84c4e08143c98dad4b4d139f
>> ---------------  -------------------------
>>       676264 ~ 0%      +3.3%     698461 ~ 0%  TOTAL will-it-scale.per_th=
read_ops
>>      1174547 ~ 0%      +3.0%    1209307 ~ 0%  TOTAL will-it-scale.per_pr=
ocess_ops
>>         1.67 ~ 0%      -2.3%       1.63 ~ 0%  TOTAL will-it-scale.scalab=
ility
>>        10522 ~ 2%    +921.2%     107463 ~ 1%  TOTAL time.involuntary_con=
text_switches
>>        77671 ~ 3%     +67.0%     129688 ~ 3%  TOTAL interrupts.RES
>>        99502 ~ 0%     -27.8%      71813 ~ 0%  TOTAL interrupts.0:IO-APIC=
-edge.timer
>>         2554 ~ 0%     +49.1%       3809 ~ 1%  TOTAL vmstat.system.cs
>>        11524 ~ 0%      -2.3%      11259 ~ 0%  TOTAL vmstat.system.in
>>          213 ~ 0%      -4.3%        204 ~ 0%  TOTAL time.system_time
>>           74 ~ 0%      -4.1%         71 ~ 0%  TOTAL time.percent_of_cpu_=
this_job_got
>>      3495099 ~ 0%      -3.1%    3387173 ~ 0%  TOTAL interrupts.LOC
>>
>>
>>
>>
>> Thanks,
>> Jet
>>
>>
>>
>
>> ./runtest.py open2 32 1 4 6 8
>>
>>
>

--===============5597502885198022188==--

