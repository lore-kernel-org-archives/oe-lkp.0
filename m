Content-Type: multipart/mixed; boundary="===============4386279511985460227=="
MIME-Version: 1.0
From: Xing, Zhengjun <zhengjun.xing@intel.com>
To: lkp@lists.01.org
Subject: Re: [sched/fair] c722f35b51: tbench.throughput-MB/sec -29.1% regression
Date: Fri, 03 Sep 2021 15:22:43 +0800
Message-ID: <304055ef-0c04-676b-3ed2-2b0cd0fe6d0b@intel.com>
In-Reply-To: <ed06ccf4ddb98ec9c31d30d5f92f637bdb890326.camel@surriel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4386279511985460227==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Rik,

 =C2=A0=C2=A0=C2=A0 Do you have time to look at this? I re-test it in v5.13=
 and v5.14, =

the regression still existed. Thanks.

On 5/27/2021 10:00 AM, Rik van Riel wrote:
> Hello,
>
> I will try to take a look at this on Friday.
>
> However, even if I manage to reproduce it on one of
> the systems I have access to, I'm still not sure how
> exactly we would root cause the issue.
>
> Is it due to
> select_idle_sibling() doing a little bit
> more work?
>
> Is it because we invoke test_idle_cores() a little
> earlier, widening the race window with CPUs going idle,
> causing select_idle_cpu to do a lot more work?
>
> Is it a locality thing where random placement on any
> core in the LLC is somehow better than placement on
> the same core as "prev" when there is no idle core?
>
> Is it tbench running
> faster when the woken up task is
> placed on the runqueue behind the current task on the
> "target" cpu, even though that CPU isn't currently
> idle, because tbench happens to go to sleep fast?
>
> In other words, I'm
> not quite sure whether this is
> a tbench (and other similar benchmark) specific thing,
> or a kernel thing, or what instrumentation we would
> want in select_idle_sibling / select_idle_cpu for us
> to root cause issues like this more easily in the
> future...

-- =

Zhengjun Xing

--===============4386279511985460227==--

