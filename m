Content-Type: multipart/mixed; boundary="===============1109944424653607181=="
MIME-Version: 1.0
From: Nadav Amit <namit@vmware.com>
To: lkp@lists.01.org
Subject: Re: [x86/mm/tlb] 6035152d8e: will-it-scale.per_thread_ops -13.2% regression
Date: Thu, 17 Mar 2022 20:32:35 +0000
Message-ID: <DC37F01B-A80F-4839-B4FB-C21F64943E64@vmware.com>
In-Reply-To: <96f9b880-876f-bf4d-8eb0-9ae8bbc8df6d@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1109944424653607181==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> On Mar 17, 2022, at 12:11 PM, Dave Hansen <dave.hansen@intel.com> wrote:
> =

> On 3/17/22 12:02, Nadav Amit wrote:
>>> This new "early lazy check" behavior could theoretically work both ways.
>>> If threads tended to be waking up from idle when TLB flushes were being
>>> sent, this would tend to reduce the number of IPIs.  But, since they
>>> tend to be going to sleep it increases the number of IPIs.
>>> =

>>> Anybody have a better theory?  I think we should probably revert the co=
mmit.
>> =

>> Let=E2=80=99s get back to the motivation behind this patch.
>> =

>> Originally we had an indirect branch that on system which are
>> vulnerable to Spectre v2 translates into a retpoline.
>> =

>> So I would not paraphrase this patch purpose as =E2=80=9Cearly lazy chec=
k=E2=80=9D
>> but instead =E2=80=9Cmore efficient lazy check=E2=80=9D. There is very l=
ittle code
>> that was executed between the call to on_each_cpu_cond_mask() and
>> the actual check of tlb_is_not_lazy(). So what it seems to happen
>> in this test-case - according to what you say - is that *slower*
>> checks of is-lazy allows to send fewer IPIs since some cores go
>> into idle-state.
>> =

>> Was this test run with retpolines? If there is a difference in
>> performance without retpoline - I am probably wrong.
> =

> Nope, no retpolines:

Err..

> =

>> /sys/devices/system/cpu/vulnerabilities/spectre_v2:Mitigation: Enhanced =
IBRS, IBPB: conditional, RSB filling
> =

> which is the same situation as the "Xeon Platinum 8358" which found this
> in 0day.
> =

> Maybe the increased IPIs with this approach end up being a wash with the
> reduced retpoline overhead.
> =

> Did you have any specific performance numbers that show the benefit on
> retpoline systems?

I had profiled this thing to death at the time. I don=E2=80=99t have the nu=
mbers
with me now though. I did not run will-it-scale but a similar benchmark
that I wrote.

Another possible reason is that perhaps with this patch alone, without
subsequent patches we get some negative impact. I do not have a good
explanation, but can we rule this one out?

Can you please clarify how the bot works - did it notice a performance
regression and then started bisecting, or did it just check one patch
at a time?

I ask because I got a different report from the report that a
subsequent patch ("x86/mm/tlb: Privatize cpu_tlbstate=E2=80=9D) made a
23.3% improvement [1] for a very similar (yet different) test.

Without a good explanation, my knee-jerk reaction is that this seems
as a pathological case. I do not expect performance improvement without
retpolines, and perhaps the few cycles in which the test of is-lazy
is performed earlier matter.

I=E2=80=99m not married to this patch, but before a revert it would be good
to know why it even matters. I wonder whether you can confirm that
reverting the patch (without the rest of the series) even helps. If
it does, I=E2=80=99ll try to run some tests to understand what the heck is
going on.

[1] https://lists.ofono.org/hyperkitty/list/lkp(a)lists.01.org/thread/UTC7D=
VZX4O5DKT2WUTWBTCVQ6W5QLGFA/



--===============1109944424653607181==--

