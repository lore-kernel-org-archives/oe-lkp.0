Content-Type: multipart/mixed; boundary="===============5087023373685069839=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] powerpc: secondary CPUs signal to master before setting active and online (fixes kernel BUG at kernel/smpboot.c:134!)
Date: Tue, 09 Dec 2014 12:54:43 -0800
Message-ID: <CA+55aFyR5PzNkojvEej1NXnpEFOPOYfnxCcPDAjg1rE79tQv7A@mail.gmail.com>
In-Reply-To: <20141209105819.0e847b4b@kryten>
List-Id: <oe-lkp.lists.linux.dev>

--===============5087023373685069839==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 8, 2014 at 3:58 PM, Anton Blanchard <anton@samba.org> wrote:
> Hi Ingo,
>
>> At that point I thought the previous task_cpu() was somewhat ingrained
>> in the scheduler and came up with the patch. If not, we could go on a
>> hunt to see what else needs fixing.
>
> I had another look. The scheduled does indeed make assumptions about the
> previous task_cpu, but we have a hammer to fix it up called
> select_fallback_rq.
>
> I annotated select_fallback_rq, and did hit a case where the CPU was
> not active. ppc64 patch below.

Anton, I'll assume I will get this through the usual powerpc pull requests?

> I think x86 have a similar (although harder to hit) issue.

Ingo?

                         Linus

--===============5087023373685069839==--

