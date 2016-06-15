Content-Type: multipart/mixed; boundary="===============0313303263420439271=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@amacapital.net>
To: lkp@lists.01.org
Subject: Re: [x86] 5ac0c41bf3: WARNING: CPU: 0 PID: 0 at arch/x86/mm/extable.c:50 ex_handler_rdmsr_unsafe
Date: Wed, 15 Jun 2016 10:23:39 -0700
Message-ID: <CALCETrVSwjcjZG1HWnwrs1j3iLTpUgEdt3xsQQ=PG8XDWRgobw@mail.gmail.com>
In-Reply-To: <20160615142532.GE32588@pd.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============0313303263420439271==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Jun 15, 2016 7:25 AM, "Borislav Petkov" <bp@alien8.de> wrote:
>
> On Wed, Jun 15, 2016 at 08:25:57PM +0800, kernel test robot wrote:
> > [    0.556833] Mountpoint-cache hash table entries: 1024 (order: 0, 409=
6 bytes)
> > [    0.559888] ------------[ cut here ]------------
> > [    0.559888] ------------[ cut here ]------------
> > [    0.561405] WARNING: CPU: 0 PID: 0 at arch/x86/mm/extable.c:50 ex_ha=
ndler_rdmsr_unsafe+0x44/0x70
> > [    0.561405] WARNING: CPU: 0 PID: 0 at arch/x86/mm/extable.c:50 ex_ha=
ndler_rdmsr_unsafe+0x44/0x70
> > [    0.567649] unchecked MSR access error: RDMSR from 0x1b0
> > [    0.567649] unchecked MSR access error: RDMSR from 0x1b0
>
> Btw, Andy, this error message is completely useless - I
> wanna know *where* the RDMSR in the code is, not point me at
> ex_handler_rdmsr_unsafe().

Did the "Call Trace" not show up?

>
> IOW, I wanna convert the current thing into this:
>
> [    0.028003] unchecked MSR access error: RDMSR from 0x1b0 at rIP: 0xfff=
fffff81026d9f
> [    0.030343] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
> [    0.032003] ENERGY_PERF_BIAS: View and update with x86_energy_perf_pol=
icy(8)
> [    0.036003] unchecked MSR access error: WRMSR to 0x1b0 (tried to write=
 0x0000000000000006) at rIP: 0xffffffff81026de1
>
> i.e.,
>
> ---
> diff --git a/arch/x86/mm/extable.c b/arch/x86/mm/extable.c
> index 4bb53b89f3c5..2028a5ad3433 100644
> --- a/arch/x86/mm/extable.c
> +++ b/arch/x86/mm/extable.c
> @@ -46,8 +46,8 @@ EXPORT_SYMBOL(ex_handler_ext);
>  bool ex_handler_rdmsr_unsafe(const struct exception_table_entry *fixup,
>                              struct pt_regs *regs, int trapnr)
>  {
> -       WARN_ONCE(1, "unchecked MSR access error: RDMSR from 0x%x\n",
> -                 (unsigned int)regs->cx);
> +       pr_warn_once("unchecked MSR access error: RDMSR from 0x%x at rIP:=
 0x%lx\n",
> +                    (unsigned int)regs->cx, regs->ip);

I have no fundamental issue adding ip to this, but let's keep it
WARN_ONCE (so we notice loudly and so we get the call trace) and use
%pF or whatever it's called instead of %lx.

Also, I want to add a variant of WARN that takes pt_regs as parameters
at some point.  You'd get much better output.  Even without that, Josh
Poimboeuf and I (mainly Josh) have some work slowly afoot that will
greatly improve call trace quality when crossing an exception
boundary.

--Andy

--===============0313303263420439271==--

