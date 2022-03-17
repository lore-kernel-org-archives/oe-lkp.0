Content-Type: multipart/mixed; boundary="===============5389162586119953584=="
MIME-Version: 1.0
From: Dave Hansen <dave.hansen@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/mm/tlb] 6035152d8e: will-it-scale.per_thread_ops -13.2% regression
Date: Thu, 17 Mar 2022 12:11:08 -0700
Message-ID: <96f9b880-876f-bf4d-8eb0-9ae8bbc8df6d@intel.com>
In-Reply-To: <3B958B13-75F0-4B81-B8CF-99CD140436EB@vmware.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5389162586119953584==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 3/17/22 12:02, Nadav Amit wrote:
>> This new "early lazy check" behavior could theoretically work both ways.
>> If threads tended to be waking up from idle when TLB flushes were being
>> sent, this would tend to reduce the number of IPIs.  But, since they
>> tend to be going to sleep it increases the number of IPIs.
>>
>> Anybody have a better theory?  I think we should probably revert the com=
mit.
> =

> Let=E2=80=99s get back to the motivation behind this patch.
> =

> Originally we had an indirect branch that on system which are
> vulnerable to Spectre v2 translates into a retpoline.
> =

> So I would not paraphrase this patch purpose as =E2=80=9Cearly lazy check=
=E2=80=9D
> but instead =E2=80=9Cmore efficient lazy check=E2=80=9D. There is very li=
ttle code
> that was executed between the call to on_each_cpu_cond_mask() and
> the actual check of tlb_is_not_lazy(). So what it seems to happen
> in this test-case - according to what you say - is that *slower*
> checks of is-lazy allows to send fewer IPIs since some cores go
> into idle-state.
> =

> Was this test run with retpolines? If there is a difference in
> performance without retpoline - I am probably wrong.

Nope, no retpolines:

> /sys/devices/system/cpu/vulnerabilities/spectre_v2:Mitigation: Enhanced I=
BRS, IBPB: conditional, RSB filling

which is the same situation as the "Xeon Platinum 8358" which found this
in 0day.

Maybe the increased IPIs with this approach end up being a wash with the
reduced retpoline overhead.

Did you have any specific performance numbers that show the benefit on
retpoline systems?
--===============5389162586119953584==--

