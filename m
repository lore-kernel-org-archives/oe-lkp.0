Content-Type: multipart/mixed; boundary="===============2000702611419254799=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] vmstat: allocate vmstat_wq before it is used
Date: Fri, 08 Jan 2016 16:13:56 -0800
Message-ID: <CA+55aFxGty1okA9wwsGH7vjr89T6ZTOTjHHp+1OH8dZkj=3JwA@mail.gmail.com>
In-Reply-To: <1452248309-17930-1-git-send-email-mhocko@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============2000702611419254799==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 8, 2016 at 2:18 AM, Michal Hocko <mhocko@kernel.org> wrote:
>
> I am not marking this for stable because I hope we can sneak it into 4.4.
> The patch is trivial and obvious.

Was there confirmation this fixed the issue? Just verifying..

               Linus

--===============2000702611419254799==--

