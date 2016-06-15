Content-Type: multipart/mixed; boundary="===============5434984243179818963=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@amacapital.net>
To: lkp@lists.01.org
Subject: Re: [x86] 5ac0c41bf3: WARNING: CPU: 0 PID: 0 at arch/x86/mm/extable.c:50 ex_handler_rdmsr_unsafe
Date: Wed, 15 Jun 2016 10:55:34 -0700
Message-ID: <CALCETrVcw+t+w0T6FmXffY3Y=XHUpA0JUgzzPOyKybHXyOPa+Q@mail.gmail.com>
In-Reply-To: <20160615175052.GE30309@pd.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============5434984243179818963==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 15, 2016 at 10:50 AM, Borislav Petkov <bp@alien8.de> wrote:
> On Wed, Jun 15, 2016 at 10:23:39AM -0700, Andy Lutomirski wrote:
>> Did the "Call Trace" not show up?
>
> It did, but it is bollocks too:
>
> [    0.020003] ------------[ cut here ]------------
> [    0.024009] WARNING: CPU: 0 PID: 0 at arch/x86/mm/extable.c:50 ex_hand=
ler_rdmsr_unsafe+0x6f/0x80
> [    0.026455] unchecked MSR access error: RDMSR from 0x1b0 at rIP: 0xfff=
fffff81026d9f
> [    0.028008] Modules linked in:
> [    0.032008] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 4.7.0-rc3+ #26
> [    0.035185] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.7.5-20140531_083030-gandalf 04/01/2014
> [    0.036000]  0000000000000000 ffffffff81c03d20 ffffffff81298b65 ffffff=
ff81c03d70
> [    0.036000]  0000000000000000 ffffffff81c03d60 ffffffff81050fdb 000000=
3200000001
> [    0.036000]  ffffffff81c03e38 ffffffff816691a0 0000000000000000 ffffff=
ff81d662e0
> [    0.036000] Call Trace:
> [    0.036000]  [<ffffffff81298b65>] dump_stack+0x67/0x92
> [    0.036000]  [<ffffffff81050fdb>] __warn+0xcb/0xf0
> [    0.036000]  [<ffffffff8105104f>] warn_slowpath_fmt+0x4f/0x60
> [    0.036000]  [<ffffffff81026d9f>] ? init_intel_energy_perf.part.3+0xf/=
0xd0
> [    0.036000]  [<ffffffff810448ef>] ex_handler_rdmsr_unsafe+0x6f/0x80
> [    0.036000]  [<ffffffff810449c9>] fixup_exception+0x39/0x50
> [    0.036000]  [<ffffffff8101658f>] do_general_protection+0x7f/0x150
> [    0.036000]  [<ffffffff816649bf>] general_protection+0x1f/0x30

> [    0.036000]  [<ffffffff81026d9f>] ? init_intel_energy_perf.part.3+0xf/=
0xd0

Isn't it this one?

There's a general bug where we have bogus '?' entries when tracing
through an exception frame, but I think we should fix that
generically.  I have a really ugly patch, and I think that fixing it
better is in Josh's queue.  If we fix it generically, then we get this
benefit everywhere in the kernel.

> [    0.036000]  [<ffffffff8102731f>] init_intel+0xdf/0x2b0
> [    0.036000]  [<ffffffff8102597d>] identify_cpu+0x2ed/0x4f0
> [    0.036000]  [<ffffffff81cdc1b8>] identify_boot_cpu+0x10/0x7a
> [    0.036000]  [<ffffffff81cdc256>] check_bugs+0x9/0x2d
> [    0.036000]  [<ffffffff81cd1ece>] start_kernel+0x3bd/0x3d9
> [    0.036000]  [<ffffffff81cd1294>] x86_64_start_reservations+0x2f/0x31
> [    0.036000]  [<ffffffff81cd13fe>] x86_64_start_kernel+0x168/0x176
> [    0.036007] ---[ end trace df7f3cc4a52dae6d ]---
>
>> I have no fundamental issue adding ip to this, but let's keep it
>> WARN_ONCE (so we notice loudly and so we get the call trace)
>
> Bah, I'm sceptical about that.

I'm not.  If %pF points at some silly helper, we still want the frames belo=
w it.

>
>> and use %pF or whatever it's called instead of %lx.
>
> Ok.
>
>> Also, I want to add a variant of WARN that takes pt_regs as parameters
>> at some point.  You'd get much better output.  Even without that, Josh
>> Poimboeuf and I (mainly Josh) have some work slowly afoot that will
>> greatly improve call trace quality when crossing an exception
>> boundary.
>
> Yes, because that call trace is almost worthless to me as the function
> which actually causes it - init_intel_energy_perf - is not even on the
> current stack frame.
>
> And we don't really need the whole trace - we just need to be able to
> say:
>
> unchecked MSR access error: RDMSR from 0x1b0 at rIP: 0xffffffff81026d9f (=
init_intel_energy_perf.part.3)
>
> and that function name in there could probably be looked up with
> kallsyms by doing something like "get me the function name containing
> this rIP".
>
>  (I haven't even looked whether that's doable but it should be).

%pF.

--Andy

--===============5434984243179818963==--

