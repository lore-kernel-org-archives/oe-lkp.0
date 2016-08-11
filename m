Content-Type: multipart/mixed; boundary="===============7309127961822863482=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Thu, 11 Aug 2016 12:51:31 -0700
Message-ID: <CA+55aFzdnCDcf8nVtMTX7XiEoZVUqFahVA7kdns5aGKBWFqn3Q@mail.gmail.com>
In-Reply-To: <874m6ryz0u.fsf@yhuang-mobile.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7309127961822863482==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 11, 2016 at 10:51 AM, Huang, Ying <ying.huang@intel.com> wrot=
e:
>>
>
> Here is the test result for the debug patch.  It appears that the aim7
> score is a little better, but the regression is not recovered.

Ok. It does seem to also reset the active file page counts back, so
that part did seem to be related, but yeah, from a performance
standpoint that was clearly not a major issue.

Let's hope Dave can figure out something based on his numbers, because
I'm out of ideas. Or maybe it's the pagefault-atomic thing that
Christoph was looking at.

                Linus

--===============7309127961822863482==--

