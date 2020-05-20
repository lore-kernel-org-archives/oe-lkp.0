Content-Type: multipart/mixed; boundary="===============0205645975049913336=="
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
To: lkp@lists.01.org
Subject: Re: [rcu] 2f08469563: BUG:kernel_reboot-without-warning_in_boot_stage
Date: Wed, 20 May 2020 09:32:43 -0700
Message-ID: <CAKwvOd=ga4cjJCQASVH=Vwjkk5_Qh7b_TtoTSBBoLiMENL8hOQ@mail.gmail.com>
In-Reply-To: <CANpmjNOeXmD5E3O50Z3MjkiuCYaYOPyi+1rq=GZvEKwBvLR0Ug@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0205645975049913336==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2020 at 11:32 AM Marco Elver <elver@google.com> wrote:
>
> This fixes the problem:
> https://lkml.kernel.org/r/20200519182459.87166-1-elver(a)google.com
>
> I suppose there are several things that happened that caused the above
> bisected changes to trigger this. Hard to say how exactly the above
> bisected changes caused this to manifest, because during early boot
> (while uninitialized) KASAN may just randomly enter kasan_report()
> before the branch (annotated with likely(), which is caught by the
> branch tracer) prevents it from actually generating a report. However,
> if it goes branch tracer -> KASAN -> branch tracers -> KASAN ..., then
> we crash. If I had to guess some combination of different code gen,
> different stack and/or data usage. So all the above bisected changes
> (AFAIK) were red herrings. :-)

Thanks for chasing to resolution.  Consider using a variable to store
a list of flags, as that code (before your patch) invokes the compiler
multiple times to answer the same question.
-- =

Thanks,
~Nick Desaulniers
--===============0205645975049913336==--

