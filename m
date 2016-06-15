Content-Type: multipart/mixed; boundary="===============2828790981885629786=="
MIME-Version: 1.0
From: Borislav Petkov <bp@alien8.de>
To: lkp@lists.01.org
Subject: Re: [x86] 5ac0c41bf3: WARNING: CPU: 0 PID: 0 at arch/x86/mm/extable.c:50 ex_handler_rdmsr_unsafe
Date: Wed, 15 Jun 2016 20:23:32 +0200
Message-ID: <20160615182332.GI30309@pd.tnic>
In-Reply-To: <CALCETrUoV9AbpTaQa_TmnEncogsMRmVvpyX0pBp6gxy8252JUw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2828790981885629786==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 15, 2016 at 11:12:37AM -0700, Andy Lutomirski wrote:
> I want to see actual_problem in the log.

So the optimal thing to do for that is to return an error to the calling
site which says "exception got handled" and then the *calling* site can
dump_stack().

And the old code did that:

static inline unsigned long long native_read_msr_safe(unsigned int msr,
                                                      int *err)
{
        DECLARE_ARGS(val, low, high);

        asm volatile("2: rdmsr ; xor %[err],%[err]\n"
                     "1:\n\t"
                     ".section .fixup,\"ax\"\n\t"
                     "3:  mov %[fault],%[err] ; jmp 1b\n\t"
                     ".previous\n\t"
                     _ASM_EXTABLE(2b, 3b)
                     : [err] "=3Dr" (*err), EAX_EDX_RET(val, low, high)
                     : "c" (msr), [fault] "i" (-EIO));
						^^^^


-- =

Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.

--===============2828790981885629786==--

