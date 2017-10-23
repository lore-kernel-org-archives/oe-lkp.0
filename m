Content-Type: multipart/mixed; boundary="===============3002869306489169291=="
MIME-Version: 1.0
From: Juergen Gross <jgross@suse.com>
To: lkp@lists.01.org
Subject: Re: [locking/paravirt] 9043442b43: WARNING:at_kernel/jump_label.c:#static_key_disable_cpuslocked
Date: Mon, 23 Oct 2017 11:06:23 +0200
Message-ID: <c5978d6c-08ee-d45e-bbe0-66e601499b64@suse.com>
In-Reply-To: <20171018142159.hesobm5arrjvexoj@pd.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============3002869306489169291==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 18/10/17 16:22, Borislav Petkov wrote:
> On Thu, Oct 12, 2017 at 09:47:17AM +0200, Peter Zijlstra wrote:
>> Urgh.. I always get lost in that whole patching maze :/ Unless Juergen
>> can move it later, I think the below should also work. Moving
>> jump_label_init() before smp_prepare_boot_cpu() might not work for all
>> architectures, but it should work for x86 (and we explicitly allow for
>> archs to initialize this early).
>>
>> ---
>>  arch/x86/kernel/smpboot.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
>> index aed1460135e6..93b42d9d9d4f 100644
>> --- a/arch/x86/kernel/smpboot.c
>> +++ b/arch/x86/kernel/smpboot.c
>> @@ -1350,6 +1350,17 @@ void __init native_smp_prepare_boot_cpu(void)
>>  	/* already set me in cpu_online_mask in boot_cpu_init() */
>>  	cpumask_set_cpu(me, cpu_callout_mask);
>>  	cpu_set_state_online(me);
>> +
>> +	/*
>> +	 * native_pv_lock_init() needs jump_labels to work. Moving
>> +	 * jump_label_init() in generic code requires auditing all archs for
>> +	 * their text_poke requirements.
>> +	 *
>> +	 * The x86 version really only depends on ideal_nops[] which is
>> +	 * initialized at the end of setup_arch(). So doing an arch specific
>> +	 * early init of jump-labels here is fine.
>> +	 */
>> +	jump_label_init();
>>  	native_pv_lock_init();
>>  }
> =

> This fixes the jump_label thing I'm seeing too but it causes:
> =

> [    0.000000] ------------[ cut here ]------------
> [    0.000000] WARNING: CPU: 0 PID: 0 at arch/x86/kernel/alternative.c:71=
2 text_poke+0x214/0x220

Yeah, calling jump_label_init() before page_alloc_init() seems to be the
problem.

I guess the best solution would be to move the call of
native_pv_lock_init() after jump_label_init(). This would require a new
hook, e.g. lock_init(), to be called either from start_kernel() or maybe
from sched_init()?


Juergen

--===============3002869306489169291==--

