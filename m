Content-Type: multipart/mixed; boundary="===============1660916217091362901=="
MIME-Version: 1.0
From: Craig Bergstrom <craigb@google.com>
To: lkp@lists.01.org
Subject: Re: ce56a86e2a ("x86/mm: Limit mmap() of /dev/mem to valid physical addresses"): kernel BUG at arch/x86/mm/physaddr.c:79!
Date: Fri, 27 Oct 2017 13:28:56 -0600
Message-ID: <CAOJUGydTX7A=1-ZnODDJ+qAMbvFeb1TabLRKKx9BaLmDUOSj6Q@mail.gmail.com>
In-Reply-To: <20171027192417.d2x4cy6ra7fghjzw@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1660916217091362901==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Sounds good.  Thanks for the context.

I'll keep this on my plate and I'll turn something around once I've
had a chance to test a bit, probably next week.

On Fri, Oct 27, 2017 at 1:24 PM, Ingo Molnar <mingo@kernel.org> wrote:
>
> * Craig Bergstrom <craigb@google.com> wrote:
>
>> Reverting seems like the right approach at the moment.  My apologies
>> for the breakage so late the in the cycle.
>
> Note that there's no need for you to apologize and you carry exactly zero=
 amount
> of blame for the late-cycle breakage: it was my decision to send it to Li=
nus so
> quickly, you never asked for it to be sent upstream on such a short notic=
e.
>
> ( Classic "patch makes sense, looks good, other arches ar doing this too,=
 and I
>   tested it myself too on multiple systems, so it must be obviously fine =
for
>   everyone" moment. )
>
> Your change still makes sense from a robustness POV, so please send it ag=
ain with
> the suggested fixes - and I'll be more careful with the upstream merge th=
is time.
>
> Thanks,
>
>         Ingo

--===============1660916217091362901==--

