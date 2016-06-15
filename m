Content-Type: multipart/mixed; boundary="===============7593996000678842409=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@amacapital.net>
To: lkp@lists.01.org
Subject: Re: [x86] 5ac0c41bf3: WARNING: CPU: 0 PID: 0 at arch/x86/mm/extable.c:50 ex_handler_rdmsr_unsafe
Date: Wed, 15 Jun 2016 11:44:48 -0700
Message-ID: <CALCETrV6OLQJHcEy4WBnn7QW4=b3_zW-9DR7OGNoUhyQKpKk_w@mail.gmail.com>
In-Reply-To: <20160615182332.GI30309@pd.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============7593996000678842409==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 15, 2016 at 11:23 AM, Borislav Petkov <bp@alien8.de> wrote:
> On Wed, Jun 15, 2016 at 11:12:37AM -0700, Andy Lutomirski wrote:
>> I want to see actual_problem in the log.
>
> So the optimal thing to do for that is to return an error to the calling
> site which says "exception got handled" and then the *calling* site can
> dump_stack().
>
> And the old code did that:
>
> static inline unsigned long long native_read_msr_safe(unsigned int msr,
>                                                       int *err)
> {
>         DECLARE_ARGS(val, low, high);
>
>         asm volatile("2: rdmsr ; xor %[err],%[err]\n"
>                      "1:\n\t"
>                      ".section .fixup,\"ax\"\n\t"
>                      "3:  mov %[fault],%[err] ; jmp 1b\n\t"
>                      ".previous\n\t"
>                      _ASM_EXTABLE(2b, 3b)
>                      : [err] "=3Dr" (*err), EAX_EDX_RET(val, low, high)
>                      : "c" (msr), [fault] "i" (-EIO));
>                                                 ^^^^
>

Then we end up with bloat.  The current thing generates very compact code.

--Andy

--===============7593996000678842409==--

