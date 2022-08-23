Content-Type: multipart/mixed; boundary="===============5965116184669954088=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@suse.com>
To: lkp@lists.01.org
Subject: Re: [PATCH 1/3] mm: page_counter: remove unneeded atomic ops for low/min
Date: Tue, 23 Aug 2022 11:42:27 +0200
Message-ID: <YwShA6npuK0ZsjPI@dhcp22.suse.cz>
In-Reply-To: <YwOeocdkF/lacpKn@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============5965116184669954088==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon 22-08-22 17:20:02, Michal Hocko wrote:
> On Mon 22-08-22 07:55:58, Shakeel Butt wrote:
> > On Mon, Aug 22, 2022 at 3:18 AM Michal Hocko <mhocko@suse.com> wrote:
[...]
> > > Unless I have missed anything this shouldn't break the correctness bu=
t I
> > > still have to think about the proportional distribution of the
> > > protection because that adds to the complexity here.
> > =

> > The patch is not changing any semantics. It is just removing an
> > unnecessary atomic xchg() for a specific scenario (min > 0 && min <
> > usage). I don't think there will be any change related to proportional
> > distribution of the protection.
> =

> Yes, I suspect you are right. I just remembered previous fixes
> like 503970e42325 ("mm: memcontrol: fix memory.low proportional
> distribution") which just made me nervous that this is a tricky area.
> =

> I will have another look tomorrow with a fresh brain and send an ack.

I cannot spot any problem. But I guess it would be good to have a little
comment to explain that races on the min_usage update (mentioned by Roman)
are acceptable and savings from atomic update are preferred.

The worst case I can imagine would be something like uncharge 4kB racing
with charge 2MB. The first reduces the protection (min_usage) while the oth=
er one
misses that update and doesn't increase it. But even then the effect
shouldn't be really large. At least I have hard time imagine this would
throw things off too much.
-- =

Michal Hocko
SUSE Labs
--===============5965116184669954088==--

