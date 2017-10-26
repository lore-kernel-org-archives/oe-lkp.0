Content-Type: multipart/mixed; boundary="===============7795232442802358981=="
MIME-Version: 1.0
From: Craig Bergstrom <craigb@google.com>
To: lkp@lists.01.org
Subject: Re: ce56a86e2a ("x86/mm: Limit mmap() of /dev/mem to valid physical addresses"): kernel BUG at arch/x86/mm/physaddr.c:79!
Date: Thu, 26 Oct 2017 11:49:50 -0600
Message-ID: <CAOJUGycO494NcvJk89MMub9Tbrj6FUoSNN4SOci7NgJRKq7v=A@mail.gmail.com>
In-Reply-To: <20171026163911.dnovh4zaik5qumtt@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7795232442802358981==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Sander, thanks for the details, they've been very useful.

I suspect that your host system's mem=3D2048M parameter is causing the
problem.  Any chance you can confirm by removing the parameter and
running the guest code path?

More specifically, since you're telling the kernel that it's high
memory address is at 2048M and your device is at 0xfe1fe000 (~4G), the
new mmap() limits are preventing you from mapping addresses that are
explicitly disallowed by the parameter.



On Thu, Oct 26, 2017 at 10:39 AM, Ingo Molnar <mingo@kernel.org> wrote:
>
> * Craig Bergstrom <craigb@google.com> wrote:
>
>> Yes, not much time left for 4.14, it might be reasonable to pull the
>> change out since it's causing problems. [...]
>
> Ok, I'll queue up a revert tomorrow morning and send it to Linus ASAP if =
there's
> no good fix by then. In hindsight I should have queued it for v4.15 ...
>
> Thanks,
>
>         Ingo

--===============7795232442802358981==--

