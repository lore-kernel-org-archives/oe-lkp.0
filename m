Content-Type: multipart/mixed; boundary="===============7225906990750634004=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] vmstat: allocate vmstat_wq before it is used
Date: Sun, 10 Jan 2016 21:06:58 +0100
Message-ID: <20160110200657.GA23686@dhcp22.suse.cz>
In-Reply-To: <CA+55aFySZnN0B1rO4iOnFBfAHStzBZS1v8dans1wTn1Uv6Qmtw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7225906990750634004==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri 08-01-16 16:16:37, Linus Torvalds wrote:
> On Fri, Jan 8, 2016 at 4:13 PM, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > Was there confirmation this fixed the issue? Just verifying..
> =

> Oh, and Tetsuo claims that it needs a cc stable regardless, because
> the commit that caused this to appear was marked for stable and
> already got backported. Yes?

Yes, I have missed that the original patch got backported to 3.2 stable
tree. I do not see it in other branches.

Thanks!
-- =

Michal Hocko
SUSE Labs

--===============7225906990750634004==--

