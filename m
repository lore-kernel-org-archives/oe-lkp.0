Content-Type: multipart/mixed; boundary="===============2516995593920361046=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] 795ae7a0de: pixz.throughput -9.1% regression
Date: Mon, 06 Jun 2016 16:53:07 +0800
Message-ID: <20160606085307.GB2926@yexl-desktop>
In-Reply-To: <20160603222109.GA12579@cmpxchg.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============2516995593920361046==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 03, 2016 at 06:21:09PM -0400, Johannes Weiner wrote:
>On Thu, Jun 02, 2016 at 12:07:06PM -0400, Johannes Weiner wrote:
>> Hi,
>> =

>> On Thu, Jun 02, 2016 at 02:45:07PM +0800, kernel test robot wrote:
>> > FYI, we noticed pixz.throughput -9.1% regression due to commit:
>> > =

>> > commit 795ae7a0de6b834a0cc202aa55c190ef81496665 ("mm: scale kswapd wat=
ermarks in proportion to memory")
>> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git mas=
ter
>> > =

>> > in testcase: pixz
>> > on test machine: ivb43: 48 threads Ivytown Ivy Bridge-EP with 64G memo=
ry with following parameters: cpufreq_governor=3Dperformance/nr_threads=3D1=
00%
>> =

>> Xiaolong, thanks for the report.
>> =

>> It looks like the regression stems from a change in NUMA placement:
>
>Scratch that, I was misreading the test results. It's just fewer
>allocations in general that happen during the fixed testing time.
>
>I'm stumped by this report. All this patch does other than affect page
>reclaim (which is not involved here) is increase the size of the round
>robin batches in the fair zone allocator. That should *reduce* work in
>the page allocator, if anything.
>
>But I also keep failing to reproduce this - having tried it on the
>third machine now - neither pixz nor will-it-scale/page_fault1 give me
>that -8-9% regression:
>
>4.5.0-02574-g3ed3a4f:
>PIXZ-good.log:throughput: 39908733.604941994
>PIXZ-good.log:throughput: 37067947.25049969
>PIXZ-good.log:throughput: 38604938.39131216
>
>4.5.0-02575-g795ae7a:
> PIXZ-bad.log:throughput: 39489120.87179377
> PIXZ-bad.log:throughput: 39307299.288432725
> PIXZ-bad.log:throughput: 38795994.3329781
>
>Is this reliably reproducible with 3ed3a4f vs 795ae7a?

Yes, it can be stably reproduced in LKP environment, I've run 3ed3a4f0ddffe=
ce9 =

for 4 times, and 795ae7a0de6b834a0cc202aa55 for 7 times.

3ed3a4f0ddffece9 795ae7a0de6b834a0cc202aa55
---------------- --------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :4           50%           2:7     kmsg.Spurious_LAPIC_timer_int=
errupt_on_cpu
         %stddev     %change         %stddev
             \          |                \
  78505362 =C2=B1  0%      -9.2%   71298182 =C2=B1  0%  pixz.throughput


>
>Could I ask you to retry the test with Linus's current head as well as
>with 795ae7a reverted on top of it? (It's a clean revert.)
>

Sure, I have queued the test tasks for them, will update the comparison
once I get the results.

Thanks,
Xiaolong

>Thanks

--===============2516995593920361046==--

