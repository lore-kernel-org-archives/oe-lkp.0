Content-Type: multipart/mixed; boundary="===============2362583281668832776=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [dcache_{readdir, dir_lseek}() users] 4e82901cd6: reaim.jobs_per_min -49.1% regression
Date: Sun, 26 Jun 2016 10:13:32 -0700
Message-ID: <CA+55aFyxRDs6uC=ppoSyf_zLOd3NP-uEKgOKZSNh5papGrszPg@mail.gmail.com>
In-Reply-To: <d7cc4340-7a21-f862-bce1-c3dd395bd926@leemhuis.info>
List-Id: <oe-lkp.lists.linux.dev>

--===============2362583281668832776==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 26, 2016 at 2:50 AM, Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> Al, what's the status here? This made it on my 4.7 regressions report
> due to the "regression" keyword in the subject.

I don't think the tmpfs locking is going to get changed for 4.7. This
issue will likely only show up for some very specific microbenchmarks,
and the lockless next_positive one is likely too invasive for this
stage. So the problem is fixable, and not serious enough to worry
about for 4.7.

             Linus

--===============2362583281668832776==--

