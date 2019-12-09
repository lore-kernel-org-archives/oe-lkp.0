Content-Type: multipart/mixed; boundary="===============3405302557367129706=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [pipe] 3c0edea9b2: lmbench3.PIPE.bandwidth.MB/sec -17.0% regression
Date: Mon, 09 Dec 2019 10:35:35 -0800
Message-ID: <CAHk-=whF0mbvWC=sYKWTrpymmjWkGZcX9hnHgnm1t1M++W66zA@mail.gmail.com>
In-Reply-To: <20191209085559.GA5868@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============3405302557367129706==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 9, 2019 at 12:56 AM Michal Hocko <mhocko@kernel.org> wrote:
>
> Huh. How can something like that can even can get merged? No changelog,
> no s-o-b?

Yeah, I missed that when pulling.

I wish that had been the only problem we had with that code, but it wasn't.

Anyway, I'm fairly certain the current git head should fix this
lmbench3 performance regression too.

                   Linus
--===============3405302557367129706==--

