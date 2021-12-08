Content-Type: multipart/mixed; boundary="===============4474729921022207385=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [x86/signal] 3aac3ebea0: will-it-scale.per_thread_ops -11.9% regression
Date: Wed, 08 Dec 2021 20:14:38 +0100
Message-ID: <874k7i29k1.ffs@tglx>
In-Reply-To: <c94b8394-08cd-8273-2cd5-1ee5880d4c36@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4474729921022207385==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 08 2021 at 10:20, Dave Hansen wrote:
> On 12/8/21 10:00 AM, Bae, Chang Seok wrote:
>> diff --git a/kernel/signal.c b/kernel/signal.c
>> index a629b11bf3e0..8194d2f38bf1 100644
>> --- a/kernel/signal.c
>> +++ b/kernel/signal.c
>> @@ -4224,6 +4224,11 @@ int restore_altstack(const stack_t __user *uss)
>>         stack_t new;
>>         if (copy_from_user(&new, uss, sizeof(stack_t)))
>>                 return -EFAULT;
>> +       if (current->sas_ss_sp =3D=3D (unsigned long) new.ss_sp &&
>> +           current->sas_ss_size =3D=3D new.ss_size &&
>> +           current->sas_ss_flags =3D=3D new.ss_flags)
>> +               return 0;
>> +
>>         (void)do_sigaltstack(&new, NULL, current_user_stack_pointer(),
>>                              MINSIGSTKSZ);
>>         /* squash all but EFAULT for now */
>
> This seems like a generally good optimization that could go in
> do_sigaltstack() itself, no?
>
> Either way, it seems like 0day botched this a bit.  '3aac3ebea0' wasn't
> the actual culprit, it was the patch before.

The patch it pointed to was the one which enabled that config switch.
--===============4474729921022207385==--

