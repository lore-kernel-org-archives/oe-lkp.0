Content-Type: multipart/mixed; boundary="===============5998425839312026667=="
MIME-Version: 1.0
From: Al Viro <viro@ZenIV.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [dcache_{readdir, dir_lseek}() users] 4e82901cd6: reaim.jobs_per_min -49.1% regression
Date: Sun, 26 Jun 2016 19:06:04 +0100
Message-ID: <20160626180604.GW14480@ZenIV.linux.org.uk>
In-Reply-To: <CA+55aFyxRDs6uC=ppoSyf_zLOd3NP-uEKgOKZSNh5papGrszPg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5998425839312026667==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 26, 2016 at 10:13:32AM -0700, Linus Torvalds wrote:
> On Sun, Jun 26, 2016 at 2:50 AM, Thorsten Leemhuis
> <regressions@leemhuis.info> wrote:
> >
> > Al, what's the status here? This made it on my 4.7 regressions report
> > due to the "regression" keyword in the subject.
> =

> I don't think the tmpfs locking is going to get changed for 4.7. This
> issue will likely only show up for some very specific microbenchmarks,
> and the lockless next_positive one is likely too invasive for this
> stage. So the problem is fixable, and not serious enough to worry
> about for 4.7.

FWIW, #work.dcache_readdir in vfs.git seems to recover the performance.
Not sure if it's worth pushing right now, but if it ends up the next
cycle stuff, I think it'll be worth Cc:stable.

--===============5998425839312026667==--

