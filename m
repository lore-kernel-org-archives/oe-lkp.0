Content-Type: multipart/mixed; boundary="===============2533587953761176117=="
MIME-Version: 1.0
From: Nadav Amit <namit@vmware.com>
To: lkp@lists.01.org
Subject: Re: [x86/mm/tlb] 6035152d8e: will-it-scale.per_thread_ops -13.2% regression
Date: Thu, 17 Mar 2022 19:02:32 +0000
Message-ID: <3B958B13-75F0-4B81-B8CF-99CD140436EB@vmware.com>
In-Reply-To: <c85ae95a-6603-ca0d-a653-b3f2f7069e20@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2533587953761176117==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> On Mar 17, 2022, at 11:38 AM, Dave Hansen <dave.hansen@intel.com> wrote:
> =

> On 3/17/22 02:04, kernel test robot wrote:
>> FYI, we noticed a -13.2% regression of will-it-scale.per_thread_ops due =
to commit:
> ...
>> commit: 6035152d8eebe16a5bb60398d3e05dc7799067b0 ("x86/mm/tlb: Open-code=
 on_each_cpu_cond_mask() for tlb_is_not_lazy()")
>> https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.=
kernel.org%2Fcgit%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git&amp;data=3D=
04%7C01%7Cnamit%40vmware.com%7Cc958c9b39db94b6b78bc08da084564df%7Cb39138ca3=
cee4b4aa4d6cd83d9dd62f0%7C0%7C0%7C637831391403951050%7CUnknown%7CTWFpbGZsb3=
d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000=
&amp;sdata=3DNSCrUK12AX5BtehaNZmPXIpirVtDOrllgUct1mqglO8%3D&amp;reserved=3D=
0 master
> ...
>>     24.77 =C2=B1  2%      +8.1       32.86 =C2=B1  3%  perf-profile.self=
.cycles-pp.llist_add_batch
> =

> =

> tl;dr: This commit made the tlb_is_not_lazy() check happen earlier.
> That earlier check can miss threads _going_ lazy because if mmap_lock
> contention.  Fewer lazy threads means more IPIs and lower performance.
> =

> =3D=3D=3D
> =

> There's a lot of noise in that profile, but I filtered most of it out.
> The main thing is that, somehow the llist_add() in
> smp_call_function_many_cond() got more expensive.  Either we're doing
> more of them or the cacheline is bouncing around more.
> =

> Turns out that we're sending *more* IPIs with this patch applied than
> without.  That shouldn't happen since the old code did the same exact
> logical check:
> =

> 	if (cond_func && !cond_func(cpu, info))
>        	continue;
> =

> and the new code does:
> =

> 	if (tlb_is_not_lazy(cpu))
> 		...
> =

> where cond_func=3D=3Dtlb_is_not_lazy.
> =

> So, what's the difference?  Timing.  With the old scheme, if a CPU
> enters lazy mode between native_flush_tlb_others() and
> the loop in smp_call_function_many_cond(), it won't get an IPI and won't
> need to do the llist_add().
> =

> I stuck some printk()s in there and can confirm that the
> earlier-calculated mask always seems to have more bits set, at least
> when running will-it-scale tests that induce TLB flush IPIs.
> =

> I was kinda surprised that there were so many threads going idle with a
> cpu-eating micro like this.  But, it makes sense since they're
> contending on mmap_lock.  Basically, since TLB-flushing operations like
> mmap() hold mmap_lock for write they tend to *force* other threads into
> idle.  Idle threads are lazy and they tend to _become_ lazy around the
> time that the flushing starts.
> =

> This new "early lazy check" behavior could theoretically work both ways.
> If threads tended to be waking up from idle when TLB flushes were being
> sent, this would tend to reduce the number of IPIs.  But, since they
> tend to be going to sleep it increases the number of IPIs.
> =

> Anybody have a better theory?  I think we should probably revert the comm=
it.

Let=E2=80=99s get back to the motivation behind this patch.

Originally we had an indirect branch that on system which are
vulnerable to Spectre v2 translates into a retpoline.

So I would not paraphrase this patch purpose as =E2=80=9Cearly lazy check=
=E2=80=9D
but instead =E2=80=9Cmore efficient lazy check=E2=80=9D. There is very litt=
le code
that was executed between the call to on_each_cpu_cond_mask() and
the actual check of tlb_is_not_lazy(). So what it seems to happen
in this test-case - according to what you say - is that *slower*
checks of is-lazy allows to send fewer IPIs since some cores go
into idle-state.

Was this test run with retpolines? If there is a difference in
performance without retpoline - I am probably wrong.

Otherwise, I do not see why this patch should be removed. We can
just as well add a busy-wait loop to tlb_is_not_lazy() to get the
same effect=E2=80=A6


--===============2533587953761176117==--

