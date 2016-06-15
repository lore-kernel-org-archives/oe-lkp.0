Content-Type: multipart/mixed; boundary="===============3120269312372109264=="
MIME-Version: 1.0
From: Borislav Petkov <bp@alien8.de>
To: lkp@lists.01.org
Subject: Re: [x86] 5ac0c41bf3: WARNING: CPU: 0 PID: 0 at arch/x86/mm/extable.c:50 ex_handler_rdmsr_unsafe
Date: Wed, 15 Jun 2016 20:07:22 +0200
Message-ID: <20160615180722.GG30309@pd.tnic>
In-Reply-To: <CALCETrVcw+t+w0T6FmXffY3Y=XHUpA0JUgzzPOyKybHXyOPa+Q@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3120269312372109264==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 15, 2016 at 10:55:34AM -0700, Andy Lutomirski wrote:
> Isn't it this one?

Yes, it is.

> I'm not.  If %pF points at some silly helper, we still want the frames be=
low it.

Why silly helper? It points to the rIP where the *MSR instruction is.
Can't get more precise than that.

And yes, %pF is better:

[    0.030879] unchecked MSR access error: RDMSR from 0x1b0 at rIP: 0xfffff=
fff81026d9f (init_intel_energy_perf.part.3+0xf/0xd0)

Ok, I'll send a patch.

-- =

Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.

--===============3120269312372109264==--

